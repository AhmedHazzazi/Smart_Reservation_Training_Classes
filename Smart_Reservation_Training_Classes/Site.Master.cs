using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Smart_Reservation_Training_Classes
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["userOnLive"] != null)
                {
                    lblEmpInfo.Text = Session["ArabicName"].ToString();
                    MenusAdminAndUsers();
                }
            }
            if (IsPostBack)
            {
                Page.ClientScript.RegisterClientScriptBlock(this.Page.GetType(), "waiting_finishing2", "setTimeout(function () { $('.waiting').hide(); }, 300);", true);
                if (!Page.ClientScript.IsClientScriptBlockRegistered(this.GetType(), "waiting_finishing2"))
                {
                    ScriptManager.RegisterClientScriptBlock((Page)HttpContext.Current.Handler, this.Page.GetType(), "waiting finishing", "setTimeout(function () { $('.waiting').hide(); }, 300);", true);
                }
            }
        }
        private void MenusAdminAndUsers()
        {
            //try
            //{
            //    string userOnLive = (string)Session["userOnLive"];
            //    User users = ctxUpdateDataEmp.GetTable<User>().Where(x => x.EmployeeNumber.Equals(userOnLive) && x.AccessKey.Equals(1)).FirstOrDefault();
            //    if (users != null)
            //    {
            //        Home.Visible = true;
            //        Roles.Visible = true;
            //    }
            //    else
            //    {
            //        Home.Visible = true;
            //        Roles.Visible = false;
            //    }
            //}
            //catch (Exception excRoleMenu)
            //{
            //    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", excRoleMenu.Message.ToString() + "<script>swal('لم يتم العثور على بيانات','', 'error');</script>");
            //}
        }
    }
}