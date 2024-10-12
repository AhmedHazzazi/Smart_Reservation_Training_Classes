﻿using Smart_Reservation_Training_Classes.App_Code;
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
    public partial class RecoverUserName : System.Web.UI.Page
    {
        CLS_Users cls_users = new CLS_Users();
        DataTable dtUsers;
        protected void Page_Load(object sender, EventArgs e)
        {
            HtmlGenericControl Logout = (HtmlGenericControl)Master.FindControl("Logout");
            Logout.Visible = false;
            HtmlGenericControl Login = (HtmlGenericControl)Master.FindControl("Login");
            Login.Visible = true;
            lblError.Visible = false;
            lblSuccess.Visible = false;
        }

        protected void BtnRecoverUserName_Click(object sender, EventArgs e)
        {
            try
            {
                if (!string.IsNullOrEmpty(txtEmail.Text))
                {
                    dtUsers = cls_users.RecoverUername(txtEmail.Text);
                    if (dtUsers.Rows.Count > 0)
                    {
                        //txtUserName.Text = dtUsers.Rows[0]["UserName"].ToString();
                        lblError.Visible = false;
                        lblSuccess.Visible = true;
                        lblSuccess.Text = "اسم المستخدم الخاص بك هو : " + dtUsers.Rows[0]["UserName"].ToString();
                    }
                    else
                    {
                        lblSuccess.Visible = false;
                        lblError.Visible = true;
                        lblError.Text = "معلومات البريد الإلكتروني التي أدخلتها خاطئة. يرجى التحقق مرة أخرى";
                        //lblError.Text = "المعلومات التي أدخلتها خاطئة. يرجى التحقق مرة أخرى";
                        //lblError.Text = "لم يتم العثور على بيانات مرتبطة بالبريد الإلكتروني المدخل في خانة البريد الإلكتروني !!!";
                    }
                }
                else
                {
                    lblSuccess.Visible = false;
                    lblError.Visible = true;
                    lblError.Text = "يرجى التأكد من إدخال جميع البيانات المطلوبة";
                }
            }
            catch (Exception excRecoverUserName)
            {
                lblError.Visible = false;
                lblError.Text = excRecoverUserName.Message.ToString();
            }
        }
    }
}