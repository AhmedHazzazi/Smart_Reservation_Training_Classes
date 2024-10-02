using Smart_Reservation_Training_Classes.App_Code;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Smart_Reservation_Training_Classes
{
    public partial class Roles : System.Web.UI.Page
    {
        CLS_Users cls_users = new CLS_Users();
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
        public void BindDataUsers()
        {
            try
            {
                dtUsers = cls_users.BindAllUsers();
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
                throw excLoadDataUsers;
            }
        }
        protected void BtnSave_Click(object sender, EventArgs e)
        {
            try
            {
                //Id = Convert.ToDecimal(cls_users.MaxIDUserID().Rows[0]["UserID"].ToString());
                if (!string.IsNullOrEmpty(txtName.Text) && !string.IsNullOrEmpty(txtUserName.Text) 
                    && !string.IsNullOrEmpty(txtPassword.Text) && !string.IsNullOrEmpty(txtConfirmPassword.Text)
                    && !string.IsNullOrEmpty(txtEmail.Text) && !string.IsNullOrEmpty(RblRole.SelectedValue))
                {
                    dtUserName = cls_users.SearchAvailableUser(txtUserName.Text);
                    dtEmail = cls_users.SearchAvailableUser(txtEmail.Text);
                    if (dtUserName.Rows.Count > 0 || dtEmail.Rows.Count > 0)
                    {
                        Id = Convert.ToDecimal(hfUserID.Value = dtUserName.Rows[0]["UserID"].ToString());
                        cls_users.UpdateUser(Id, txtName.Text, txtUserName.Text, txtPassword.Text, txtEmail.Text, RblRole.SelectedValue.ToString());
                        lblSuccess.Visible = true;
                        lblSuccess.Text = "لقد تم تعديل بيانات المستخدم بنجاح";
                        //lblError.Visible = false;
                        //lblError.Text = "المستخدم تم إضافة بياناته سابقا يرجى التحقق من إسم المتخدم و البريد الإلكتروني";
                    }
                    else
                    {
                        Id = Convert.ToDecimal(hfUserID.Value = cls_users.MaxIDUserID().Rows[0]["UserID"].ToString());
                        cls_users.InsertUser(Id, txtName.Text, txtUserName.Text, txtPassword.Text, txtEmail.Text, RblRole.SelectedValue.ToString());
                        lblError.Visible = false;
                        lblSuccess.Visible = true;
                        lblSuccess.Text = "لقد تم إضافة المستخدم بنجاح";
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
                //throw excBtnSave;
                lblError.Visible = true;
                lblError.Text = excBtnSave.Message.ToString();
            }
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                if (!string.IsNullOrEmpty(txtSearch.Text))
                {
                    dtUsers = cls_users.SearchUser(txtSearch.Text);
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
                //throw excBtnSearch;
                lblError.Visible = true;
                lblError.Text = excBtnSearch.Message.ToString();
            }
        }

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
                //throw excBtnResetSearch;
                lblError.Visible = true;
                lblError.Text = excBtnResetSearch.Message.ToString();
            }
        }

        protected void BtnAddUser_Click(object sender, EventArgs e)
        {
            try
            {
                MultiView1.ActiveViewIndex = 1;
            }
            catch (Exception excBtnAddUser)
            {
                //throw excBtnAddUser;
                lblError.Visible = true;
                lblError.Text = excBtnAddUser.Message.ToString();
            }
        }
        protected void gvUsers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Edited")
                {
                    string UserID = e.CommandArgument.ToString();
                    dtUsers = cls_users.SearchUser(UserID);
                    if (dtUsers.Rows.Count > 0)
                    {
                        if (!string.IsNullOrEmpty(UserID))
                        {
                            foreach (DataRow dr in dtUsers.Rows)
                            {
                                hfUserID.Value = dr["UserID"].ToString();
                                txtName.Text = dr["Name"].ToString();
                                txtUserName.Text = dr["UserName"].ToString();
                                txtPassword.Text = dr["Password"].ToString();
                                txtEmail.Text = dr["Email"].ToString();
                                RblRole.SelectedValue = dr["Role"].ToString();

                                txtUserName.Enabled = false;
                            }
                            lblError.Visible = false;
                            lblError.Text = string.Empty;
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
                    dtUsers = cls_users.SearchUser(UserID);
                    if (dtUsers.Rows.Count > 0)
                    {
                        if (!string.IsNullOrEmpty(UserID))
                        {
                            cls_users.DeleteUser(Convert.ToDecimal(UserID));
                            DataRow dr = dtUsers.Rows[0];
                            dr.Delete();
                            lblError.Visible = false;
                            lblError.Text = string.Empty;
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
                //throw excgvUsers;
                lblError.Visible = true;
                lblError.Text = excgvUsers.Message.ToString();
            }
        }

        protected void gvUsers_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            dtUsers = cls_users.BindAllUsers();
            if (dtUsers.Rows.Count > 0)
            {
                foreach (DataRow row in dtUsers.Rows)
                {
                    if (row["Role"].ToString() == "Admin")
                    {
                        e.Row.Cells[0].CssClass = "successbkg";
                    }
                    else if (row["Role"].ToString() == "User")
                    {
                        e.Row.Cells[0].CssClass = "rejectedbkg";
                    }
                }
            }
        }

        protected void BtnClose_Click(object sender, EventArgs e)
        {
            try
            {
                MultiView1.ActiveViewIndex = 0;
            }
            catch (Exception excBtnClose)
            {
                //throw excBtnClose;
                lblError.Visible = true;
                lblError.Text = excBtnClose.Message.ToString();
            }
        }

        public void ClearData()
        {
            hfUserID.Value = string.Empty;
            txtName.Text = string.Empty;
            txtUserName.Text = string.Empty;
            txtPassword.Text = string.Empty;
            txtEmail.Text = string.Empty;
        }
    }
}