using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace advertiseManegement
{
    public partial class logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           // if (Session["user"] == null || Session["role"] == null)
         //   {
           //     Response.Write("<script>alert('Logout Successful!'); window.location='login.aspx';</script>");
           // }
          
            Session.Clear();
            Session.Abandon();
            Response.Cookies.Clear();

            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
            Response.Cache.SetExpires(DateTime.UtcNow.AddSeconds(-1));
            Response.Cache.SetRevalidation(HttpCacheRevalidation.AllCaches);
            Response.Cache.SetValidUntilExpires(false);

            Response.Write("<script>alert('Logout Successful!'); window.location='login.aspx';</script>");
        }

    }
}

