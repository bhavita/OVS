using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Admin_Admin_Screen : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
         //   BindData();
        
    }

    //private DataTable GetData(SqlCommand cmd)
    //{
    //    DataTable dt = new DataTable();
    //    string cs = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    //    SqlConnection con = new SqlConnection(cs);
    //    SqlDataAdapter sda = new SqlDataAdapter();
    //    cmd.CommandType = CommandType.Text;
    //    cmd.Connection = con;
    //    con.Open();
    //    try
    //    {
    //        sda.SelectCommand = cmd;

    //        sda.Fill(dt);
    //    }
    //    catch (Exception rty) {
    //        Response.Redirect("../Admin_Login.aspx");
    //    }
    //    return dt;

    //}

    //private void BindData()
    //{
    //    string cs = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    //    SqlConnection con = new SqlConnection(cs);
    //    con.Open();
    //    string strQuery = "select * from party";
    //    SqlCommand cmd = new SqlCommand(strQuery);
    //    GridView1.DataSource = GetData(cmd);
    //    GridView1.DataBind();
    //}

    //protected void AddNewCustomer(object sender, EventArgs e)
    //{
    //    string cs = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    //    string CustomerID = ((TextBox)GridView1.FooterRow.FindControl("txtCustomerID")).Text;
    //    string Name = ((TextBox)GridView1.FooterRow.FindControl("txtContactName")).Text;
       
    //    SqlConnection con = new SqlConnection(cs);
    //    SqlCommand cmd = new SqlCommand();
    //    cmd.CommandType = CommandType.Text;
    //    cmd.CommandText = "insert into party(pid, pname) " +
    //    "values(@CustomerID, @ContactName);" +
    //    "select pid,pname from party";
    //    cmd.Parameters.Add("@CustomerID", SqlDbType.VarChar).Value = CustomerID;
    //    cmd.Parameters.Add("@ContactName", SqlDbType.VarChar).Value = Name;
       
    //    GridView1.DataSource = GetData(cmd);
    //    GridView1.DataBind();
    //}

    ////delete 
    //protected void DeleteCustomer(object sender, EventArgs e)
    //{
    //    string cs = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    //    LinkButton lnkRemove = (LinkButton)sender;
    //    SqlConnection con = new SqlConnection(cs);
    //    SqlCommand cmd = new SqlCommand();
    //    cmd.CommandType = CommandType.Text;
       
    //        cmd.CommandText = "delete from  party where " +
    //        "pid=@CustomerID;" +
    //         "select * from party";
    //        cmd.Parameters.Add("@CustomerID", SqlDbType.VarChar).Value
    //            = lnkRemove.CommandArgument;
    //    GridView1.DataSource = GetData(cmd);
    //    GridView1.DataBind();
    //}

    //protected void UpdateCustomer(object sender, GridViewUpdateEventArgs e)
    //{
    //    string cs = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    //    string CustomerID = ((Label)GridView1.Rows[e.RowIndex]
    //                        .FindControl("lblCustomerID")).Text;
    //    string Name = ((TextBox)GridView1.Rows[e.RowIndex]
    //                        .FindControl("txtContactName")).Text;
       
    //    SqlConnection con = new SqlConnection(cs);
    //    SqlCommand cmd = new SqlCommand();
    //    cmd.CommandType = CommandType.Text;
    //    cmd.CommandText = "update party set pname=@ContactName where pid=@CustomerID;" +
    //     "select * from party";
    //    cmd.Parameters.Add("@CustomerID", SqlDbType.VarChar).Value = CustomerID;
    //    cmd.Parameters.Add("@ContactName", SqlDbType.VarChar).Value = Name;
    //    GridView1.EditIndex = -1;
    //    GridView1.DataSource = GetData(cmd);
    //    GridView1.DataBind();
    //}
    //protected void OnPaging(object sender, GridViewPageEventArgs e)
    //{
    //    BindData();
    //    GridView1.PageIndex = e.NewPageIndex;
    //    GridView1.DataBind();
    //}

    //protected void EditCustomer(object sender, GridViewEditEventArgs e)
    //{
    //    GridView1.EditIndex = e.NewEditIndex;
    //    BindData();
    //}
    //protected void CancelEdit(object sender, GridViewCancelEditEventArgs e)
    //{
    //    GridView1.EditIndex = -1;
    //    BindData();
    //}

   
}