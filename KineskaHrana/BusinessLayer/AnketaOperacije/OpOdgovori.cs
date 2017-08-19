using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KineskaHrana.BusinessLayer.AnketaOperacije
{
    public class OdgovorDb : DbItem
    {
        private int idOdgovor;

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
        private int idAnketa;

        public int IdAnketa
        {
            get { return idAnketa; }
            set { idAnketa = value; }
        }
        private int brojGlasova;

        public int BrojGlasova
        {
            get { return brojGlasova; }
            set { brojGlasova = value; }
        }
    }

    public class OpOdgovorBase : Operacija
    {
        private bool datiIdAnkete = false;

        public bool DatiIdAnkete
        {
            get { return datiIdAnkete; }
            set { datiIdAnkete = value; }
        }

        private int anketaId;

        public int AnketaId
        {
            get { return anketaId; }
            set { anketaId = value; }
        }

        public override OperacijaRezultat izvrsi(DataLayer.KineskaHranaEntities entiteti)
        {
            IEnumerable<OdgovorDb> ieOdgovori;

            if (datiIdAnkete)
            {
                ieOdgovori = from odgovor in entiteti.Odgovoris
                           where (odgovor.idAnketa==this.anketaId)
                            select new OdgovorDb
                           {
                              IdOdgovor=odgovor.idOdgovor,
                              Odgovor=odgovor.odgovor,
                              IdAnketa=odgovor.idAnketa,
                              BrojGlasova=odgovor.brojGlasova,
                           };
            }
            else
            {
                ieOdgovori = from odgovor in entiteti.Odgovoris
                             select new OdgovorDb
                             {
                                 IdOdgovor = odgovor.idOdgovor,
                                 Odgovor = odgovor.odgovor,
                                 IdAnketa = odgovor.idAnketa,
                                 BrojGlasova = odgovor.brojGlasova,
                             };
            }

            OdgovorDb[] niz = ieOdgovori.ToArray();

            OperacijaRezultat obj = new OperacijaRezultat();
            obj.DbItems = niz;
            obj.Status = true;
            return obj;
        }
    }

    public class OpOdgovorSelect : OpOdgovorBase { }

    public class OpOdgovorUpdate : OpAnketaBase {
        private bool glasanje = false;

        public bool Glasanje
        {
            get { return glasanje; }
            set { glasanje = value; }
        }

        private OdgovorDb odgovorObj;

        public OdgovorDb OdgovorObj
        {
            get { return odgovorObj; }
            set { odgovorObj = value; }
        }

        public override OperacijaRezultat izvrsi(DataLayer.KineskaHranaEntities entiteti)
        {
            if (glasanje)
            {
                entiteti.OdgovorGlasanje(odgovorObj.IdOdgovor);
            }
            else { 
                //update celog reda (treba napisati posebnu stored proceduru)
            }
            return base.izvrsi(entiteti);
        }
    }
}