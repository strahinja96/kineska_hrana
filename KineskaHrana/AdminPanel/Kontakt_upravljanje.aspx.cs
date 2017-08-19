using KineskaHrana.BusinessLayer;
using KineskaHrana.BusinessLayer.DogadjajiOperacije;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KineskaHrana.AdminPanel
{
    public partial class Kontakt_upravljanje : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["idUloga"] != null && (Convert.ToInt32(Session["idUloga"]) == 1))
            {
            }
            else
            {
                Response.Redirect("../Pocetna.aspx");
            }
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int idKorisnik = Convert.ToInt32(Session["idKorisnik"]);

            Label idLabela = (Label)GridView1.Rows[e.RowIndex].FindControl("Label1");
            int identifikator = Convert.ToInt32(idLabela.Text);
            OpDogadjajInsert op = new OpDogadjajInsert();
            op.DogadjajObj = new DogadjajDb();
            op.DogadjajObj.IdKorisnik = idKorisnik;
            op.DogadjajObj.DogadjajOpis = "Korisnik je izmenio kontakt poruku sa identifikatorom " + identifikator + "!";
            op.DogadjajObj.Vreme = DateTime.Now;

            OperacijaRezultat rez = OperationManager.Singleton.izvrsiOperaciju(op);
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int idKorisnik = Convert.ToInt32(Session["idKorisnik"]);

            Label idLabela = (Label)GridView1.Rows[e.RowIndex].FindControl("Label1");
            int identifikator = Convert.ToInt32(idLabela.Text);
            OpDogadjajInsert op = new OpDogadjajInsert();
            op.DogadjajObj = new DogadjajDb();
            op.DogadjajObj.IdKorisnik = idKorisnik;
            op.DogadjajObj.DogadjajOpis = "Korisnik je obrisao kontakt poruku sa identifikatorom " + identifikator + "!";
            op.DogadjajObj.Vreme = DateTime.Now;

            OperacijaRezultat rez = OperationManager.Singleton.izvrsiOperaciju(op);
        }
    }
}