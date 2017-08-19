using KineskaHrana.DataLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KineskaHrana.BusinessLayer.JelaOperacije
{
    public class JeloDb : DbItem {
        private int idJelo;

        public int IdJelo
        {
            get { return idJelo; }
            set { idJelo = value; }
        }
        private string nazivJelo;

        public string NazivJelo
        {
            get { return nazivJelo; }
            set { nazivJelo = value; }
        }
        private decimal cena;

        public decimal Cena
        {
            get { return cena; }
            set { cena = value; }
        }

        private string slika;

        public string Slika
        {
            get { return slika; }
            set { slika = value; }
        }


        public override string ToString()
        {
            return this.nazivJelo + ", cena: " + this.cena.ToString() + " RSD";
        }

    }

    public class OpJeloBase : Operacija {

        private bool datiId = false;

        public bool DatiId
        {
            get { return datiId; }
            set { datiId = value; }
        }
        private int idJeloSelekcija;

        public int IdJeloSelekcija
        {
            get { return idJeloSelekcija; }
            set { idJeloSelekcija = value; }
        }

        public override OperacijaRezultat izvrsi(KineskaHranaEntities entiteti)
        {
            IEnumerable<JeloDb> ieJela;

            if(datiId){
                ieJela = from jelo in entiteti.Jelas
                         where (jelo.idJelo == idJeloSelekcija)
                         select new JeloDb
                         {
                             IdJelo = jelo.idJelo,
                             NazivJelo = jelo.nazivJelo,
                             Cena = jelo.cena,
                             Slika = jelo.slika,
                         };
            }
            else
            {
                ieJela = from jelo in entiteti.Jelas
                         select new JeloDb
                         {
                             IdJelo = jelo.idJelo,
                             NazivJelo = jelo.nazivJelo,
                             Cena = jelo.cena,
                             Slika = jelo.slika,
                         };
            }
                
            JeloDb[] niz = ieJela.ToArray();

            OperacijaRezultat obj = new OperacijaRezultat();
            obj.DbItems = niz;
            obj.Status = true;
            return obj;
        } 
    }

    public class OpJeloSelect : OpJeloBase { }

    public class OpJeloInsert : OpJeloBase
    {
        private JeloDb jeloObj;

        public JeloDb JeloObj
        {
            get { return jeloObj; }
            set { jeloObj = value; }
        }

        public override OperacijaRezultat izvrsi(KineskaHranaEntities entiteti)
        {
            entiteti.JelaInsert(jeloObj.NazivJelo, jeloObj.Cena, jeloObj.Slika);
            return base.izvrsi(entiteti);
        }
    }

    public class OpJeloUpdate : OpJeloBase
    {
        private JeloDb jeloObj;

        public JeloDb JeloObj
        {
            get { return jeloObj; }
            set { jeloObj = value; }
        }

        public override OperacijaRezultat izvrsi(KineskaHranaEntities entiteti)
        {
            entiteti.JelaUpdate(jeloObj.IdJelo, jeloObj.NazivJelo, jeloObj.Cena, jeloObj.Slika);
            return base.izvrsi(entiteti);
        }
    }

    public class OpJeloDelete : OpJeloBase
    {
        private int id;

        public int Id
        {
            get { return id; }
            set { id = value; }
        }

        public override OperacijaRezultat izvrsi(KineskaHranaEntities entiteti)
        {
            entiteti.JelaDelete(this.id);
            return base.izvrsi(entiteti);
        }
    }
}