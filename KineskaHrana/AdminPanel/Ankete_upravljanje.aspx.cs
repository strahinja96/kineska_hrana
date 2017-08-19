using KineskaHrana.BusinessLayer;
using KineskaHrana.BusinessLayer.AnketaOperacije;
using KineskaHrana.BusinessLayer.DogadjajiOperacije;
using KineskaHrana.BusinessLayer.OdgovoriOperacije;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KineskaHrana.Admin_Panel
{
    public partial class Ankete_upravljanje : System.Web.UI.Page
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

        protected void linkUnesi_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string aktivnaStr = ((DropDownList)GridView1.FooterRow.FindControl("DropDownList3")).SelectedValue;
                int aktivna = Convert.ToInt32(aktivnaStr);

                if (aktivna == 1){
                    OpAnketaPostaviNeaktivne neaktivne = new OpAnketaPostaviNeaktivne();

                    OperacijaRezultat rez1 = OperationManager.Singleton.izvrsiOperaciju(neaktivne);
                }


                SqlDataSource1.InsertParameters["pitanje"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("unesiPitanje")).Text;
                SqlDataSource1.InsertParameters["aktivna"].DefaultValue = ((DropDownList)GridView1.FooterRow.FindControl("DropDownList3")).SelectedValue;

                SqlDataSource1.Insert();

                int idKorisnik = Convert.ToInt32(Session["idKorisnik"]);
                OpDogadjajInsert op = new OpDogadjajInsert();
                op.DogadjajObj = new DogadjajDb();
                op.DogadjajObj.IdKorisnik = idKorisnik;
                op.DogadjajObj.DogadjajOpis = "Korisnik je uneo novu anketu!";
                op.DogadjajObj.Vreme = DateTime.Now;

                OperacijaRezultat rez = OperationManager.Singleton.izvrsiOperaciju(op);
            }

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string aktivnaStr = ((DropDownList)GridView1.FooterRow.FindControl("DropDownList3")).SelectedValue;
            int aktivna = Convert.ToInt32(aktivnaStr);

            if (aktivna == 1)
            {
                OpAnketaPostaviNeaktivne neaktivne = new OpAnketaPostaviNeaktivne();

                OperacijaRezultat rez1 = OperationManager.Singleton.izvrsiOperaciju(neaktivne);
            }

            int idKorisnik = Convert.ToInt32(Session["idKorisnik"]);

            Label idLabela = (Label)GridView1.Rows[e.RowIndex].FindControl("Label1");
            int identifikator = Convert.ToInt32(idLabela.Text);
            OpDogadjajInsert op = new OpDogadjajInsert();
            op.DogadjajObj = new DogadjajDb();
            op.DogadjajObj.IdKorisnik = idKorisnik;
            op.DogadjajObj.DogadjajOpis = "Korisnik je izmenio anketu sa identifikatorom " + identifikator + "!";
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
            op.DogadjajObj.DogadjajOpis = "Korisnik je obrisao anketu sa identifikatorom "+identifikator+"!";
            op.DogadjajObj.Vreme = DateTime.Now;

            OperacijaRezultat rez = OperationManager.Singleton.izvrsiOperaciju(op);


            OpOdgovoriAnketeDelete op2 = new OpOdgovoriAnketeDelete();
            op2.Id = identifikator;
            OperacijaRezultat rez2 = OperationManager.Singleton.izvrsiOperaciju(op2);

        }




        protected void linkUnesiOdgovor_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                SqlDataSource2.InsertParameters["odgovor"].DefaultValue = ((TextBox)GridView2.FooterRow.FindControl("tbOdgovor")).Text;
                SqlDataSource2.InsertParameters["idAnketa"].DefaultValue = ((DropDownList)GridView2.FooterRow.FindControl("DropDownList4")).SelectedValue;
                SqlDataSource2.InsertParameters["brojGlasova"].DefaultValue = ((TextBox)GridView2.FooterRow.FindControl("tbBrojGlasova")).Text;

                SqlDataSource2.Insert();

                int idKorisnik = Convert.ToInt32(Session["idKorisnik"]);
                OpDogadjajInsert op = new OpDogadjajInsert();
                op.DogadjajObj = new DogadjajDb();
                op.DogadjajObj.IdKorisnik = idKorisnik;
                op.DogadjajObj.DogadjajOpis = "Korisnik je uneo nov odgovor!";
                op.DogadjajObj.Vreme = DateTime.Now;

                OperacijaRezultat rez = OperationManager.Singleton.izvrsiOperaciju(op);
            }
        }

        protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int idKorisnik = Convert.ToInt32(Session["idKorisnik"]);

            Label idLabela = (Label)GridView2.Rows[e.RowIndex].FindControl("Label1");
            int identifikator = Convert.ToInt32(idLabela.Text);
            OpDogadjajInsert op = new OpDogadjajInsert();
            op.DogadjajObj = new DogadjajDb();
            op.DogadjajObj.IdKorisnik = idKorisnik;
            op.DogadjajObj.DogadjajOpis = "Korisnik je obrisao odgovor sa identifikatorom " + identifikator + "!";
            op.DogadjajObj.Vreme = DateTime.Now;

            OperacijaRezultat rez = OperationManager.Singleton.izvrsiOperaciju(op);
        }

        protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int idKorisnik = Convert.ToInt32(Session["idKorisnik"]);

            Label idLabela = (Label)GridView2.Rows[e.RowIndex].FindControl("Label1");
            int identifikator = Convert.ToInt32(idLabela.Text);
            OpDogadjajInsert op = new OpDogadjajInsert();
            op.DogadjajObj = new DogadjajDb();
            op.DogadjajObj.IdKorisnik = idKorisnik;
            op.DogadjajObj.DogadjajOpis = "Korisnik je promenio odgovor sa identifikatorom " + identifikator + "!";
            op.DogadjajObj.Vreme = DateTime.Now;

            OperacijaRezultat rez = OperationManager.Singleton.izvrsiOperaciju(op);
        }
    }
}