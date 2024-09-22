using Smart_Reservation_Training_Classes.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Smart_Reservation_Training_Classes
{
    public partial class Site : System.Web.UI.MasterPage
    {
        CLS_Users cls_LoginUsers = new CLS_Users();
        DataTable dtUsers = new DataTable();
        //SRTC_DBDataContext ctxSRTC_DB;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserID"] != null)
                {
                    lblName.Text = Session["Name"].ToString();
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
            try
            {
                dtUsers = cls_LoginUsers.SearchUser((string)Session["UserID"]);
                if (dtUsers.Rows.Count > 0)
                {
                    foreach (DataRow row in dtUsers.Rows)
                    {
                        if (row["Role"].ToString() == "Admin")
                        {
                            MenusAdmin.Visible = true;
                            MenusUsers.Visible = false;
                        }
                        else if (row["Role"].ToString() == "User")
                        {
                            MenusAdmin.Visible = false;
                            MenusUsers.Visible = true;
                        }
                    }
                }
            }
            catch (Exception excMenusAdminAndUsers)
            {
                throw excMenusAdminAndUsers;
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "onload", excMenusAdminAndUsers.Message.ToString() + "<script>swal('لم يتم العثور على بيانات','', 'error');</script>");
            }
        }
    }
}