using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Donate.admin.donationM.objectTab
{
    public partial class add : System.Web.UI.Page
    {
        DonateEntities db = new DonateEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        // 立即提交
        protected void Button1_Click(object sender, EventArgs e)
        {
            string obj_name = TextBox1.Text.Trim();
            string description = Request.Form["description"];
            Donate.objectTab obj = new Donate.objectTab();
            obj.name = obj_name;
            obj.description = description;
            db.objectTab.Add(obj);
            db.SaveChanges();
            Response.Write("<script>alert('成功添加一条记录！')</script>");
        }
    }
}