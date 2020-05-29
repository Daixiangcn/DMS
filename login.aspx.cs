using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Donate
{
    public partial class login : System.Web.UI.Page
    {
        DonateEntities db = new DonateEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            // 系统信息获取
            var query = from item in db.systemInfo select item;
            Label2.Text = query.First().name;
            Page.Title = "统一身份认证 - " + query.First().title;
            Page.MetaKeywords = query.First().keywords;
            Page.MetaDescription = query.First().description;
           
            if (!IsPostBack)
            {
               this.SerialNumber1.Create(); 
             
            }
            if (Request.Cookies["phoneNumber"] != null)
            {
                TextBox1.Text = Request.Cookies["phoneNumber"].Value;
            }
            if (Request.Cookies["password"] != null)
            {
                TextBox2.Text = Request.Cookies["password"].Value;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            bool flag=true;
            flag = this.SerialNumber1.CheckSN(TextBox3.Text.Trim());
          
            string conString = ConfigurationManager.ConnectionStrings["DonateConnectionStrings"].ToString();
            MySqlConnection conn = new MySqlConnection(conString);
            try
            {
                conn.Open();
                //Response.Write("数据库连接成功！");

                MySqlCommand cmd = new MySqlCommand(string.Format("select count(*) from user where phoneNumber='{0}' and password='{1}'", TextBox1.Text.Trim(), TextBox2.Text.Trim()), conn);
                int count = Convert.ToInt16(cmd.ExecuteScalar());
                if (count == 1 && flag == true)
                {
                    var query = from u in db.user where u.phoneNumber == TextBox1.Text.Trim() select u;
                    int role = Convert.ToInt32(query.First().role);
                    string nick = query.First().nick;
                    int uid = query.First().uid;
                    Session.Clear();
                    Session["role"] = role;
                    Session["nick"] = nick;
                    Session["phoneNumber"] = TextBox1.Text.Trim();
                    Session["uid"] = uid;
                    Response.Redirect("./index.aspx");
                }

                else
                {
                    Label1.Text = "用户名或密码错误";
                    Label1.ForeColor = System.Drawing.Color.Red;
                }
                if (flag == false)
                {
                    Label1.Text = "验证码错误";
                    Label1.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch (Exception ex)
            {
                Label1.Text = ex.Message;
                Label1.ForeColor = System.Drawing.Color.Red;
                //Response.Write(ex.Message);
            }
            finally
            {
                conn.Close();
            }
            this.SerialNumber1.Create();
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox1.Checked == true)
            {
                if (TextBox1.Text != "" && TextBox2.Text != "")
                {
                    Response.Cookies["phoneNumber"].Value = TextBox1.Text.Trim();

                    Response.Cookies["phoneNumber"].Expires = DateTime.Now.AddDays(7);
                    Response.Cookies["password"].Value = TextBox2.Text.Trim();

                    Response.Cookies["password"].Expires = DateTime.Now.AddDays(7);

                }
            }
        }
    }
}