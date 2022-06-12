using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Spotifywebapp.DAL;

namespace Spotifywebapp
{
    public partial class Artist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GetArtist();
        }

        private void GetArtist()
        {
            DBConnectionClass obj = new DBConnectionClass();
            DataSet ds = new DataSet();
            ds = obj.GetArtistDetails();
            rptArtist.DataSource = ds;
            rptArtist.DataBind();

            udpMain.Update();
        }


    }
}