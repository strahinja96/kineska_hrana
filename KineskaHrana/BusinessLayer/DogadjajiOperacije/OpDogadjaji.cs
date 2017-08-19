using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KineskaHrana.BusinessLayer.DogadjajiOperacije
{
    public class DogadjajDb : DbItem
    {
        private int idDogadjaj, idKorisnik;

        public int IdKorisnik
        {
            get { return idKorisnik; }
            set { idKorisnik = value; }
        }

        public int IdDogadjaj
        {
            get { return idDogadjaj; }
            set { idDogadjaj = value; }
        }
        private string dogadjajOpis;

        public string DogadjajOpis
        {
            get { return dogadjajOpis; }
            set { dogadjajOpis = value; }
        }
        private DateTime vreme;

        public DateTime Vreme
        {
            get { return vreme; }
            set { vreme = value; }
        }
    }

    public class OpDogadjajBase : Operacija
    {
        IEnumerable<DogadjajDb> ieDogadjaj;

        public override OperacijaRezultat izvrsi(DataLayer.KineskaHranaEntities entiteti)
        {
            ieDogadjaj = from dogadjaj in entiteti.Dogadjajis
                         select new DogadjajDb
                         {
                             IdDogadjaj = dogadjaj.idDogadjaj,
                             IdKorisnik = dogadjaj.id_korisnik,
                             DogadjajOpis = dogadjaj.dogadjaj_opis,
                             Vreme = dogadjaj.vreme
                         };
            DogadjajDb[] niz = ieDogadjaj.ToArray();
            OperacijaRezultat rez = new OperacijaRezultat();
            rez.DbItems = niz;
            rez.Status = true;
            return rez;
        }
    }

    public class OpDogadjajSelect : OpDogadjajBase { }

    public class OpDogadjajInsert : OpDogadjajBase
    {
        private DogadjajDb dogadjajObj;

        public DogadjajDb DogadjajObj
        {
            get { return dogadjajObj; }
            set { dogadjajObj = value; }
        }

        public override OperacijaRezultat izvrsi(DataLayer.KineskaHranaEntities entiteti)
        {
            entiteti.DogadjajInsert(dogadjajObj.DogadjajOpis, dogadjajObj.IdKorisnik, dogadjajObj.Vreme);
            return base.izvrsi(entiteti);
        }
    }
}