using KineskaHrana.BusinessLayer;
using KineskaHrana.BusinessLayer.KontaktOperacije;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KineskaHrana
{
    public partial class Kontakt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.uspesanKontakt.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string ime = this.TextBox1.Text;
                string prezime = this.TextBox2.Text;
                string poruka = this.TextBox3.Text;
                string email = this.tbEmail.Text;

                OpKontaktInsert op = new OpKontaktInsert();
                KontaktDb kontakt = new KontaktDb();
                kontakt.Ime = ime;
                kontakt.Prezime = prezime;
                kontakt.Poruka = poruka;
                kontakt.Email = email;

                op.KontaktObj = kontakt;
                OperacijaRezultat rez = OperationManager.Singleton.izvrsiOperaciju(op);

                this.kontaktTabela.Visible = false;
                this.uspesanKontakt.Visible = true;
            }
            else
            {
                return;
            }
        }
    }
}