﻿using Smart_Reservation_Training_Classes.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Smart_Reservation_Training_Classes
{
    public partial class Registraion : System.Web.UI.Page
    {
        CLS_Users cls_users = new CLS_Users();
        DataTable dtUsers, dtUserName, dtEmail;
        public decimal Id;
        protected void Page_Load(object sender, EventArgs e)
        {
            HtmlGenericControl Logout = (HtmlGenericControl)Master.FindControl("Logout");
            Logout.Visible = false;
            lblError.Visible = false;
            lblSuccess.Visible = false;
        }

        [WebMethod]
        public static bool IsUserAvailable(string UserName)
        {
            bool result = false;
            CLS_Users cls_users = new CLS_Users();
            DataTable dtUsers =new DataTable();
            dtUsers = cls_users.SearchAvailableUser(UserName);
            if (dtUsers.Rows.Count == 0)
                result = true;
            else result = false;
            return result;
        }
        public static bool IsEmailAvailable(string Email)
        {
            bool resultEmail = false;
            CLS_Users cls_users = new CLS_Users();
            DataTable dtEmail = new DataTable();
            dtEmail = cls_users.SearchAvailableEmail(Email);
            if (dtEmail.Rows.Count == 0)
                resultEmail = true;
            else resultEmail = false;
            return resultEmail;
        }

        protected void txtUserName_TextChanged(object sender, EventArgs e)
        {
            try
            {
                dtUsers = cls_users.SearchAvailableUser(txtUserName.Text);
                if (dtUsers.Rows.Count > 0)
                {
                    spanAvailability.Visible = false;
                    spanNotAvailability.Visible = true;
                    spanNotAvailability.InnerText = "غير متاح";
                }
                else
                {
                    spanNotAvailability.Visible = false;
                    spanAvailability.Visible = true;
                    spanAvailability.InnerText = "متاح";
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            try
            {
                string title, body;
                //Id = Convert.ToDecimal(cls_users.MaxIDUserID().Rows[0]["UserID"].ToString());
                if (!string.IsNullOrEmpty(txtName.Text) && !string.IsNullOrEmpty(txtUserName.Text) 
                    && !string.IsNullOrEmpty(txtPassword.Text) && !string.IsNullOrEmpty(txtConfirmPassword.Text) 
                    && !string.IsNullOrEmpty(txtEmail.Text))
                {
                    dtUserName = cls_users.SearchAvailableUser(txtUserName.Text);
                    dtEmail = cls_users.SearchAvailableUser(txtEmail.Text);
                    if (dtUserName.Rows.Count > 0 || dtEmail.Rows.Count > 0)
                    {
                        lblSuccess.Visible = false;
                        lblError.Visible = true;
                        title = "حدث خطأ";
                        body = lblError.Text = "المستخدم تم إضافة بياناته سابقا يرجى التحقق من إسم المستخدم و البريد الإلكتروني";
                        //ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "ShowPopup('" + title + "', '" + body + "');", true);
                    }
                    else
                    {
                        lblError.Visible = false;
                        Id = Convert.ToDecimal(hfUserID.Value = cls_users.MaxIDUserID().Rows[0]["UserID"].ToString());
                        cls_users.InsertUser(Id, txtName.Text, txtUserName.Text, txtPassword.Text, txtEmail.Text, "User");
                        dtUsers = cls_users.SearchUser(Id.ToString());
                        lblSuccess.Visible = true;
                        title = "تسجيل جديد";
                        body = lblSuccess.Text = "تم التسجيل بنجاح" + "\r\n" + "رقم المستخدم هو : " + Id.ToString() + "\r\n" + "اسم المستخدم هو : " + dtUsers.Rows[2]["UserName"].ToString();
                        //ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "ShowPopup('" + title + "', '" + body + "');", true);
                        //ClearData();
                    }
                }
                else
                {
                    lblSuccess.Visible = false;
                    lblError.Visible = true;
                    title = "حدث خطأ";
                    body = lblError.Text = "يرجى التأكد من إدخال جميع البيانات المطلوبة";
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "ShowPopup('" + title + "', '" + body + "');", true);
                }
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + title + "', '" + body + "');", true);
            }
            catch (Exception excBtnSave)
            {
                //throw excBtnSave;
                lblError.Visible = true;
                lblError.Text = excBtnSave.Message.ToString();
            }
        }

        public void ClearData()
        {
            //hfUserID.Value = string.Empty;
            txtName.Text = string.Empty;
            txtUserName.Text = string.Empty;
            txtPassword.Text = string.Empty;
            txtConfirmPassword.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtName.Focus();

            //RFVtxtName.ErrorMessage = string.Empty;
            //RFVtxtUserName.ErrorMessage = string.Empty;
            //RFVtxtPassword.ErrorMessage = string.Empty;
            //RFVtxtEmail.ErrorMessage = string.Empty;
            //REVtxtEmail.ErrorMessage = string.Empty;
        }
    }
}