using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


public partial class Voting : System.Web.UI.Page
{
    SqlDataAdapter dadapter; DataSet dset; PagedDataSource adsource;
    string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    int pos; SqlDataReader dr1; 
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            

            this.ViewState["vs"] = 0;
        }
        pos = (int)this.ViewState["vs"];
        databind();
    }


    public void databind()
    {
        dadapter = new SqlDataAdapter("select c_id,c_name,cons_id,pid from candidate where cons_id=(select cons_id from voterinfo where vid=200012367893)", connstring);
       // dadapter = new SqlDataAdapter("select * from candidate", connstring);
        dset = new DataSet();
        adsource = new PagedDataSource();
        dadapter.Fill(dset);
        adsource.DataSource = dset.Tables[0].DefaultView;
        adsource.PageSize = 25;
        adsource.AllowPaging = true;
        adsource.CurrentPageIndex = pos;
        btnfirst.Enabled = !adsource.IsFirstPage;
        btnprevious.Enabled = !adsource.IsFirstPage;
        btnlast.Enabled = !adsource.IsLastPage;
        btnnext.Enabled = !adsource.IsLastPage;
        DataList2.DataSource = adsource;
        DataList2.DataBind();
    }
    protected void sw1_Command(object sender, CommandEventArgs e)
    {
        Response.Write(e.CommandArgument.ToString());
    }

    protected void btnfirst_Click(object sender, EventArgs e)
    {
        pos = 0;
        databind();
    }

    protected void btnprevious_Click(object sender, EventArgs e)
    {
        pos = (int)this.ViewState["vs"];
        pos -= 1;
        this.ViewState["vs"] = pos;
        databind();
    }

    protected void btnnext_Click(object sender, EventArgs e)
    {
        pos = (int)this.ViewState["vs"];
        pos += 1;
        this.ViewState["vs"] = pos;
        databind();
    }

    protected void btnlast_Click(object sender, EventArgs e)
    {
        pos = adsource.PageCount - 1;
        databind();
    }

    protected void Edit_Command(object source, DataListCommandEventArgs e)
    {
        
        int ID = Convert.ToInt32(e.CommandArgument);
        Response.Write("cid is "+ID);
        //t_type_id.Text = ID.ToString();
        //string cs1 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        //SqlConnection con1 = new SqlConnection(cs1);
        //con1.Open();
        //SqlCommand cmd = new SqlCommand();
        //cmd.CommandText = "SELECT * FROM TypeMaster where TypeId=@TypeId";
        //cmd.Parameters.Add("@TypeId", ID);


        //cmd.Connection = con1;
        //SqlDataReader rdr;
        //rdr = cmd.ExecuteReader();
        //int j = 0;
        //if (rdr != null)
        //{
        //    while (rdr.Read())
        //    {
        //        j++;
        //        t_type_id.Text = rdr.GetDecimal(0).ToString();
        //        t_type_desc.Text = rdr.GetString(1);
        //    }

        //}
        //t_type_id.Enabled = false;
        //databind();
    }

}