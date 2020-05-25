using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Donate.home
{
    public partial class home : System.Web.UI.Page
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
            dateLabel.Text = DateTime.Now.ToString();
            var query = from d in (from d in db.donation select new { d.money, Dummy = "x" })
                        group d by new { d.Dummy } into don
                        select new
                        {
                            all = (decimal?)don.Sum(p => p.money)/10000,
                            count = don.Count(),
                            lineMoney = (from don2 in db.donation where don2.type_id == 1 select don2).Sum(q => q.money) / 10000,
                            outlineMoney = (from don2 in db.donation where don2.type_id == 2 select don2).Sum(q => q.money) / 10000,
                            lineCount = (from don2 in db.donation where don2.type_id == 1 select don2).Count(),
                            outlineCount = (from don2 in db.donation where don2.type_id == 2 select don2).Count(),
                        };
            Label1.Text = query.First().all.ToString();
            Label2.Text = query.First().count.ToString();
            Label3.Text = query.First().lineMoney.ToString();
            Label4.Text = query.First().outlineMoney.ToString();
            Label5.Text = query.First().lineCount.ToString();
            Label6.Text = query.First().outlineCount.ToString();
            Label7.Text = query.First().count.ToString();
        }
    }
}