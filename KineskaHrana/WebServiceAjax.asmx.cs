using KineskaHrana.BusinessLayer;
using KineskaHrana.BusinessLayer.AnketaOperacije;
using KineskaHrana.BusinessLayer.JelaOperacije;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;

namespace KineskaHrana
{
    /// <summary>
    /// Summary description for WebServiceAjax
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class WebServiceAjax : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod(EnableSession = true)]
        public void anketaGlasanje(int idOdgovora)
        {
            Session["glasano"] = true;

            OpOdgovorUpdate opUpdate = new OpOdgovorUpdate();
            opUpdate.Glasanje = true;
            opUpdate.OdgovorObj = new OdgovorDb();
            opUpdate.OdgovorObj.IdOdgovor = idOdgovora;
            OperacijaRezultat updateRez = OperationManager.Singleton.izvrsiOperaciju(opUpdate);

            if ((updateRez == null) || (!updateRez.Status))
            {
                //greska
            }
            else
            {
                string poruka = "Uspesno ste glasali!";
                var jsonObj = new JavaScriptSerializer().Serialize(poruka);
                this.Context.Response.ContentType = "application/json; charset=utf-8";
                this.Context.Response.Write(jsonObj);
            }
        }

        [WebMethod]
        public void IzmeniCenu(int idJelo, string BrojKontrole)
        {
            OpJeloSelect opSelect = new OpJeloSelect();
            opSelect.DatiId = true;
            opSelect.IdJeloSelekcija = idJelo;

            OperacijaRezultat rezSelect = OperationManager.Singleton.izvrsiOperaciju(opSelect);

            JeloDb[] jela = (JeloDb[])rezSelect.DbItems;

            decimal novaCena = jela[0].Cena;

            var jsonObj = new JavaScriptSerializer().Serialize(novaCena.ToString() + ";" + BrojKontrole);
            this.Context.Response.ContentType = "application/json; charset=utf-8";
            this.Context.Response.Write(jsonObj);
        }
    }
}
