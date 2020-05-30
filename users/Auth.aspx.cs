using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZhenziSms;

namespace Donate.users
{
    public partial class Auth : System.Web.UI.Page
    {
        DonateEntities db = new DonateEntities();
        static string code = "PPQ";
        protected void Page_Load(object sender, EventArgs e)
        {
            // 安全必要设置
            if (Session["phoneNumber"] == null)
            {
                Response.Redirect("/login.aspx");
            }
            int role = Convert.ToInt32(Session["role"]);
            string phoneNumber = Session["phoneNumber"].ToString();
            var query = from item in db.Authentication where item.phoneNumber == phoneNumber select item;
            if (query.First().uid != null) {
                Response.Write("您已认证！");
                this.authCard.Style.Value = "display:none";
            }
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
            string inputCode = TextBox4.Text.Trim();
            var query = from item in db.Authentication where item.id_num == id_num && item.name == name && item.phoneNumber == phoneNumber select item;
            if (query.Count() != 0)
            {
                // 将uid更新到Auth表中
                if (inputCode == code)
                {
                    Authentication a = db.Authentication.FirstOrDefault(b=>b.phoneNumber==phoneNumber);
                    a.uid = uid;
                    db.SaveChanges();
                    string str = "恭喜您，认证成功！";
                    string url = "/users/Auth.aspx";
                    Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>alert('" + str + "');location.href='" + url + "';</script>");
                }
                else
                {
                    Response.Write("<script>alert('短信验证码不正确！')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('认证失败，原因：身份证号与姓名、手机号码不匹配！')</script>");
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