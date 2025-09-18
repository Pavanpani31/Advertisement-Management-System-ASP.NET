using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace advertiseManegement
{
    public partial class AdManagement : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.AppSettings["cons"]);

            protected void Page_Load(object sender, EventArgs e)
            {
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.Cache.SetNoStore();
                Response.Cache.SetExpires(DateTime.UtcNow.AddSeconds(-1));
                Response.Cache.SetRevalidation(HttpCacheRevalidation.AllCaches);
                Response.Cache.SetValidUntilExpires(false);
                if (Session["role"] == null || Session["role"].ToString() != "admin")
                {
                    Response.Redirect("login.aspx");
                }
                else
                {
                    if (!IsPostBack)
                    {
                        LoadAds();
                    }

                }

            }

        private void LoadAds()
        {
            try
            {
                con.Open();
                MySqlDataAdapter da = new MySqlDataAdapter("SELECT id, title, status FROM ads", con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridViewAds.DataSource = dt;
                GridViewAds.DataBind();
            }
            catch
            {
                Response.Write("<script>alert('Sql Connection is not stared Please check it Once again.');</script>");
            }
            finally
            {
                con.Close();
            }
        }

        

        protected void GridViewAds_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            string adId = GridViewAds.DataKeys[index].Value.ToString();

            string sql = "";
            string message = "";

            if (e.CommandName == "ApproveAd")
            {
                sql = "UPDATE ads SET status='Approved' WHERE id=@id";
                message = "Ad approved.";
            }
            else if (e.CommandName == "RejectAd")
            {
                sql = "UPDATE ads SET status='Rejected' WHERE id=@id";
                message = "Ad rejected.";
            }
            else if (e.CommandName == "DeleteAd")
            {
                sql = "DELETE FROM ads WHERE id=@id";
                message = "Ad deleted.";
            }

            RunQuery(sql, adId, message);
            LoadAds();
        }


        private void RunQuery(string sql, string id, string message)
        {
            try
            {
                con.Open();
                MySqlCommand cmd = new MySqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@id", id);
                cmd.ExecuteNonQuery();

                ScriptManager.RegisterStartupScript(this, GetType(), "alert", $"alert('{message}');", true);
            }
            catch
            {
                Response.Write("<script>alert('Sql Connection is not stared Please check it Once again.');</script>");
            }
            finally
            {
                con.Close();
            }
        }
    }
}