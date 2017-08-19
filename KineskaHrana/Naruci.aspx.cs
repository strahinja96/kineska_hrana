using KineskaHrana.BusinessLayer;
using KineskaHrana.BusinessLayer.JelaOperacije;
using KineskaHrana.BusinessLayer.NarudzbineOperacije;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KineskaHrana
{
    public partial class Naruci : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["idKorisnik"] == null)
            {
                this.nisteUlogovani.Visible = true;
                this.naruciTabela.Visible = false;
                this.GridView1.Visible = false;
            }
            else {
                this.uspesnoNaruceno.Visible = false;
                this.nisteUlogovani.Visible = false;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            
            if (Page.IsValid)
            {
                DateTime vreme = DateTime.Now;
                int idKorisnik = Convert.ToInt32(Session["idKorisnik"]);
                string ime = tbIme.Text;
                string prezime = tbPrezime.Text;
                string adresa = tbAdresa.Text;
                List<ListItem> selected = new List<ListItem>();
                OpNarudzbinaInsert op = new OpNarudzbinaInsert();
                OperacijaRezultat rez;
                decimal totalCena = 0;
                foreach (ListItem item in CheckBoxList1.Items) { 
                    if (item.Selected)
                    {
                        int idJelo = Convert.ToInt32(item.Value);
                        OpJeloSelect op2 = new OpJeloSelect();
                        op2.DatiId = true;
                        op2.IdJeloSelekcija = idJelo;
                        OperacijaRezultat rez2 = OperationManager.Singleton.izvrsiOperaciju(op2);
                        JeloDb[] jela = (JeloDb[])rez2.DbItems;
                        decimal cena;
                        if (jela.Length == 1)
                        {
                            cena = jela[0].Cena;
                        }
                        else
                        {
                            return;
                        }
                        //pravi objekat za selekciju jela sa datim id, uzima se njegova cena

                        op.NarudzbinaObj = new NarudzbinaDb();
                        op.NarudzbinaObj.Vreme = vreme;
                        op.NarudzbinaObj.IdKorisnik = idKorisnik;
                        op.NarudzbinaObj.Ime = ime;
                        op.NarudzbinaObj.Prezime = prezime;
                        op.NarudzbinaObj.Adresa = adresa;
                        op.NarudzbinaObj.Cena = cena;
                        op.NarudzbinaObj.IdJelo = idJelo;

                        rez = OperationManager.Singleton.izvrsiOperaciju(op);

                        totalCena += cena;
                    }
                }

                this.naruciTabela.Visible = false;
                this.uspesnoNaruceno.InnerHtml = "Uspesno ste narucili! Cena vase narudzbine je: "+totalCena+" RSD.";
                this.uspesnoNaruceno.Visible = true;
            }
            else {
                return;
            }
        }

        
    }
}