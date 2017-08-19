using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KineskaHrana.BusinessLayer.KorisniciOperacije
{
    public class KorisnikDb : DbItem
    {
        private int idKorisnik, idUloga;

        public int IdUloga
        {
            get { return idUloga; }
            set { idUloga = value; }
        }

        public int IdKorisnik
        {
            get { return idKorisnik; }
            set { idKorisnik = value; }
        }
        private string username, password, email;

        public string Email
        {
            get { return email; }
            set { email = value; }
        }

        public string Password
        {
            get { return password; }
            set { password = value; }
        }

        public string Username
        {
            get { return username; }
            set { username = value; }
        }
    }

    public class KriterijumLogovanje : KriterijumZaSelekciju
    {
        public string username { get; set; }
        public string password { get; set; }
    }

    public class OpKorisniciBase : Operacija
    {

        public KriterijumLogovanje KriterijumLogovanje { get; set; }

        public override OperacijaRezultat izvrsi(DataLayer.KineskaHranaEntities entiteti)
        { 

            IEnumerable<KorisnikDb> ieKorisnici;

            if ((this.KriterijumLogovanje == null) || (this.KriterijumLogovanje.username == null) && (this.KriterijumLogovanje.password == null)) {

                ieKorisnici = from korisnici in entiteti.Korisnicis
                              select new KorisnikDb
                              {
                                  IdKorisnik = korisnici.idKorisnik,
                                  Username = korisnici.username,
                                  Password = korisnici.password,
                                  Email = korisnici.email,
                                  IdUloga = korisnici.idUloga,
                              };
                KorisnikDb[] niz = ieKorisnici.ToArray();
                OperacijaRezultat obj = new OperacijaRezultat();
                obj.DbItems = niz;
                obj.Status = true;
                return obj;
            }

            else
            {
                ieKorisnici = from korisnici in entiteti.Korisnicis where (this.KriterijumLogovanje.username == korisnici.username && this.KriterijumLogovanje.password == korisnici.password)
                              select new KorisnikDb
                              {
                                  IdKorisnik = korisnici.idKorisnik,
                                  Username = korisnici.username,
                                  Password = korisnici.password,
                                  Email = korisnici.email,
                                  IdUloga = korisnici.idUloga,
                              };
                KorisnikDb[] niz = ieKorisnici.ToArray();
                OperacijaRezultat obj = new OperacijaRezultat();
                obj.DbItems = niz;
                obj.Status = true;
                return obj;
            }
        }
    }

    public class OpKorisniciSelect : OpKorisniciBase { }


    public class OpKorisniciInsert : OpKorisniciBase
    {
        private KorisnikDb korisnikObj;

        public KorisnikDb KorisnikObj
        {
            get { return korisnikObj; }
            set { korisnikObj = value; }
        }

        public override OperacijaRezultat izvrsi(DataLayer.KineskaHranaEntities entiteti)
        {
            entiteti.UserInsert(korisnikObj.Username, korisnikObj.Password, korisnikObj.Email,korisnikObj.IdUloga);
            return base.izvrsi(entiteti);
        }  
    }

    public class OpKorisniciUpdate : OpKorisniciBase
    {
        private KorisnikDb korisnikObj;

        public KorisnikDb KorisnikObj
        {
            get { return korisnikObj; }
            set { korisnikObj = value; }
        }

        public override OperacijaRezultat izvrsi(DataLayer.KineskaHranaEntities entiteti)
        {
            entiteti.UserUpdate(korisnikObj.IdKorisnik, korisnikObj.Username, korisnikObj.Password, korisnikObj.Email, korisnikObj.IdUloga);
            return base.izvrsi(entiteti);
        }
    }

    public class OpKorisniciDelete : OpKorisniciBase
    {
        private int id;

        public int Id
        {
            get { return id; }
            set { id = value; }
        }

        public override OperacijaRezultat izvrsi(DataLayer.KineskaHranaEntities entiteti)
        {
            entiteti.UserDelete(this.id);
            return base.izvrsi(entiteti);
        }
    }
}