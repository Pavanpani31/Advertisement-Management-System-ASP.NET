using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;


namespace advertiseManegement
{
    public partial class register : System.Web.UI.Page
    {
        private readonly MySqlConnection con = new MySqlConnection(ConfigurationManager.AppSettings["cons"]);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }

        }
      
        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            // to check the server connection open or not:

            if (con.State != System.Data.ConnectionState.Open)
            {
                try
                {
                    con.Open();
                }
                catch
                {
                    Response.Write("<script>alert('Sql Connection is not stared Please check it Once again.');</script>");
                    return;
                }
            }
            string checkQuery = "SELECT COUNT(*) FROM userinfo WHERE email = @Email";
            MySqlCommand checkCmd = new MySqlCommand(checkQuery, con);
            checkCmd.Parameters.AddWithValue("@Email", email.Value);


            int count = Convert.ToInt32(checkCmd.ExecuteScalar());

            if (count > 0)
            {
                Response.Write("<script>alert('This email is already registered.');</script>");
            }
            else
            {
                string query = "insert into userinfo(firstName,lastName,email,password) values('" + firstName.Value + "','" + lastName.Value + "','" + email.Value + "','" + password.Value + "')";
                MySqlCommand cmd = new MySqlCommand(query, con);

                cmd.ExecuteNonQuery();

                Response.Write("<script>alert('Registered Successfully');window.location='login.aspx';</script>");
            }

            
            con.Close();

        }

    }
}