using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Spotifywebapp.DAL;
using AjaxControlToolkit;


namespace Spotifywebapp
{
    public partial class Songs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable("ProjectList");
            dt.Columns.Add(new DataColumn("Artwork", typeof(string)));
            dt.Columns.Add(new DataColumn("Song", typeof(string)));
            dt.Columns.Add(new DataColumn("DateofRelease", typeof(string)));
            dt.Columns.Add(new DataColumn("Artists", typeof(string)));
            dt.Columns.Add(new DataColumn("Rate", typeof(string)));


            ds.Tables.Add(dt);
            rptSongs.DataSource = ds;
            rptSongs.DataBind();
            GetSongs();
        }



        protected void AddSongs(object sender, EventArgs e)
        {

            Response.Redirect("AddSongs.aspx");
        }



        private void GetSongs()
        {
            DBConnectionClass obj = new DBConnectionClass();
            DataSet ds = new DataSet();
            ds = obj.GetSongs();
            rptSongs.DataSource = ds;
            rptSongs.DataBind();

            udpMain.Update();
        }





        public void OnRatingChanged(object sender, RatingEventArgs e)
        {

            DBConnectionClass obj = new DBConnectionClass();
            //Label Srno = (Label)(e.Item.FindControl("lblSrno"));
            //obj.Addrating(e.Value, Convert.ToInt16(Srno.Text));
           
            
            foreach (RepeaterItem rptItem in rptSongs.Items)
            {
                Rating ratingControl;
                int rate;

                ratingControl = (Rating)(rptItem.FindControl("Rating1"));
                rate = ratingControl.CurrentRating;

                if (rate != 0)
                {
                    //Label Srno = (Label)(rptItem.FindControl("lblSrno"));
                    obj.Addrating(e.Value);
                    break;
                }
            }
           

        }



    }
}