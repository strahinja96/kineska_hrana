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
    public partial class Logovanje : System.Web.UI.Page
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
                string username = TextBox1.Text;
                string password = TextBox2.Text;

                OpKorisniciSelect op = new OpKorisniciSelect();
                op.KriterijumLogovanje = new KriterijumLogovanje();
                op.KriterijumLogovanje.username = username;
                op.KriterijumLogovanje.password = password;

                OperacijaRezultat rez = OperationManager.Singleton.izvrsiOperaciju(op);

                if ((rez == null) || (!rez.Status))
                {
                    this.nemaKorisnika.InnerHtml = "U bazi ne postoji korisnik sa tim username-om i password-om.";
                    return;
                }
                else
                {
                    if (rez.DbItems.Length > 0)
                    {
                        KorisnikDb[] korisnik = (KorisnikDb[])rez.DbItems;
                        Session["idKorisnik"] = korisnik[0].IdKorisnik;
                        Session["idUloga"] = korisnik[0].IdUloga;
                        if (Convert.ToInt32(Session["idUloga"]) == 1) { Response.Redirect("/AdminPanel/Admin_panel.aspx"); }
                        else { Response.Redirect("Naruci.aspx"); } 
                    }
                    else {
                        this.nemaKorisnika.InnerHtml = "U bazi ne postoji korisnik sa tim username-om i password-om.";
                        return;
                    }
                }
            }
            else {
                return;
            }
            
        }
    }
}