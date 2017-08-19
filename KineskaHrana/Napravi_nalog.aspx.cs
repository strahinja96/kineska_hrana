using KineskaHrana.BusinessLayer;
using KineskaHrana.BusinessLayer.KorisniciOperacije;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KineskaHrana
{
    public partial class Napravi_nalog : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["idKorisnik"] != null)
            {
                Response.Redirect("Pocetna.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string username = this.tbUsername.Text;
                string password = this.tbPassword.Text;
                string email = this.tbEmail.Text;

                OpKorisniciInsert op = new OpKorisniciInsert();
                KorisnikDb korisnik = new KorisnikDb();
                korisnik.Username = username;
                korisnik.Password = password;
                korisnik.Email = email;
                korisnik.IdUloga = 2;

                op.KorisnikObj = korisnik;
                OperacijaRezultat rez = OperationManager.Singleton.izvrsiOperaciju(op);

                if ((rez == null) || (!rez.Status))
                {
                    return;
                }
                else {
                    OpKorisniciSelect op2 = new OpKorisniciSelect();
                    op2.KriterijumLogovanje = new KriterijumLogovanje();
                    op2.KriterijumLogovanje.username = username;
                    op2.KriterijumLogovanje.password = password;

                    OperacijaRezultat rez2 = OperationManager.Singleton.izvrsiOperaciju(op2);

                    if ((rez2 == null) || (!rez2.Status))
                    {
                        return;
                    }
                    else
                    {
                        if (rez2.DbItems.Length > 0)
                        {
                            KorisnikDb[] korisnici = rez2.DbItems.Cast<KorisnikDb>().ToArray();
                            Session["idKorisnik"] = korisnici[0].IdKorisnik;
                            Session["idUloga"] = korisnici[0].IdUloga;
                            Response.Redirect("Naruci.aspx");
                        }
                        else
                        {
                            return;
                        }
                    }
                }
            }
            else {
                return;
            }

            
        }

    }
}