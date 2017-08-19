using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using KineskaHrana.DataLayer;

namespace KineskaHrana.BusinessLayer
{
    public class OperationManager
    {

        #region Singleton
        private OperationManager() { }
        private static volatile OperationManager singleton;
        private static object syncRoot = new object();

        public static OperationManager Singleton
        {
            get
            {
                if (OperationManager.singleton == null)
                {
                    lock (OperationManager.syncRoot)
                    {
                        if (OperationManager.singleton == null)
                            OperationManager.singleton = new OperationManager();
                    }
                }
                return OperationManager.singleton;
            }
        }
        #endregion

        private KineskaHranaEntities entiteti = new KineskaHranaEntities();

        public OperacijaRezultat izvrsiOperaciju(Operacija op)
        {
            try
            {
                return op.izvrsi(this.entiteti);
            }
            catch(Exception e)
            {
                //return null;
                OperacijaRezultat obj = new OperacijaRezultat();
                obj.Status = false;
        #if DEBUG   // predprocesorska direktiva za uslovno prevodjenje dela koda
                // Poruka okruzenja o izuzetku se setuje u objekat samo u "debug" modu, a ne i u "release" modu
                obj.Poruka = e.Message;
        #endif
                return obj;
            }
        }

    }
}
