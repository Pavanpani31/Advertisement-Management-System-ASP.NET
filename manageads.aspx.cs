using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace advertiseManegement
{
    public partial class manageads : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.AppSettings["cons"]);

        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
            Response.Cache.SetExpires(DateTime.UtcNow.AddSeconds(-1));
            Response.Cache.SetRevalidation(HttpCacheRevalidation.AllCaches);
            Response.Cache.SetValidUntilExpires(false);

            if (Session["user"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    LoadUserAds();
                }

            }
        }

        private void LoadUserAds()
        {
            string userEmail = Session["user"]?.ToString();
            //if (string.IsNullOrEmpty(userEmail))
            //{
            //    lblMessage.Text = "Unauthorized access.";
            //    return;
            //}

            string connStr = ConfigurationManager.AppSettings["cons"];
            MySqlConnection conn = new MySqlConnection(connStr);
            try
            {
                conn.Open();
                string query = "SELECT id, title, status FROM ads WHERE user_email = @user_email";
                MySqlCommand cmd = new MySqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@user_email", userEmail);

                MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvAds.DataSource = dt;
                gvAds.DataBind();
            }
            catch
            {
                Response.Write("<script>alert('Sql Connection is not stared Please check it Once again.');</script>");
            }
            finally
            {
                conn.Close();
            }
            
        }

        protected void gvAds_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteAd")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvAds.Rows[index];

                //  not be null 
                if (gvAds.DataKeys != null && gvAds.DataKeys.Count > index && gvAds.DataKeys[index] != null)
                {
                    int adId = Convert.ToInt32(gvAds.DataKeys[index].Value);
                    DeleteAd(adId);
                    LoadUserAds();
                }
                else
                {
                    lblMessage.Text = "Unable to find Ad ID for deletion.";
                }
            }
        }

        private void DeleteAd(int adId)
        {
            string userEmail = Session["user"]?.ToString();
            string connStr = ConfigurationManager.AppSettings["cons"];
            MySqlConnection conn = new MySqlConnection(connStr);
            try
            {
                conn.Open();
                string query = "DELETE FROM ads WHERE id = @id AND user_email = @user_email";
                MySqlCommand cmd = new MySqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@id", adId);
                cmd.Parameters.AddWithValue("@user_email", userEmail);
                int rowsAffected = cmd.ExecuteNonQuery();

                lblMessage.Text = rowsAffected > 0
                    ? "Ad deleted successfully!"
                    : "Could not delete ad.";

            }
            catch
            {
                Response.Write("<script>alert('Sql Connection is not stared Please check it Once again.');</script>");
            }
            finally
            {
                conn.Close();
            }
        }
        
    }
}
