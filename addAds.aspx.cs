using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Drawing;
using System.Web;
using System.Web.UI;

namespace advertiseManegement
{
    public partial class addAds : System.Web.UI.Page
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

                }
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string title = txtTitle.Text.Trim();
            string description = txtDescription.Text.Trim();
            string userEmail = Session["user"]?.ToString();
            DateTime startDate;
            int durationDays;

            if (!DateTime.TryParse(txtStartDate.Text, out startDate))
            {
                lblMessage.Text = "Invalid start date.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            if (!int.TryParse(txtDurationDays.Text, out durationDays) || durationDays <= 0)
            {
                lblMessage.Text = "Enter a valid duration in days.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            if (!string.IsNullOrEmpty(title) && !string.IsNullOrEmpty(description))
            {
                string connStr = ConfigurationManager.AppSettings["cons"];

                if (!string.IsNullOrEmpty(connStr))
                {
                    MySqlConnection conn = new MySqlConnection(connStr);
                    
                        try
                        {

                            conn.Open();

                            // to store user email in your insert 
                            string query = @"INSERT INTO ads (title, description, status, user_email, startDate, durationDays) VALUES (@title, @description, 'pending', @user_email, @startDate, @durationDays)";
                            MySqlCommand cmd = new MySqlCommand(query, conn);
                            cmd.Parameters.AddWithValue("@title", title);
                            cmd.Parameters.AddWithValue("@description", description);
                            cmd.Parameters.AddWithValue("@user_email", userEmail);
                            cmd.Parameters.AddWithValue("@startDate", startDate);
                            cmd.Parameters.AddWithValue("@durationDays", durationDays);

                            int result = cmd.ExecuteNonQuery();

                            if (result > 0)
                            {
                                lblMessage.Text = "Advertisement saved successfully!";
                                lblMessage.ForeColor = System.Drawing.Color.Green;
                                txtTitle.Text = "";
                                txtDescription.Text = "";
                                txtStartDate.Text = "";
                                txtDurationDays.Text = "";

                            }
                            else
                            {
                                lblMessage.Text = "Failed to save advertisement.";
                                lblMessage.ForeColor = System.Drawing.Color.Red;
                            }

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
                else
                {
                    lblMessage.Text = "Please fill in all fields.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }
}
            
        
