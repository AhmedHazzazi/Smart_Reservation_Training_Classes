using Smart_Reservation_Training_Classes.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Smart_Reservation_Training_Classes
{
    public partial class Login : System.Web.UI.Page
    {
        CLS_Users cls_LoginUsers = new CLS_Users();
        DataTable dtUsers = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            txtUserName.Focus();
            //liMsg.Text = string.Empty;
            //liMsg.Visible = false;
            userNameRequire.Visible = false;
            passwordRequire.Visible = false;
            //HtmlGenericControl MenusUsers = (HtmlGenericControl)Master.FindControl("MenusUsers");
            //MenusUsers.Visible = false;
            //HtmlGenericControl MenusAdmin = (HtmlGenericControl)Master.FindControl("MenusAdmin");
            //MenusAdmin.Visible = false;

        }
        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                if (!string.IsNullOrEmpty(txtUserName.Text) && !string.IsNullOrEmpty(txtPassword.Text))
                {
                    dtUsers = cls_LoginUsers.LoginUsers(txtUserName.Text, txtPassword.Text);
                    if (dtUsers.Rows.Count > 0)
                    {
                        foreach (DataRow row in dtUsers.Rows)
                        {
                            Session["UserID"] = row["UserID"].ToString();
                            Session["Name"] = row["Name"].ToString();
                        }
                        Response.Redirect("index.aspx");
                    }
                    else
                    {
                        liMsg.Visible = true;
                        liMsg.Text = "عذرا.. غير مصرح لك بالدخول !";
                    }
                }
                else if (string.IsNullOrEmpty(txtUserName.Text) && string.IsNullOrEmpty(txtPassword.Text))
                {
                    userNameRequire.Visible = true;
                    passwordRequire.Visible = true;
                }
                else if (string.IsNullOrEmpty(txtUserName.Text))
                {
                    userNameRequire.Visible = true;
                }
                else if (string.IsNullOrEmpty(txtPassword.Text))
                {
                    passwordRequire.Visible = true;
                }
                else
                {
                    userNameRequire.Visible = false;
                    passwordRequire.Visible = true;
                }
            }
            catch (Exception excLogin)
            {
                liMsg.Visible = true;
                liMsg.Text = excLogin.ToString();
            }
        }
    }
}