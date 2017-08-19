using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KineskaHrana.BusinessLayer.AnketaOperacije
{
    public class AnketaDb : DbItem {
        private int idAnketa;

        public int IdAnketa
        {
            get { return idAnketa; }
            set { idAnketa = value; }
        }
        private string pitanje;

        public string Pitanje
        {
            get { return pitanje; }
            set { pitanje = value; }
        }
        private int aktivna;

        public int Aktivna
        {
            get { return aktivna; }
            set { aktivna = value; }
        }
    }

    public class OpAnketaBase : Operacija {
        private bool samoAktivna = false;

        public bool SamoAktivna
        {
            get { return samoAktivna; }
            set { samoAktivna = value; }
        }

        public override OperacijaRezultat izvrsi(DataLayer.KineskaHranaEntities entiteti)
        {
            IEnumerable<AnketaDb> ieAnkete;

            if (samoAktivna)
            {
                ieAnkete = from anketa in entiteti.Anketes
                         where (anketa.aktivna==1)
                         select new AnketaDb
                         {
                             IdAnketa=anketa.idAnketa,
                             Pitanje=anketa.pitanje,
                             Aktivna=anketa.aktivna,
                         };
            }
            else
            {
                ieAnkete = from anketa in entiteti.Anketes
                           select new AnketaDb
                           {
                               IdAnketa = anketa.idAnketa,
                               Pitanje = anketa.pitanje,
                               Aktivna = anketa.aktivna,
                           };
            }

            AnketaDb[] niz = ieAnkete.ToArray();

            OperacijaRezultat obj = new OperacijaRezultat();
            obj.DbItems = niz;
            obj.Status = true;
            return obj;
        }
    }

    public class OpAnketaSelect : OpAnketaBase { }

    public class OpAnketaInsert : OpAnketaBase {
        private AnketaDb anketaObj;

        public AnketaDb AnketaObj
        {
            get { return anketaObj; }
            set { anketaObj = value; }
        }

        public override OperacijaRezultat izvrsi(DataLayer.KineskaHranaEntities entiteti)
        {
            entiteti.AnketeInsert(anketaObj.Pitanje,anketaObj.Aktivna);
            return base.izvrsi(entiteti);
        }
    }

    public class OpAnketaUpdate : OpAnketaBase {
        private AnketaDb anketaObj;

        public AnketaDb AnketaObj
        {
            get { return anketaObj; }
            set { anketaObj = value; }
        }

        public override OperacijaRezultat izvrsi(DataLayer.KineskaHranaEntities entiteti)
        {
            entiteti.AnketeUpdate(anketaObj.IdAnketa, anketaObj.Pitanje, anketaObj.Aktivna);
            return base.izvrsi(entiteti);
        }
    }

    public class OpAnketaDelete : OpAnketaBase {
        private int idBrisanje;

        public int IdBrisanje
        {
            get { return idBrisanje; }
            set { idBrisanje = value; }
        }

        public override OperacijaRezultat izvrsi(DataLayer.KineskaHranaEntities entiteti)
        {
            entiteti.AnketeDelete(this.idBrisanje);
            return base.izvrsi(entiteti);
        }
    }

    public class OpAnketaPostaviNeaktivne : OpAnketaBase {
        public override OperacijaRezultat izvrsi(DataLayer.KineskaHranaEntities entiteti)
        {
            entiteti.AnketePostaviNeaktivne();
            return base.izvrsi(entiteti);
        }
    }


}