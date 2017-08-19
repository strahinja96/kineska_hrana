using KineskaHrana.BusinessLayer;
using KineskaHrana.BusinessLayer.MeniOperacije;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KineskaHrana
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Popuni_meni();
        }

        public void Popuni_meni()
        {
            this.navigacija.InnerHtml = "";
            OpMeniSelect op = new OpMeniSelect();
            op.Sortiranje = true;
            OperacijaRezultat rez = OperationManager.Singleton.izvrsiOperaciju(op);
            if (rez == null || rez.Status == false)
            {
                return;
            }
            else
            {
                MeniDb[] linkovi = (MeniDb[])rez.DbItems;
                foreach (MeniDb link in linkovi)
                {
                    if (link.Naziv == "Login")
                    {
                        if (Session["idKorisnik"] == null)
                        {
                            this.navigacija.InnerHtml += "<li><a href='../" + link.Link + "'>" + link.Naziv + "</a></li>";
                        }
                    }
                    else if (link.Naziv == "Registracija")
                    {
                        if (Session["idKorisnik"] == null)
                        {
                            this.navigacija.InnerHtml += "<li><a href='../" + link.Link + "'>" + link.Naziv + "</a></li>";
                        }
                    }
                    else if (link.Naziv == "Logout")
                    {
                        if (Session["idKorisnik"] != null)
                        {
                            this.navigacija.InnerHtml += "<li><a href='../" + link.Link + "'>" + link.Naziv + "</a></li>";
                        }
                    }
                    else if (link.Naziv == "Admin panel")
                    {
                        if (Session["idUloga"] != null && (Convert.ToInt32(Session["idUloga"]) == 1))
                        {
                            this.navigacija.InnerHtml += "<li><a href='" + link.Link + "'>" + link.Naziv + "</a></li>";
                        }
                    }
                    else
                    {
                        this.navigacija.InnerHtml += "<li><a href='../" + link.Link + "'>" + link.Naziv + "</a></li>";
                    }
                }
            }
        }
    }
}