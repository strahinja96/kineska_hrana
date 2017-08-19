using KineskaHrana.BusinessLayer;
using KineskaHrana.BusinessLayer.GalerijaOperacije;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KineskaHrana
{
    public partial class Galerija : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            OpGalerijaSelect op = new OpGalerijaSelect();
            OperacijaRezultat rez = OperationManager.Singleton.izvrsiOperaciju(op);

            if ((rez == null) || (!rez.Status))
            {
                return;
            }
            else
            {
                GalerijaDb[] slike = (GalerijaDb[])rez.DbItems;

                foreach (GalerijaDb slika in slike)
                {
                    this.galleryHolder.InnerHtml += "<div class='container20 left'><a href='" + slika.Putanja_slike + "' data-lightbox='gallery' data-title='" + slika.Ime_slike + "'><img src='" + slika.Putanja_thumbnail + "' alt='" + slika.Ime_slike + "'/></a></div>";
                }
            }
        }
    }
}