using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Donate.admin.userM
{
    public partial class addRole : System.Web.UI.Page
    {
        DonateEntities db = new DonateEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            // 安全必要设置
            if (Session["phoneNumber"] == null)
            {
                Response.Redirect("/login.aspx");
            }
            int role = Convert.ToInt32(Session["role"]);
        }
        // 提交
        protected void Button1_Click(object sender, EventArgs e)
        {
            role r = new role();
            r.name = TextBox1.Text.Trim();
            db.role.Add(r);
            db.SaveChanges();
            Response.Redirect("/admin/userM/Role.aspx");
        }
        // 取消
        protected void Button2_Click(object sender, EventArgs e)
        {
            TextBox1.Text = "";
        }
    }
}