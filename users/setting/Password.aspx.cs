using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Donate.users.setting
{
    public partial class Password : System.Web.UI.Page
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
            string oldpassword = TextBox1.Text.Trim();
            string newpassword = TextBox2.Text.Trim();
            int uid = Convert.ToInt32(Session["uid"]);
            var query = from item in db.user where item.password == oldpassword && item.uid == uid select item;
            if (query.Count() != 0)
            {
                user u = query.First();
                u.password = newpassword;
                db.SaveChanges();
                Response.Write("<script>alert('密码修改成功！')</script>");
            }
            else
            {
                Response.Write("<script>alert('对不起，原密码错误！')</script>");
            }
        }
        // 重置
        protected void Button2_Click(object sender, EventArgs e)
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
        }
    }
}