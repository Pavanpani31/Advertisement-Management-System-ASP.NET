using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Runtime.InteropServices;
using System.Security.Policy;
using System.Web;
using System.Web.UI;

namespace advertiseManegement
{
    public partial class login : System.Web.UI.Page
    {
        private readonly MySqlConnection con = new MySqlConnection(ConfigurationManager.AppSettings["cons"]);

        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
            Response.Cache.SetExpires(DateTime.UtcNow.AddSeconds(-1));
            Response.Cache.SetRevalidation(HttpCacheRevalidation.AllCaches);
            Response.Cache.SetValidUntilExpires(false);

            if (!IsPostBack)
            {

            }

        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            string enteredEmail = email.Value;
            string enteredPassword = password.Value;
            // admin login
            if (enteredEmail == "admin@example.com" && enteredPassword == "Admin123@#")
            {
                Session["role"] = "admin";
                Response.Redirect("admindashboard.aspx");
            }
            else
            {
                try
                {
                    con.Open();
                    string query = "SELECT * FROM userinfo WHERE email = @Email AND password = @Password AND status = 'Approved'";
                    MySqlCommand cmd = new MySqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Email", enteredEmail);
                    cmd.Parameters.AddWithValue("@Password", enteredPassword);

                    MySqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        // Store user role and email in session
                        Session["role"] = "user";
                        Session["user"] = reader["email"].ToString();

                        Response.Write("<script>alert('Login Successful'); window.location='welcome.aspx';</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Invalid credentials or not approved yet.');</script>");
                    }
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
}


