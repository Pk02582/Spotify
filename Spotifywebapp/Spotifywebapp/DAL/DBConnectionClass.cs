using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;


namespace Spotifywebapp.DAL
{
    public class DBConnectionClass
    {

        string connectionString = ConfigurationManager.ConnectionStrings["SpotifyConnectionString"].ConnectionString;

        public int AddArtist(string ArtistName, DateTime ArtistDOB,  String ArtistBio)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    SqlCommand objSqlCommand = new SqlCommand("usp_AddArtist", con);
                    objSqlCommand.CommandType = CommandType.StoredProcedure;
                    objSqlCommand.Parameters.AddWithValue("@ArtistName", ArtistName);
                    objSqlCommand.Parameters.AddWithValue("@ArtistDOB", ArtistDOB);
                    objSqlCommand.Parameters.AddWithValue("@ArtistBio", ArtistBio);
                   
                    con.Open();
                    objSqlCommand.ExecuteNonQuery();

                }

            }
            catch (Exception ex)
            {
                return 0;

            }
            return 1;

        }


        public int AddSong(string SongName, DateTime ReleaseDate, String Artwork, String Artist)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    SqlCommand objSqlCommand = new SqlCommand("usp_AddSong", con);
                    objSqlCommand.CommandType = CommandType.StoredProcedure;
                    objSqlCommand.Parameters.AddWithValue("@SongName", SongName);
                    objSqlCommand.Parameters.AddWithValue("@ReleaseDate", ReleaseDate);
                    objSqlCommand.Parameters.AddWithValue("@Artwork", Artwork);
                    objSqlCommand.Parameters.AddWithValue("@Artist", Artist);
                    con.Open();
                    objSqlCommand.ExecuteNonQuery();

                }

            }
            catch (Exception ex)
            {
                return 0;

            }
            return 1;

        }

        public DataSet GetArtist()
        {
            DataSet ds = new DataSet();
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand objSqlCommand = new SqlCommand("usp_GetArtist", con);              
                objSqlCommand.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter objSqlDataAdapter = new SqlDataAdapter(objSqlCommand);
                objSqlDataAdapter.Fill(ds);
            }

            return ds;

        }

        public DataSet GetArtistDetails()
        {
            DataSet ds = new DataSet();
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand objSqlCommand = new SqlCommand("usp_GetArtistDetails", con);
                objSqlCommand.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter objSqlDataAdapter = new SqlDataAdapter(objSqlCommand);
                objSqlDataAdapter.Fill(ds);
            }

            return ds;

        }

        public DataSet GetSongs()
        {
            DataSet ds = new DataSet();
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand objSqlCommand = new SqlCommand("usp_GetSongsDetails", con);               
                objSqlCommand.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter objSqlDataAdapter = new SqlDataAdapter(objSqlCommand);
                objSqlDataAdapter.Fill(ds);
            }

            return ds;

        }


        public int Addrating(String Rating)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    SqlCommand objSqlCommand = new SqlCommand("usp_AddAddRating", con);
                    objSqlCommand.CommandType = CommandType.StoredProcedure;
                    objSqlCommand.Parameters.AddWithValue("@Rating", Rating);
                    //objSqlCommand.Parameters.AddWithValue("@SongId", Convert.ToInt16(SongId));
                   
                    con.Open();
                    objSqlCommand.ExecuteNonQuery();

                }

            }
            catch (Exception ex)
            {
                return 0;

            }
            return 1;

        }


   

    }
}