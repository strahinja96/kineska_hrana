using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KineskaHrana.BusinessLayer.UlogeOperacije
{
    public class UlogeDb : DbItem
    {
        private int idUloga;

        public int IdUloga
        {
            get { return idUloga; }
            set { idUloga = value; }
        }
        private string nazivUloga;

        public string NazivUloga
        {
            get { return nazivUloga; }
            set { nazivUloga = value; }
        }
    }

    public class OpUlogeBase : Operacija
    {
        IEnumerable<UlogeDb> ieUloge;

        public override OperacijaRezultat izvrsi(DataLayer.KineskaHranaEntities entiteti)
        {
            ieUloge = from uloge in entiteti.Uloges
                      select new UlogeDb
                      {
                          IdUloga = uloge.idUloga,
                          NazivUloga = uloge.nazivUloga
                      };
            UlogeDb[] niz = ieUloge.ToArray();
            OperacijaRezultat obj = new OperacijaRezultat();
            obj.DbItems = niz;
            obj.Status = true;
            return obj;
        }
    }

    public class OpUlogeSelect : OpUlogeBase { }

    public class OpUlogeInsert : OpUlogeBase
    {
        private UlogeDb ulogeObj;

        public UlogeDb UlogeObj
        {
            get { return ulogeObj; }
            set { ulogeObj = value; }
        }

        public override OperacijaRezultat izvrsi(DataLayer.KineskaHranaEntities entiteti)
        {
            entiteti.UlogeInsert(ulogeObj.NazivUloga);
            return base.izvrsi(entiteti);
        }
    }

    public class OpUlogeUpdate : OpUlogeBase
    {
        private UlogeDb ulogeObj;

        public UlogeDb UlogeObj
        {
            get { return ulogeObj; }
            set { ulogeObj = value; }
        }

        public override OperacijaRezultat izvrsi(DataLayer.KineskaHranaEntities entiteti)
        {
            entiteti.UlogeUpdate(ulogeObj.IdUloga, ulogeObj.NazivUloga);
            return base.izvrsi(entiteti);
        }
    }

    public class OpUlogeDelete : OpUlogeBase
    {
        private int id;

        public int Id
        {
            get { return id; }
            set { id = value; }
        }

        public override OperacijaRezultat izvrsi(DataLayer.KineskaHranaEntities entiteti)
        {
            entiteti.UlogeDelete(this.id);
            return base.izvrsi(entiteti);
        }
    }
}