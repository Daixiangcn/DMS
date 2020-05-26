using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Donate.admin.setting.consumer
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
            //判断是否上传了文件
            //if (FileUpload1.HasFile)
            //{
            //    //指定上传文件在服务器上的保存路径
            //    string savePath = Server.MapPath("~/upload/");
            //    //检查服务器上是否存在这个物理路径，如果不存在则创建
            //    if (!System.IO.Directory.Exists(savePath))
            //    {
            //        //需要注意的是，需要对这个物理路径有足够的权限，否则会报错
            //        //另外，这个路径应该是在网站之下，而将网站部署在C盘却把文件保存在D盘
            //        System.IO.Directory.CreateDirectory(savePath);
            //    }
            //    savePath = savePath + "\\" + FileUpload1.FileName;
            //    FileUpload1.SaveAs(savePath);//保存文件
            //    //不过需要注意的是，在客户端访问却需要指定的是URL地址，而不是服务器上的物理地址
            //    imgUrlTextBox.Text = string.Format("<a href='upload/{0}'>upload{0}</a>", FileUpload1.FileName);
            //}
        }
        protected string RoleName(object sender) {
            int id = Convert.ToInt32(sender);
            var query = from item in db.role where item.id == id select item.name;
            return query.First();
        }
    }
}