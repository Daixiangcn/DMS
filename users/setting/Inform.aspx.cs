using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Donate.users.setting
{
    public partial class Inform : System.Web.UI.Page
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
        // 上传图片
        protected void Button1_Click(object sender, EventArgs e)
        {
            // 判断是否上传了文件
            if (((FileUpload)FormView1.FindControl("FileUpload1")).HasFile)
            {
                string vsfilename = ((FileUpload)FormView1.FindControl("FileUpload1")).FileName;//获取文件的名称
                int index = vsfilename.LastIndexOf(".");
                string typeName = vsfilename.Substring(index).ToLower();//取文件的扩展名
                string fileName = System.DateTime.Now.ToString("yyyyMMddHHmmssffff");//声称文件名，防止重复
                fileName = fileName + typeName;//完整的上传文件名
                //指定上传文件在服务器上的保存路径
                string savePath = Server.MapPath("~/img/head/");
                //检查服务器上是否存在这个物理路径，如果不存在则创建
                if (!System.IO.Directory.Exists(savePath))
                {
                    //需要注意的是，需要对这个物理路径有足够的权限，否则会报错。另外，这个路径应该是在网站之下
                    System.IO.Directory.CreateDirectory(savePath);
                }
                savePath = savePath + "\\" + fileName;
                ((FileUpload)FormView1.FindControl("FileUpload1")).SaveAs(savePath);//保存文件
                string imgUrl = string.Format("/img/head/{0}", fileName);
                // 更新imgUrl到数据表
                int uid = Convert.ToInt32(Session["uid"]);
                user u = db.user.FirstOrDefault(a => a.uid == uid);
                u.imgUrl = imgUrl;
                db.SaveChanges();
                //不过需要注意的是，在客户端访问却需要指定的是URL地址，而不是服务器上的物理地址
                ((TextBox)FormView1.FindControl("imgUrlTextBox")).Text = imgUrl;
                ((Image)FormView1.FindControl("Image2")).ImageUrl = imgUrl;
            }
        }
        // 获取时间戳
        public string GetTimeStamp()
        {
            TimeSpan ts = DateTime.Now - new DateTime(1970, 1, 1, 0, 0, 0, 0);
            return Convert.ToInt64(ts.TotalSeconds).ToString();
        }
        // 将user中的rold数字对应到role表的name
        protected string RoleName(object sender)
        {
            int id = Convert.ToInt32(sender);
            var query = from item in db.role where item.id == id select item.name;
            return query.First();
        }
    }
}