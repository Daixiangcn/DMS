using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;



namespace Donate
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            TextBox1.Text = TextBox2.Text = TextBox3.Text = TextBox4.Text = "";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DonateEntities db = new DonateEntities();
            string phoneNumber = TextBox1.Text.Trim();
            string password = TextBox2.Text.Trim();
            var query1 = from item in db.user where item.phoneNumber == phoneNumber select item;
            if (query1.First() == null)
            {
                user u = new user();
                u.phoneNumber = phoneNumber;
                u.password = password;
                db.user.Add(u);
                db.SaveChanges();
                Response.Write("注册成功！");
            }
            else
            {
                Response.Write("此手机号已被注册，请更换手机号！");
            }
        }
    }
}