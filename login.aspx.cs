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
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string conString = ConfigurationManager.ConnectionStrings["DonateConnectionStrings"].ToString();
            MySqlConnection conn = new MySqlConnection(conString);
            try
            {
                conn.Open();
                //Response.Write("数据库连接成功！");

                MySqlCommand cmd = new MySqlCommand(string.Format("select count(*) from user where phoneNumber='{0}' and password='{1}'", TextBox1.Text, TextBox2.Text), conn);
                int count = Convert.ToInt16(cmd.ExecuteScalar());
                if (count == 1)
                {
                    Session["phoneNumber"] = TextBox1.Text;
                    Response.Redirect("./index.aspx");
                }
                else
                {
                    Label1.Text = "用户名或密码错误";
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
        }
    }
}