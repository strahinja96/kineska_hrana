using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KineskaHrana.BusinessLayer.NarudzbineOperacije
{
    public class NarudzbinaDb : DbItem
    {
        private int idNarudzbina, idKorisnik, idJelo;
        private DateTime vreme;
        private string ime, prezime, adresa;

        public string Adresa
        {
            get { return adresa; }
            set { adresa = value; }
        }

        public string Prezime
        {
            get { return prezime; }
            set { prezime = value; }
        }

        public string Ime
        {
            get { return ime; }
            set { ime = value; }
        }

        public int IdNarudzbina
        {
            get { return idNarudzbina; }
            set { idNarudzbina = value; }
        }
        decimal cena;

        public decimal Cena
        {
            get { return cena; }
            set { cena = value; }
        }

        public DateTime Vreme
        {
            get { return vreme; }
            set { vreme = value; }
        }

        public int IdJelo
        {
            get { return idJelo; }
            set { idJelo = value; }
        }

        public int IdKorisnik
        {
            get { return idKorisnik; }
            set { idKorisnik = value; }
        }
    }

    public class OpNarudzbineBase : Operacija
    {
        IEnumerable<NarudzbinaDb> ieNaruzbina;

        public override OperacijaRezultat izvrsi(DataLayer.KineskaHranaEntities entiteti)
        {
 	        ieNaruzbina = from narudzbina in entiteti.Narudzbines
                              select new NarudzbinaDb
                              {
                                 IdNarudzbina = narudzbina.idNarudzbina,
                                 IdKorisnik = narudzbina.idKorisnik,
                                 IdJelo = narudzbina.idJelo,
                                 Vreme = narudzbina.vreme,
                                 Cena = narudzbina.cena,
                                 Ime = narudzbina.ime,
                                 Prezime = narudzbina.prezime,
                                 Adresa = narudzbina.adresa
                              };
                NarudzbinaDb[] niz = ieNaruzbina.ToArray();
                OperacijaRezultat obj = new OperacijaRezultat();
                obj.DbItems = niz;
                obj.Status = true;
                return obj;
        }
    }

    public class OpNarudzbinaSelect : OpNarudzbineBase { }

    public class OpNarudzbinaInsert : OpNarudzbineBase
    {
        private NarudzbinaDb narudzbinaObj;

        public NarudzbinaDb NarudzbinaObj
        {
            get { return narudzbinaObj; }
            set { narudzbinaObj = value; }
        }

        public override OperacijaRezultat izvrsi(DataLayer.KineskaHranaEntities entiteti)
        {
            entiteti.NarudzbineInsert(narudzbinaObj.IdKorisnik, narudzbinaObj.IdJelo, narudzbinaObj.Vreme, narudzbinaObj.Cena, narudzbinaObj.Ime, narudzbinaObj.Prezime, narudzbinaObj.Adresa);
            return base.izvrsi(entiteti);
        }
    }

    public class OpNarudzbinaUpdate : OpNarudzbineBase
    {
        private NarudzbinaDb narudzbinaObj;

        public NarudzbinaDb NarudzbinaObj
        {
            get { return narudzbinaObj; }
            set { narudzbinaObj = value; }
        }

        public override OperacijaRezultat izvrsi(DataLayer.KineskaHranaEntities entiteti)
        {
            entiteti.NarudzbineUpdate(narudzbinaObj.IdNarudzbina, narudzbinaObj.IdKorisnik, narudzbinaObj.IdJelo, narudzbinaObj.Vreme, narudzbinaObj.Cena, narudzbinaObj.Ime, narudzbinaObj.Prezime, narudzbinaObj.Adresa);
            return base.izvrsi(entiteti);
        }
    }

    public class OpNarudzbinaDelete : OpNarudzbineBase
    {
        private int id;

        public int Id
        {
            get { return id; }
            set { id = value; }
        }

        public override OperacijaRezultat izvrsi(DataLayer.KineskaHranaEntities entiteti)
        {
            entiteti.NarudzbineDelete(this.id);
            return base.izvrsi(entiteti);
        }
    }


    public class OpNarudzbinaIzmeniCenu : OpNarudzbineBase
    {
        private int id;

        public int Id
        {
            get { return id; }
            set { id = value; }
        }

        private decimal cena;

        public decimal Cena
        {
            get { return cena; }
            set { cena = value; }
        }

        public override OperacijaRezultat izvrsi(DataLayer.KineskaHranaEntities entiteti)
        {
            entiteti.NarudzbinaPromenaCene(this.id, this.cena);
            return base.izvrsi(entiteti);
        }
    }
}