using KineskaHrana.BusinessLayer;
using KineskaHrana.BusinessLayer.AnketaOperacije;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KineskaHrana
{
    public partial class Anketa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["glasano"] != null && Session["glasano"].Equals(true))
            {
                this.anketaGreska.InnerHtml = "Vec ste glasali u anketi.";
                this.anketaTabela.Visible = false;
            }
            else {
                OpAnketaSelect op = new OpAnketaSelect();
                op.SamoAktivna = true;
                OperacijaRezultat rez = OperationManager.Singleton.izvrsiOperaciju(op);

                if ((rez == null) || (!rez.Status))
                {
                    return;
                }
                else
                {
                    AnketaDb[] ankete = (AnketaDb[])rez.DbItems;

                    string pitanje;
                    int idAnkete;
                    if (ankete.Length == 1)
                    {
                        pitanje = ankete[0].Pitanje;
                        idAnkete = ankete[0].IdAnketa;

                        Label1.Text = pitanje;
                        Label2.Text = idAnkete.ToString();
                    }
                    else
                    {
                        this.anketaTabela.Visible = false;

                        this.anketaGreska.InnerHtml = "Zao nam je, trenutno nema aktivnih anketa. Pokusajte kasnije.";
                        return;
                    }
                }
            }
        }
    }
}