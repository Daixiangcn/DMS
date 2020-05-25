using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Donate.admin.infoUp
{
    public partial class Edit : System.Web.UI.Page
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
        // 立即提交
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Request.Form["date"] == "")
            {
                Response.Write("<script>alert('日期必须选择！')</script>");
            }
            else
            {
                DateTime time = Convert.ToDateTime(Request.Form["date"]);
                int obj_id = Convert.ToInt32(DropDownList1.SelectedValue);
                int type_id = Convert.ToInt32(DropDownList2.SelectedValue);
                string donor = TextBox1.Text.Trim();
                string money = TextBox2.Text.Trim();
                string message = Request.Form["message"];

                donation don = new donation();
                don.time = time;
                don.obj_id = obj_id;
                don.type_id = type_id;
                don.donor = donor;
                don.money = Convert.ToDecimal(money);
                don.message = message;
                db.donation.Add(don);
                db.SaveChanges();
                Response.Write("<script>alert('您已成功上传一条信息！')</script>");
            }
        }
    }
}