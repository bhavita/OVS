using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        Page.ClientScript.RegisterStartupScript(
   this.GetType(), "OpenWindow", "window.open('https://www.facebook.com/sharer/sharer.php?u=https://www.facebook.com/ovsaadhar','_newtab');", true);
    }


}