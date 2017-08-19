using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KineskaHrana.BusinessLayer.GalerijaOperacije
{
    public class GalerijaDb : DbItem
    {
        private int idGalerija;

        public int IdGalerija
        {
            get { return idGalerija; }
            set { idGalerija = value; }
        }
        private string ime_slike, putanja_slike, putanja_thumbnail;

        public string Putanja_thumbnail
        {
            get { return putanja_thumbnail; }
            set { putanja_thumbnail = value; }
        }

        public string Putanja_slike
        {
            get { return putanja_slike; }
            set { putanja_slike = value; }
        }

        public string Ime_slike
        {
            get { return ime_slike; }
            set { ime_slike = value; }
        }
    }

    public class OpGalerijaBase : Operacija
    {
        public override OperacijaRezultat izvrsi(DataLayer.KineskaHranaEntities entiteti)
        {
            IEnumerable<GalerijaDb> ieGalerija;

            ieGalerija = from slike in entiteti.Galerijas
                         select new GalerijaDb
                         {
                             IdGalerija = slike.idSlike,
                             Ime_slike = slike.ime_slike,
                             Putanja_slike = slike.putanja_slike,
                             Putanja_thumbnail = slike.putanja_thumbnail
                         };

            GalerijaDb[] niz = ieGalerija.ToArray();

            OperacijaRezultat obj = new OperacijaRezultat();
            obj.DbItems = niz;
            obj.Status = true;
            return obj;
        }
    }

    public class OpGalerijaSelect : OpGalerijaBase { }

    public class OpGalerijaInsert : OpGalerijaBase {
        private GalerijaDb galerijaObj;

        public GalerijaDb GalerijaObj
        {
            get { return galerijaObj; }
            set { galerijaObj = value; }
        }

        public override OperacijaRezultat izvrsi(DataLayer.KineskaHranaEntities entiteti)
        {
            entiteti.GalerijaInsert(galerijaObj.Ime_slike, galerijaObj.Putanja_slike, galerijaObj.Putanja_thumbnail);
            return base.izvrsi(entiteti);
        }
    }

    public class OpGalerijaUpdate : OpGalerijaBase
    {
        private GalerijaDb galerijaObj;

        public GalerijaDb GalerijaObj
        {
            get { return galerijaObj; }
            set { galerijaObj = value; }
        }

        public override OperacijaRezultat izvrsi(DataLayer.KineskaHranaEntities entiteti)
        {
            entiteti.GalerijaUpdate(galerijaObj.IdGalerija,galerijaObj.Ime_slike, galerijaObj.Putanja_slike, galerijaObj.Putanja_thumbnail);
            return base.izvrsi(entiteti);
        }
    }

    public class OpGalerijaDelete : OpGalerijaBase
    {
        private int idBrisanje;

        public int IdBrisanje
        {
            get { return idBrisanje; }
            set { idBrisanje = value; }
        }

        public override OperacijaRezultat izvrsi(DataLayer.KineskaHranaEntities entiteti)
        {
            entiteti.GalerijaDelete(this.idBrisanje);
            return base.izvrsi(entiteti);
        }
    }
}