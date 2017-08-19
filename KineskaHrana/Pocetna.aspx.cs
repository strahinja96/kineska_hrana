using KineskaHrana.BusinessLayer;
using KineskaHrana.BusinessLayer.GalerijaOperacije;
using KineskaHrana.BusinessLayer.JelaOperacije;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KineskaHrana
{
    public partial class Pocetna : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            OpJeloSelect op = new OpJeloSelect();
            OperacijaRezultat rez = OperationManager.Singleton.izvrsiOperaciju(op);

            if ((rez == null) || (!rez.Status))
            {
                return;
            }
            else
            {
                JeloDb[] jela = (JeloDb[])rez.DbItems;

                this.popuniJelovnik(jela);

                this.popuniSlider();

            }
        }

        public void popuniJelovnik(JeloDb[] jela) {
            this.jelovnikDiv.InnerHtml = "";
            for (int i = 0; i < jela.Length; i++) {
                this.jelovnikDiv.InnerHtml += "<div class='container30 right tekstCentar'> <h4>"+ jela[i].NazivJelo +"</h4> <div class='container50 centerDiv'> <img src='"+ jela[i].Slika +"' /> </div> <p>" + jela[i].Cena.ToString() + " RSD</p> </div>";
            }
        }

        public void popuniSlider() {
            OpGalerijaSelect gal = new OpGalerijaSelect();
            OperacijaRezultat rez = OperationManager.Singleton.izvrsiOperaciju(gal);

            GalerijaDb[] slike = (GalerijaDb[])rez.DbItems;

            foreach (GalerijaDb slika in slike) { 
                this.sliderUl.InnerHtml+="<li><img src='"+slika.Putanja_slike+"' alt='"+slika.Ime_slike+"'/></li>";
            }
        }
    }
}