using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Donate.users
{
    public partial class Authentication : System.Web.UI.Page
    {
        DonateEntities db = new DonateEntities();
        protected void Page_Load(object sender, EventArgs e)
        {


        }
        // 重置
        protected void Button2_Click(object sender, EventArgs e)
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
        }
        // 提交
        protected void Button1_Click(object sender, EventArgs e)
        {
            int uid = Convert.ToInt32(Session["uid"]);
            string id_num = TextBox1.Text.Trim();
            string name = TextBox2.Text.Trim();
            string phoneNumber = TextBox3.Text.Trim();
            var query = from item in db.Authentication where item.id_num == id_num &&  item.name == name && item.phoneNumber == phoneNumber select item;
            if (query.FirstOrDefault()!= null) {
                //Authentication ab = db.Authentication.FirstOrDefault(a => a.uid == uid);
                //insert into set name = name,phoneNumber = phoneNumber where phoneNumber not in (select )
         
            }
        }
    }
}