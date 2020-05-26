using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Donate
{
    public partial class index : System.Web.UI.Page
    {
        DonateEntities db = new DonateEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            // 安全必要设置
            if (Session["phoneNumber"] == null)
            {
                Response.Redirect("./login.aspx");
            }
            int role = Convert.ToInt32(Session["role"]);
            if (!IsPostBack)
            {
                var query = from item in db.menu where item.role == role && item.status == 1 && item.parent_id == "0" select item;
                menuRepeater.DataSource = query.ToList();
                menuRepeater.DataBind();
                string nick = "";
                if (Session["nick"] != null)
                {
                    nick = Session["nick"].ToString();
                }
                Label1.Text = nick;
                // 右上角菜单列表
                string menuID = "";
                if (role == 3)
                { // 普通用户
                    menuID = "D";
                }
                else if (role == 1 || role == 2)
                { // 管理员
                    menuID = "H2";
                }
                var rquery = from item in db.menu
                             where item.parent_id == menuID
                             select new { item.name, item.url };
                rmenuRepeater.DataSource = rquery.ToList();
                rmenuRepeater.DataBind();
            }
        }
        protected void menuRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            //找到内层的repeater控件
            Repeater functionRepeater = (Repeater)e.Item.FindControl("functionRepeater");
            menu rowv = (menu)e.Item.DataItem;
            //读取上一层repeater控件中保存的菜单id，并且根据该id去读取菜单下的功能
            int rid = Convert.ToInt32(rowv.id);
            var query = from menu in db.menu
                        where menu.parent_id == (
   (from menu0 in db.menu
    where menu0.id == rid
    select new
    {
        menu0.self_id
    }).FirstOrDefault().self_id)
                        select
                            menu;
            //绑定数据
            functionRepeater.DataSource = query.ToList();
            functionRepeater.DataBind();
        }
        protected void menuRepeater_ItemDataBound2(object sender, RepeaterItemEventArgs e)
        {
            //找到内层的repeater控件
            Repeater functionRepeater2 = (Repeater)e.Item.FindControl("functionRepeater2");
            menu rowv = (menu)e.Item.DataItem;
            //读取上一层repeater控件中保存的菜单id，并且根据该id去读取菜单下的功能
            int rid = Convert.ToInt32(rowv.id);
            var query = from menu in db.menu
                        where menu.parent_id == (
   (from menu0 in db.menu
    where menu0.id == rid
    select new
    {
        menu0.self_id
    }).FirstOrDefault().self_id)
                        select
                            menu;
            //绑定数据
            functionRepeater2.DataSource = query.ToList();
            functionRepeater2.DataBind();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("/login.aspx");
        }
    }
}