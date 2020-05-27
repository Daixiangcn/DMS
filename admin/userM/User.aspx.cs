using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Donate.admin.UserManagement
{
    public partial class User : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // 安全必要设置
            if (Session["phoneNumber"] == null)
            {
                Response.Redirect("/login.aspx");
            }
            int role = Convert.ToInt32(Session["role"]);
        }
        // 搜索
        protected void Button1_Click(object sender, EventArgs e)
        {
            GridView1.DataSourceID = "SqlDataSource3";
            GridView1.DataBind();
        }
        // 查询全部
        protected void Button2_Click(object sender, EventArgs e)
        {
            GridView1.DataSourceID = "SqlDataSource1";
            GridView1.DataBind();
        }
        // 选择后弹出新页
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int x = GridView1.SelectedIndex;
            if (x > -1)
            {
                int uid = Convert.ToInt32(GridView1.Rows[x].Cells[0].Text);
                Response.Write("<script></script>");
            }
        }
    }
}