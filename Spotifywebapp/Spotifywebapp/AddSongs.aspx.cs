using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Spotifywebapp.DAL;
using System.Data;
using System.IO;

namespace Spotifywebapp
{
    public partial class AddSongs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {

                FillArtistDropdown();

            }
           
        }

         protected void AddArtist(object sender, EventArgs e)
        {

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "PopupTrackChanges", "$('#PopupTrackChanges').modal();", true);
         }

         protected void AddSong(object sender, EventArgs e)
         {

             ScriptManager.RegisterStartupScript(Page, Page.GetType(), "PopupTrackChanges", "$('#PopupTrackChanges').modal();", true);
         }

         protected void AddNewArtist(object sender, EventArgs e)
         {
            
             DBConnectionClass obj = new DBConnectionClass();
             int result=obj.AddArtist(txtArtistName.Text,Convert.ToDateTime(txtdob.Text),txtBio.Text);

             if (result == 1)
             {
                 lblResult.Visible = true;
                 
                 lblResult.Text = "Record Saved Successfully";
             }
             else
             {

                 lblResult.Visible = true;
                 lblResult.Text = "Something went wrong";
             }
             ClearData();
             udp1.Update();

         }

         protected void AddNewSong(object sender, EventArgs e)
         {

             DBConnectionClass obj1 = new DBConnectionClass();
             int result = obj1.AddSong(txtSongName.Text, Convert.ToDateTime(txtDate.Text), Convert.ToString(FileUpload1), ddlArtist.SelectedValue);

             if (result == 1)
             {
                 lblResult2.Visible = true;

                 lblResult2.Text = "Record Saved Successfully";
             }
             else
             {

                 lblResult2.Visible = true;
                 lblResult2.Text = "Something went wrong";
             }
             ClearData1();
             udp1.Update();

         }
         private void ClearData()
         {
             txtArtistName.Text = "";
             txtdob.Text = "";
             txtBio.Text = "";
         }
         private void ClearData1()
         {
             txtSongName.Text = "";
             txtDate.Text = "";
             //TextBox2.Text = "";
             //FileUpload1. = "";
         }

         private void FillArtistDropdown()
         {
             DBConnectionClass obj = new DBConnectionClass();

             DataSet ds = new DataSet();
             ds= obj.GetArtist();

             ddlArtist.DataSource = ds;
             ddlArtist.DataTextField = "Name";
             ddlArtist.DataValueField = "Srno";
             ddlArtist.DataBind(); 
         }



         protected void UploadFile(object sender, EventArgs e)
         {
             string folderPath = Server.MapPath("~/Files/");


             if (!Directory.Exists(folderPath))             //Check whether Directory (Folder) exists.
             {

                 Directory.CreateDirectory(folderPath);    //If Directory (Folder) does not exists Create it.
             }


             FileUpload1.SaveAs(folderPath + Path.GetFileName(FileUpload1.FileName));    //Save the File to the Directory (Folder).


             //Image1.ImageUrl = "~/Files/" + Path.GetFileName(FileUpload1.FileName);    //Display the Picture in Image control.
         }
    }
}