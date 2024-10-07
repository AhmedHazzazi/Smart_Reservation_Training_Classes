using Smart_Reservation_Training_Classes.App_Code;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Smart_Reservation_Training_Classes
{
    public partial class Roles : System.Web.UI.Page
    {
        CLS_Users cls_Users = new CLS_Users();
        DataTable dtUsers, dtUserName, dtEmail;
        public decimal Id;
        //SRTC_DBDataContext ctxSRTC_DBD = new SRTC_DBDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }
            if (!IsPostBack)
            {
                BindDataUsers();
            }
            lblError.Visible = false;
            lblSuccess.Visible = false;
        }

        //Function To Fetch Users Data And Display It In GridView
        public void BindDataUsers()
        {
            try
            {
                dtUsers = cls_Users.BindAllUsers();
                if (dtUsers.Rows.Count > 0)
                {
                    gvUsers.DataSource = dtUsers;
                    gvUsers.DataBind();
                }
                else
                {
                    gvUsers.DataSource = null;
                    gvUsers.DataBind();
                }
            }
            catch (Exception excLoadDataUsers)
            {
                lblError.Visible = true;
                lblError.Text = excLoadDataUsers.Message.ToString();
            }
        }

        //Save Data To Database After Verification
        protected void BtnSave_Click(object sender, EventArgs e)
        {
            try
            {
                //Id = Convert.ToDecimal(cls_users.MaxIDUserID().Rows[0]["UserID"].ToString());
                if (!string.IsNullOrEmpty(txtName.Text) && !string.IsNullOrEmpty(txtUserName.Text) 
                    && !string.IsNullOrEmpty(txtPassword.Text) && !string.IsNullOrEmpty(txtConfirmPassword.Text)
                    && !string.IsNullOrEmpty(txtEmail.Text) && !string.IsNullOrEmpty(RblRole.SelectedValue))
                {
                    dtUserName = cls_Users.SearchAvailableUser(txtUserName.Text);
                    dtEmail = cls_Users.SearchAvailableEmail(txtEmail.Text);
                    if (dtUserName.Rows.Count > 0)
                    {
                        Id = Convert.ToDecimal(hfUserID.Value = dtUserName.Rows[0]["UserID"].ToString());
                        cls_Users.UpdateUser(Id, txtName.Text, txtUserName.Text, txtPassword.Text, txtEmail.Text, RblRole.SelectedValue.ToString());
                        lblSuccess.Visible = true;
                        lblSuccess.Text = "لقد تم تعديل بيانات المستخدم بنجاح";
                    }
                    else
                    {
                        if (dtUserName.Rows.Count > 0)
                        {
                            lblSuccess.Visible = false;
                            lblError.Visible = true;
                            lblError.Text = "اسم المستخدم غير متاح يرجى التحقق من إسم المستخدم";
                        }
                        else if (dtEmail.Rows.Count > 0)
                        {
                            lblSuccess.Visible = false;
                            lblError.Visible = true;
                            lblError.Text = "البريد الإلكتروني مستخدم من قبل يرجى التحقق من البريد الإلكتروني";
                        }
                        else
                        {
                            Id = Convert.ToDecimal(hfUserID.Value = cls_Users.MaxIDUserID().Rows[0]["UserID"].ToString());
                            cls_Users.InsertUser(Id, txtName.Text, txtUserName.Text, txtPassword.Text, txtEmail.Text, RblRole.SelectedValue.ToString());
                            dtUsers = cls_Users.SearchUser(Id.ToString());
                            lblError.Visible = false;
                            lblSuccess.Visible = true;
                            lblSuccess.Text = "تم التسجيل بنجاح" + "\r\n" + "رقم المستخدم هو : " + Id.ToString() + "\r\n" + "اسم المستخدم هو : " + dtUsers.Rows[0]["UserName"].ToString();
                            ClearData();
                        }
                    }
                }
                else
                {
                    lblSuccess.Visible = false;
                    lblError.Visible = true;
                    lblError.Text = "يرجى التأكد من جميع البيانات المطلوبة";
                }
                BindDataUsers();
            }
            catch (Exception excBtnSave)
            {
                lblError.Visible = true;
                lblError.Text = excBtnSave.Message.ToString();
            }
        }

        //User Search Event -- حدث البحث عن المستخدمين
        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                if (!string.IsNullOrEmpty(txtSearch.Text))
                {
                    dtUsers = cls_Users.SearchUser(txtSearch.Text);
                    if (dtUsers.Rows.Count > 0)
                    {
                        gvUsers.DataSource = dtUsers;
                        gvUsers.DataBind();
                        lblError.Visible = false;
                        lblError.Text = string.Empty;
                    }
                    else
                    {
                        gvUsers.DataSource = null;
                        gvUsers.DataBind();
                        lblError.Visible = true;
                        lblError.Text = "لم يتم العثور على بيانات تأكد من القيمة المدخلة الصحيحة";
                        lblSuccess.Visible = false;
                        lblSuccess.Text = string.Empty;
                    }
                }
                else
                {
                    lblError.Visible = true;
                    lblError.Text = "يجب إدخال قيمة في حقل البحث";
                    lblSuccess.Visible = false;
                    lblSuccess.Text = string.Empty;
                }
                BtnResetSearch.Visible = true;
            }
            catch (Exception excBtnSearch)
            {
                lblError.Visible = true;
                lblError.Text = excBtnSearch.Message.ToString();
            }
        }

        //Search Reset Event -- حدث إعادة تعيين البحث
        protected void BtnResetSearch_Click(object sender, EventArgs e)
        {
            try
            {
                txtSearch.Text = string.Empty;
                lblError.Visible = false;
                lblError.Text = string.Empty;
                lblSuccess.Visible = false;
                lblSuccess.Text = string.Empty;
                BindDataUsers();
            }
            catch (Exception excBtnResetSearch)
            {
                lblError.Visible = true;
                lblError.Text = excBtnResetSearch.Message.ToString();
            }
        }

        //Navigation To The Add User Form -- حدث الانتقال إلى نموذج إضافة مستخدم
        protected void BtnAddUser_Click(object sender, EventArgs e)
        {
            try
            {
                MultiView1.ActiveViewIndex = 1;
            }
            catch (Exception excBtnAddUser)
            {
                lblError.Visible = true;
                lblError.Text = excBtnAddUser.Message.ToString();
            }
        }

        //User Edit Form Navigation Event And User Delete Event -- حدث الإنتقال إلى نموذج تعديل المستخدم و حدث حذف المستخدم
        protected void gvUsers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Edited")
                {
                    string UserID = e.CommandArgument.ToString();
                    dtUsers = cls_Users.SearchUser(UserID);
                    if (dtUsers.Rows.Count > 0)
                    {
                        if (!string.IsNullOrEmpty(UserID))
                        {
                            foreach (DataRow dr in dtUsers.Rows)
                            {
                                //hfUserID.Value = dr["UserID"].ToString();
                                txtName.Text = dr["Name"].ToString();
                                txtUserName.Text = dr["UserName"].ToString();
                                txtPassword.Text = dr["Password"].ToString();
                                txtEmail.Text = dr["Email"].ToString();
                                RblRole.SelectedValue = dr["Role"].ToString();

                                txtUserName.Enabled = false;
                                txtEmail.Enabled = false;
                            }
                            lblError.Visible = false;
                        }
                        else
                        {
                            lblError.Visible = true;
                            lblError.Text = "لم يتم العثور على بيانات صلاحية المستخدم";
                        }
                    }
                    else
                    {
                        lblError.Visible = true;
                        lblError.Text = "لم يتم العثور على بيانات صلاحية المستخدم";
                    }
                    MultiView1.ActiveViewIndex = 1;
                }
                else if (e.CommandName == "Deleted")
                {
                    string UserID = e.CommandArgument.ToString();
                    dtUsers = cls_Users.SearchUser(UserID);
                    if (dtUsers.Rows.Count > 0)
                    {
                        if (!string.IsNullOrEmpty(UserID))
                        {
                            cls_Users.DeleteUser(Convert.ToDecimal(UserID));
                            DataRow dr = dtUsers.Rows[0];
                            dr.Delete();
                            lblError.Visible = false;
                            lblSuccess.Visible = true;
                            lblSuccess.Text = "لقد تم حذف صلاحية المستخدم بنجاح";
                        }
                        else
                        {
                            lblError.Visible = true;
                            lblError.Text = "لم يتم العثور على بيانات صلاحية المستخدم حتى يتم حذفه";
                        }
                    }
                    else
                    {
                        lblError.Visible = true;
                        lblError.Text = "لم يتم العثور على بيانات صلاحية المستخدم حتى يتم حذفه";
                    }
                    BindDataUsers();
                }
            }
            catch (Exception excgvUsers)
            {
                lblError.Visible = true;
                lblError.Text = excgvUsers.Message.ToString();
            }
        }

        //Check For Availability UserName Or Not Availability -- التحقق من توفر اسم المستخدم أو عدم توفره
        protected void txtUserName_TextChanged(object sender, EventArgs e)
        {
            try
            {
                dtUsers = cls_Users.SearchAvailableUser(txtUserName.Text);
                if (dtUsers.Rows.Count > 0)
                {
                    AvailabilityUserName.Visible = false;
                    NotAvailabilityUserName.Visible = true;
                    NotAvailabilityUserName.InnerText = "إسم المستخدم غير متاح";
                }
                else
                {
                    NotAvailabilityUserName.Visible = false;
                    AvailabilityUserName.Visible = true;
                    AvailabilityUserName.InnerText = "إسم المستخدم متاح";
                }
            }
            catch (Exception excAvailabilityUserName)
            {
                lblError.Visible = true;
                lblError.Text = excAvailabilityUserName.Message.ToString();
            }
        }

        //Check For Availability Email Or Not Availability -- التحقق من التوفر عن طريق البريد الإلكتروني أو عدم التوفر
        protected void txtEmail_TextChanged(object sender, EventArgs e)
        {
            try
            {
                dtUsers = cls_Users.SearchAvailableEmail(txtEmail.Text);
                if (dtUsers.Rows.Count > 0)
                {
                    AvailabilityEmail.Visible = false;
                    NotAvailabilityEmail.Visible = true;
                    NotAvailabilityEmail.InnerText = "البريد الإلكتروني غير متاح";
                }
                else
                {
                    NotAvailabilityEmail.Visible = false;
                    AvailabilityEmail.Visible = true;
                    AvailabilityEmail.InnerText = "البريد الإلكتروني متاح";
                }
            }
            catch (Exception excAvailabilityEmail)
            {
                lblError.Visible = true;
                lblError.Text = excAvailabilityEmail.Message.ToString();
            }
        }

        protected void gvUsers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvUsers.PageIndex = e.NewPageIndex;
            BindDataUsers();
        }

        //User Coloring Event System Administrator And User -- حدث تلوين المستخدمين مسؤول النظام ومستخدم 
        protected void gvUsers_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            for (int i = 0; i < gvUsers.Rows.Count; i++)
            {
                for (int j = 0; j < gvUsers.Rows[i].Cells.Count; j++)
                {
                    if (gvUsers.Rows[i].Cells[j].Text.ToString().Equals("Admin"))
                    {
                        gvUsers.Rows[i].Cells[j].CssClass = "bg-success";
                    }
                    else if (gvUsers.Rows[i].Cells[j].Text.ToString().Equals("User"))
                    {
                        gvUsers.Rows[i].Cells[j].CssClass = "bg-warning";
                    }
                }
            }
        }

        //protected void BtnClose_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        MultiView1.ActiveViewIndex = 0;
        //    }
        //    catch (Exception excBtnClose)
        //    {
        //        //throw excBtnClose;
        //        lblError.Visible = true;
        //        lblError.Text = excBtnClose.Message.ToString();
        //    }
        //}

        //Function To Clear Data From The Form After Saving -- Used In The Save Event
        public void ClearData()
        {
            //hfUserID.Value = string.Empty;
            txtName.Text = string.Empty;
            txtUserName.Text = string.Empty;
            txtPassword.Text = string.Empty;
            txtEmail.Text = string.Empty;
            RblRole.SelectedValue = string.Empty;
            txtName.Focus();

            //RFVtxtName.ErrorMessage = string.Empty;
            //RFVtxtUserName.ErrorMessage = string.Empty;
            //RFVtxtPassword.ErrorMessage = string.Empty;
            //RFVtxtEmail.ErrorMessage = string.Empty;
            //REVtxtEmail.ErrorMessage = string.Empty;
        }
    }
}