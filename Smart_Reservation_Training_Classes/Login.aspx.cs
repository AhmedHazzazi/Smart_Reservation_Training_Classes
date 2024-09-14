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
    public partial class Login : System.Web.UI.Page
    {
        CLS_LoginUsers cls_LoginUsers = new CLS_LoginUsers();
        DataTable dtAdmin = new DataTable();
        DataTable dtUsers = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                if (!string.IsNullOrEmpty(txtUserName.Text) && !string.IsNullOrEmpty(txtPassword.Text))
                {
                    //SearchResultCollection result = LoginActiveDirectory.getUserInfoLdap(LoginActiveDirectory.LDAP_SERVER, LoginActiveDirectory.USER_DOMAIN, txtun.Text, txtun.Text, txtpwd.Text);
                    //if (result.Count > 0 && result != null)
                    //{
                    //    Session["userOnLive"] = LoginActiveDirectory.GetProperty(result[0], "extensionattribute1").ToString();
                    //    Session["ArabicName"] = LoginActiveDirectory.GetProperty(result[0], "extensionattribute3").ToString();
                    //    dtLogin = log.LOGIN(Session["userOnLive"].ToString());
                    //    if (dtLogin.Rows.Count > 0)
                    //    {
                    //        foreach (DataRow row in dtLogin.Rows)
                    //        {
                    //            if (row["IsAdmin"].ToString() == "0")
                    //            {
                    //                dtEvaluation = log.GetEval(Session["userOnLive"].ToString());
                    //                if (dtEvaluation.Rows.Count > 0)
                    //                {
                    //                    Login_Successful();
                    //                    Response.Redirect("index.aspx");
                    //                }
                    //                else
                    //                {
                    //                    Login_NotEvaluation();
                    //                    Response.Redirect("Oops.aspx");
                    //                }
                    //            }
                    //            else if (row["IsAdmin"].ToString() == "1")
                    //            {
                    //                Login_Successful();
                    //                Response.Redirect("SortRequests.aspx");
                    //            }
                    //            else if (row["IsAdmin"].ToString() == "2")
                    //            {
                    //                Login_Successful();
                    //                Response.Redirect("SortRequests.aspx");
                    //            }
                    //        }
                    //    }
                    //    else
                    //    {
                    //        Login_NotPermission();
                    //        liMsg.Visible = true;
                    //        liMsg.Text = "لا يوجد لديك صلاحية بالدخول !";
                    //    }
                    //}

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