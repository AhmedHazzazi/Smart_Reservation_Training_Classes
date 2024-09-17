using Smart_Reservation_Training_Classes.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Smart_Reservation_Training_Classes
{
    public partial class index : System.Web.UI.Page
    {
        CLS_LoginUsers cls_LoginUsers = new CLS_LoginUsers();
        DataTable dtUsers = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["userOnLive"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }
                RolesMenu();
            }
        }
        private void RolesMenu()
        {
            try
            {
                dtUsers = cls_LoginUsers.SearchUser((string)Session["userOnLive"]);
                if (dtUsers.Rows.Count > 0)
                {
                    foreach (DataRow row in dtUsers.Rows)
                    {
                        if (row["Role"].ToString() == "Admin")
                        {
                            Admin.Visible = true;
                            Users.Visible = false;
                        }
                        else if (row["Role"].ToString() == "User")
                        {
                            Admin.Visible = false;
                            Users.Visible = true;
                        }
                    }
                }
                else
                {
                    Error_Panel.Visible=true;;
                    lblErrorMsg.Text = "حدث خطأ في إسترجاع البيانات أو لا يوجد لديك صلاحية الوصول إلى هذه الصفحة";
                }
            }
            catch (Exception excRolesMenu)
            {
                Error_Panel.Visible = true; ;
                lblErrorMsg.Text = "حدث خطأ في إسترجاع البيانات" + " " + excRolesMenu.Message.ToString();
            }
        }
    }
}