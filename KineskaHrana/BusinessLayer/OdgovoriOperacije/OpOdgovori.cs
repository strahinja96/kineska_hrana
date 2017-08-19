using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KineskaHrana.BusinessLayer.OdgovoriOperacije
{
    public class OdgovoriDb : DbItem
    {
        private int idOdgovor, idAnketa, brojGlasova;

        public int BrojGlasova
        {
            get { return brojGlasova; }
            set { brojGlasova = value; }
        }

        public int IdAnketa
        {
            get { return idAnketa; }
            set { idAnketa = value; }
        }

        public int IdOdgovor
        {
            get { return idOdgovor; }
            set { idOdgovor = value; }
        }
        private string odgovor;

        public string Odgovor
        {
            get { return odgovor; }
            set { odgovor = value; }
        }
    }

    public class OpOdgovoriBase : Operacija
    {
        IEnumerable<OdgovoriDb> ieOdgovori;

        public override OperacijaRezultat izvrsi(DataLayer.KineskaHranaEntities entiteti)
        {
            ieOdgovori = from odgovori in entiteti.Odgovoris
                         select new OdgovoriDb
                         {
                             IdOdgovor = odgovori.idOdgovor,
                             IdAnketa = odgovori.idAnketa,
                             BrojGlasova = odgovori.brojGlasova,
                             Odgovor = odgovori.odgovor
                         };
            OdgovoriDb[] niz = ieOdgovori.ToArray();
            OperacijaRezultat obj = new OperacijaRezultat();
            obj.DbItems = niz;
            obj.Status = true;
            return obj;
        }
    }

    public class OpOdgovoriSelect : OpOdgovoriBase { }

    public class OpOdgovoriInsert : OpOdgovoriBase
    {
        private OdgovoriDb odgovoriObj;

        public OdgovoriDb OdgovoriObj
        {
            get { return odgovoriObj; }
            set { odgovoriObj = value; }
        }

        public override OperacijaRezultat izvrsi(DataLayer.KineskaHranaEntities entiteti)
        {
            entiteti.OdgovoriInsert(odgovoriObj.Odgovor, odgovoriObj.IdAnketa, odgovoriObj.BrojGlasova);
            return base.izvrsi(entiteti);
        }
    }

    public class OpOdgovoriUpdate : OpOdgovoriBase
    {
        private OdgovoriDb odgovoriObj;

        public OdgovoriDb OdgovoriObj
        {
            get { return odgovoriObj; }
            set { odgovoriObj = value; }
        }

        public override OperacijaRezultat izvrsi(DataLayer.KineskaHranaEntities entiteti)
        {
            entiteti.OdgovoriUpdate(odgovoriObj.IdOdgovor, odgovoriObj.Odgovor, odgovoriObj.IdAnketa, odgovoriObj.BrojGlasova);
            return base.izvrsi(entiteti);
        }
    }

    public class OpOdgovoriDelete : OpOdgovoriBase
    {
        private int id;

        public int Id
        {
            get { return id; }
            set { id = value; }
        }

        public override OperacijaRezultat izvrsi(DataLayer.KineskaHranaEntities entiteti)
        {
            entiteti.OdgovoriDelete(this.id);
            return base.izvrsi(entiteti);
        }
    }

    public class OpOdgovoriAnketeDelete : OpOdgovoriBase
    {
        private int id;

        public int Id
        {
            get { return id; }
            set { id = value; }
        }

        public override OperacijaRezultat izvrsi(DataLayer.KineskaHranaEntities entiteti)
        {
            entiteti.OdgovoriAnketaDelete(this.id);
            return base.izvrsi(entiteti);
        }
    }
}