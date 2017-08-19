using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KineskaHrana.BusinessLayer.MeniOperacije
{
    public class MeniDb : DbItem
    {
        private int idMeni, prioritet_meni;

        public int Prioritet_meni
        {
            get { return prioritet_meni; }
            set { prioritet_meni = value; }
        }

        public int IdMeni
        {
            get { return idMeni; }
            set { idMeni = value; }
        }
        private string naziv, link;

        public string Link
        {
            get { return link; }
            set { link = value; }
        }

        public string Naziv
        {
            get { return naziv; }
            set { naziv = value; }
        }
    }

    public class OpMeniBase : Operacija
    {

        private bool sortiranje = false;

        public bool Sortiranje
        {
            get { return sortiranje; }
            set { sortiranje = value; }
        }


        IEnumerable<MeniDb> ieMeni;

        public override OperacijaRezultat izvrsi(DataLayer.KineskaHranaEntities entiteti)
        {
            if (sortiranje)
            {
                ieMeni = from meni in entiteti.Menis
                         orderby meni.prioritet_meni descending
                         select new MeniDb
                         {
                             IdMeni = meni.idMeni,
                             Naziv = meni.naziv_meni,
                             Link = meni.link_meni,
                             Prioritet_meni = meni.prioritet_meni
                         };
            }
            else
            {
                ieMeni = from meni in entiteti.Menis
                         select new MeniDb
                         {
                             IdMeni = meni.idMeni,
                             Naziv = meni.naziv_meni,
                             Link = meni.link_meni,
                             Prioritet_meni = meni.prioritet_meni
                         };
            }
            MeniDb[] niz = ieMeni.ToArray();
            OperacijaRezultat obj = new OperacijaRezultat();
            obj.DbItems = niz;
            obj.Status = true;
            return obj;
        }
    }

    public class OpMeniSelect : OpMeniBase { }

    public class OpMeniInsert : OpMeniBase
    {
        private MeniDb meniObj;

        public MeniDb MeniObj
        {
            get { return meniObj; }
            set { meniObj = value; }
        }

        public override OperacijaRezultat izvrsi(DataLayer.KineskaHranaEntities entiteti)
        {
            entiteti.MeniInsert(meniObj.Naziv, meniObj.Link, meniObj.Prioritet_meni);
            return base.izvrsi(entiteti);
        }
    }

    public class OpMeniUpdate : OpMeniBase
    {
        private MeniDb meniObj;

        public MeniDb MeniObj
        {
            get { return meniObj; }
            set { meniObj = value; }
        }

        public override OperacijaRezultat izvrsi(DataLayer.KineskaHranaEntities entiteti)
        {
            entiteti.MeniUpdate(meniObj.IdMeni, meniObj.Naziv, meniObj.Link, meniObj.Prioritet_meni);
            return base.izvrsi(entiteti);
        }
    }

    public class OpMeniDelete : OpMeniBase
    {
        private int id;

        public int Id
        {
            get { return id; }
            set { id = value; }
        }

        public override OperacijaRezultat izvrsi(DataLayer.KineskaHranaEntities entiteti)
        {
            entiteti.MeniDelete(this.id);
            return base.izvrsi(entiteti);
        }
    }
}