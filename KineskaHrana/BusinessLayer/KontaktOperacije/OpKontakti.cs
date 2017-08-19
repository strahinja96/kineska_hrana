using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KineskaHrana.BusinessLayer.KontaktOperacije
{
    public class KontaktDb : DbItem
    {
        private int idKontakt;

        public int IdKontakt
        {
            get { return idKontakt; }
            set { idKontakt = value; }
        }
        private string ime, prezime, poruka, email;

        public string Email
        {
            get { return email; }
            set { email = value; }
        }

        public string Poruka
        {
            get { return poruka; }
            set { poruka = value; }
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
    }

    public class OpKontaktBase : Operacija
    {
        public override OperacijaRezultat izvrsi(DataLayer.KineskaHranaEntities entiteti)
        {
            IEnumerable<KontaktDb> ieKontakt;

            ieKontakt = from kontakti in entiteti.Kontakts
                        select new KontaktDb
                        {
                            IdKontakt = kontakti.idKontakt,
                            Ime = kontakti.ime,
                            Prezime = kontakti.prezime,
                            Poruka = kontakti.poruka,
                            Email = kontakti.email,
                        };
            KontaktDb[] niz = ieKontakt.ToArray();

            OperacijaRezultat obj = new OperacijaRezultat();
            obj.DbItems = niz;
            obj.Status = true;
            return obj;
        }
    }

    public class OpKontaktSelect : OpKontaktBase { }

    public class OpKontaktInsert : OpKontaktBase
    {
        private KontaktDb kontaktObj;

        public KontaktDb KontaktObj
        {
            get { return kontaktObj; }
            set { kontaktObj = value; }
        }

        public override OperacijaRezultat izvrsi(DataLayer.KineskaHranaEntities entiteti)
        {
            entiteti.KontaktInsert(kontaktObj.Ime, kontaktObj.Prezime, kontaktObj.Poruka, kontaktObj.Email);
            return base.izvrsi(entiteti);
        }
    }

    public class OpKontaktUpdate : OpKontaktBase
    {
        private KontaktDb kontaktObj;

        public KontaktDb KontaktObj
        {
            get { return kontaktObj; }
            set { kontaktObj = value; }
        }

        public override OperacijaRezultat izvrsi(DataLayer.KineskaHranaEntities entiteti)
        {
            entiteti.KontaktUpdate(kontaktObj.IdKontakt, kontaktObj.Ime, kontaktObj.Prezime, kontaktObj.Poruka, kontaktObj.Email);
            return base.izvrsi(entiteti);
        }
    }

    public class OpKontaktDelete : OpKontaktBase
    {
        private int id;

        public int Id
        {
            get { return id; }
            set { id = value; }
        }

        public override OperacijaRezultat izvrsi(DataLayer.KineskaHranaEntities entiteti)
        {
            entiteti.KontaktDelete(this.id);
            return base.izvrsi(entiteti);
        }
    }
}