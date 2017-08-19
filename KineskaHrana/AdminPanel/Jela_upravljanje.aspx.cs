using KineskaHrana.BusinessLayer;
using KineskaHrana.BusinessLayer.DogadjajiOperacije;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace KineskaHrana.AdminPanel
{
    public partial class Jela_upravljanje : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["idUloga"] != null && (Convert.ToInt32(Session["idUloga"]) == 1))
            {
            }
            else
            {
                Response.Redirect("../Pocetna.aspx");
            }
        }

        protected void linkUnesi_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {

                FileUpload file = ((FileUpload)GridView1.FooterRow.FindControl("fileImg"));

                if (file.HasFile)
                {
                    string extension = System.IO.Path.GetExtension(file.FileName);
                    string uploadFolder = Server.MapPath("~/images/");

                    if (extension == ".jpg" || extension == ".png" || extension == ".gif" || extension == ".jpeg")
                    {
                        try
                        {
                            file.SaveAs(uploadFolder + file.FileName);
                            string putanja = "/images/" + file.FileName;
                            SqlDataSource1.InsertParameters["nazivJelo"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("tbNazivJelo")).Text;
                            SqlDataSource1.InsertParameters["cena"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("tbCena")).Text;
                            SqlDataSource1.InsertParameters["slika"].DefaultValue = putanja;

                            SqlDataSource1.Insert();

                            int idKorisnik = Convert.ToInt32(Session["idKorisnik"]);
                            OpDogadjajInsert op = new OpDogadjajInsert();
                            op.DogadjajObj = new DogadjajDb();
                            op.DogadjajObj.IdKorisnik = idKorisnik;
                            op.DogadjajObj.DogadjajOpis = "Korisnik je uneo novu sliku!";
                            op.DogadjajObj.Vreme = DateTime.Now;

                            OperacijaRezultat rez = OperationManager.Singleton.izvrsiOperaciju(op);
                        }
                        catch (Exception ex)
                        {
                            this.ErrorsLabel.Text = ex.Message;
                        }
                    }
                    else
                    {
                        ((CustomValidator)GridView1.FooterRow.FindControl("CustomValidator1")).IsValid = false;
                        return;
                    }
                }

            }
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            FileUpload file = ((FileUpload)GridView1.Rows[e.RowIndex].FindControl("FileUpload1"));

            if (file.HasFile)
            {
                string extension = System.IO.Path.GetExtension(file.FileName);
                string uploadFolder = Server.MapPath("~/images/");

                if (extension == ".jpg" || extension == ".png" || extension == ".gif" || extension == ".jpeg")
                {
                    try
                    {
                        file.SaveAs(uploadFolder + file.FileName);
                        string path = "/images/" + file.FileName;
                        e.NewValues["slika"] = path;

                        string oldImage = ((Label)GridView1.Rows[e.RowIndex].FindControl("LabelPutanja")).Text;
                        string oldImagePath = "~" + oldImage;

                        File.Delete(Server.MapPath(oldImagePath));
                    }
                    catch (Exception ex)
                    {
                        this.ErrorsLabel.Text = ex.Message;
                    }

                }
                else
                {
                    ((CustomValidator)GridView1.Rows[e.RowIndex].FindControl("CustomValidatorUpdate")).IsValid = false;
                    return;
                }
            }
            else
            {
                e.NewValues["path"] = ((Label)GridView1.Rows[e.RowIndex].FindControl("LabelPutanja")).Text;
            }

            int idKorisnik = Convert.ToInt32(Session["idKorisnik"]);

            Label idLabela = (Label)GridView1.Rows[e.RowIndex].FindControl("Label1");
            int identifikator = Convert.ToInt32(idLabela.Text);
            OpDogadjajInsert op = new OpDogadjajInsert();
            op.DogadjajObj = new DogadjajDb();
            op.DogadjajObj.IdKorisnik = idKorisnik;
            op.DogadjajObj.DogadjajOpis = "Korisnik je promenio sliku sa identifikatorom " + identifikator + "!";
            op.DogadjajObj.Vreme = DateTime.Now;

            OperacijaRezultat rez = OperationManager.Singleton.izvrsiOperaciju(op);
        
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int idKorisnik = Convert.ToInt32(Session["idKorisnik"]);

            Label idLabela = (Label)GridView1.Rows[e.RowIndex].FindControl("Label1");
            int identifikator = Convert.ToInt32(idLabela.Text);
            OpDogadjajInsert op = new OpDogadjajInsert();
            op.DogadjajObj = new DogadjajDb();
            op.DogadjajObj.IdKorisnik = idKorisnik;
            op.DogadjajObj.DogadjajOpis = "Korisnik je obrisao jelo sa identifikatorom " + identifikator + "!";
            op.DogadjajObj.Vreme = DateTime.Now;

            OperacijaRezultat rez = OperationManager.Singleton.izvrsiOperaciju(op);
        }
    }
}