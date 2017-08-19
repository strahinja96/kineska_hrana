using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using KineskaHrana.DataLayer;

namespace KineskaHrana.BusinessLayer
{
    public abstract class Operacija
    {
        public abstract OperacijaRezultat izvrsi(KineskaHranaEntities entiteti);
    }

    public class OperacijaRezultat
    {
        private string poruka;
        private DbItem[] dbItems;

        public string Poruka
        {
            get { return poruka; }
            set { poruka = value; }
        }
        public bool Status { get; set; }

        public DbItem[] DbItems
        {
            get { return dbItems; }
            set { dbItems = value; }
        }
    }

    public abstract class DbItem
    {
        
    }

    public abstract class KriterijumZaSelekciju
    {

    }
}
