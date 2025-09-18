using MySql.Data.MySqlClient;
using System;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;


namespace advertiseManegement
{
    public partial class admindashboard : System.Web.UI.Page
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
                    LoadUsers();
                }

            }

        }

        private void LoadUsers()
        {
            try
            {
                con.Open();
                string query = "SELECT id, firstName, lastName, email, status FROM userinfo";
                MySqlDataAdapter da = new MySqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridViewUsers.DataSource = dt;
                GridViewUsers.DataBind();
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

        protected void GridViewUsers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (!int.TryParse(e.CommandArgument.ToString(), out int index) || index < 0 || index >= GridViewUsers.Rows.Count)
                return; // safety check


            string userEmail = GridViewUsers.DataKeys[index].Value.ToString();

            string sql = "";
            string message = "";

            if (e.CommandName == "ApproveUser")
            {
                sql = "UPDATE userinfo SET status='Approved' WHERE email=@Email";
                message = "User approved successfully.";
            }
            else if (e.CommandName == "RejectUser")
            {
                sql = "UPDATE userinfo SET status='Rejected' WHERE email=@Email";
                message = "User rejected successfully.";
            }
            else if (e.CommandName == "DeleteUser")
            {
                sql = "DELETE FROM userinfo WHERE email=@Email";
                message = "User deleted successfully.";
            }

            if (!string.IsNullOrEmpty(sql))
            {
                RunQuery(sql, userEmail, message);
                LoadUsers();
            }
        }

        private void RunQuery(string sql, string userEmail, string message)
        {
            try
            {
                con.Open();
                MySqlCommand cmd = new MySqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@Email", userEmail);
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.ClearContent();
            Response.AppendHeader("content-disposition", "attachment; filename=userinfo.xlsx");
            Response.ContentType = "application/excel";
            StringWriter stringWriter = new System.IO.StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(stringWriter);

            GridViewUsers.HeaderRow.Style.Add("background-color", "#FFFFFF");

            foreach (TableCell tableCell in GridViewUsers.HeaderRow.Cells)
            {
                tableCell.Style["background-color"] = "#A55129";
            }

            foreach (GridViewRow gridViewRow in GridViewUsers.Rows)
            {
                gridViewRow.BackColor = System.Drawing.Color.White;
                foreach (TableCell gridViewRowTableCell in gridViewRow.Cells)
                {
                    gridViewRowTableCell.Style["background-color"] = "#FFF7E7";
                }
            }

            GridViewUsers.RenderControl(htw);
            Response.Write(stringWriter.ToString());
            Response.End();
        }
        
        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.ClearContent();
            Response.AppendHeader("content-disposition", "attachment; filename=userinfo.doc");
            Response.ContentType = "application/word";
            StringWriter stringWriter = new System.IO.StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(stringWriter);

            // excel sheet coloring cells 

            GridViewUsers.HeaderRow.Style.Add("background-color", "#FFFFFF");

            foreach (TableCell tableCell in GridViewUsers.HeaderRow.Cells)
            {
                tableCell.Style["background-color"] = "#A55129";
            }

            foreach (GridViewRow gridViewRow in GridViewUsers.Rows)
            {
                gridViewRow.BackColor = System.Drawing.Color.White;
                foreach (TableCell gridViewRowTableCell in gridViewRow.Cells)
                {
                    gridViewRowTableCell.Style["background-color"] = "#FFF7E7";
                }
            }

            GridViewUsers.RenderControl(htw);
            Response.Write(stringWriter.ToString());
            Response.End();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {

        }
    }
    
}
