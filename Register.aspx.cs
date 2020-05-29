using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;
using ZhenziSms;
using System.Threading;



namespace Donate
{
    public partial class Register : System.Web.UI.Page
    {
        DonateEntities db = new DonateEntities();
        static string code = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // 系统信息获取
                var query = from item in db.systemInfo select item;
                Label.Text = query.First().name;
                Page.Title = "统一身份认证 - " + query.First().title;
                Page.MetaKeywords = query.First().keywords;
                Page.MetaDescription = query.First().description;
            }
        }
        // 重置
        protected void Button2_Click(object sender, EventArgs e)
        {
            TextBox1.Text = TextBox2.Text = TextBox3.Text = TextBox4.Text = "";
        }
        // 注册
        protected void Button1_Click(object sender, EventArgs e)
        {
            DonateEntities db = new DonateEntities();
            string phoneNumber = TextBox1.Text.Trim();
            string password = TextBox2.Text.Trim();
            string inputCode = TextBox4.Text.Trim();
            var query = from item in db.user where item.phoneNumber == phoneNumber select item;
            if (query.Count() == 0)
            {
                if (inputCode == code)
                {
                    user u = new user();
                    u.phoneNumber = phoneNumber;
                    u.password = password;
                    db.user.Add(u);
                    db.SaveChanges();
                    Response.Redirect("/login.aspx");
                }
                else
                {
                    Response.Write("<script>alert('验证码不正确！')</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('此手机号已被注册，请更换手机号！')</script>");
            }
        }
        // 获取验证码
        protected void Button3_Click(object sender, EventArgs e)
        {
            Button3.Enabled = false; // 禁用按钮
            mesageCode();  // 生成验证码
            var client = new ZhenziSmsClient("https://sms.zhenzikj.com", "100200", "2e56ec7b-0ad8-4b7c-9996-98ec087dfec5");

            var parameters = new Dictionary<string, Object>();
            parameters.Add("number", TextBox1.Text.Trim());
            parameters.Add("templateId", "48");
            var templateParams = new string[2];
            templateParams[0] = code;
            templateParams[1] = "5分钟";
            parameters.Add("templateParams", templateParams);
            //parameters.Add("clientIp", "792.168.2.222");
            //parameters.Add("messageId", "");
            var result = client.Send(parameters);
        }
        // 生成验证码
        protected void mesageCode()
        {
            Random rd = new Random();
            int i = rd.Next();
            code = i.ToString().Substring(0, 4);
        }
    }
}