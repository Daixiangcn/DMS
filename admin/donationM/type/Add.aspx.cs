using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Donate.admin.donationM.type
{
    public partial class Add : System.Web.UI.Page
    {
        DonateEntities db = new DonateEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            // 安全必要设置
            if (Session["phoneNumber"] == null)
            {
                Response.Redirect("./login.aspx");
            }
            int role = Convert.ToInt32(Session["role"]);
        }
        // 立即提交
        protected void Button1_Click(object sender, EventArgs e)
        {
            string typ_name = TextBox1.Text.Trim();
            string description = Request.Form["description"];
            typeInfo typ = new typeInfo();
            typ.name = typ_name;
            typ.description = description;
            db.typeInfo.Add(typ);
            db.SaveChanges();
            Response.Write("<script>alert('成功添加一条记录！')</script>");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            TextBox1.Text = "";
        }
    }
}