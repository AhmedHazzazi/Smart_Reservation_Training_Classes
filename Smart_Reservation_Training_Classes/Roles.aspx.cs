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
        DataTable dtUsers;
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
        private void BindDataUsers()
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
                //Id = Convert.ToDecimal(hfUserID.Value = cls_users.MaxIDUserID().Rows[0]["UserID"].ToString());
                dtUsers = cls_users.SearchUser(hfUserID.Value);
                if (dtUsers.Rows.Count > 0 || hfUserID.Value!=null)
                {
                    if (!string.IsNullOrEmpty(txtName.Text) && !string.IsNullOrEmpty(txtUserName.Text)
                        && !string.IsNullOrEmpty(txtPassword.Text) && !string.IsNullOrEmpty(txtEmail.Text))
                    {
                        Id = Convert.ToDecimal(hfUserID.Value = dtUsers.Rows[0]["UserID"].ToString());
                        cls_users.UpdateUser(Id, txtName.Text, txtUserName.Text, txtPassword.Text, txtEmail.Text, RblRole.SelectedValue.ToString());
                        lblError.Visible = false;
                        lblSuccess.Visible = true;
                        lblSuccess.Text = "لقد تم التعديل بنجاح";
                    }
                    else
                    {
                        lblSuccess.Visible = false;
                        lblError.Visible = true;
                        lblError.Text = "تأكد من إدخال جميع البيانات المطلوبة";
                    }
                }
                else
                {
                    if (!string.IsNullOrEmpty(txtName.Text) && !string.IsNullOrEmpty(txtUserName.Text)
                            && !string.IsNullOrEmpty(txtPassword.Text) && !string.IsNullOrEmpty(txtEmail.Text))
                    {
                        Id = Convert.ToDecimal(hfUserID.Value = cls_users.MaxIDUserID().Rows[0]["UserID"].ToString());
                        cls_users.InsertUser(Id, txtName.Text, txtUserName.Text, txtPassword.Text, txtEmail.Text, RblRole.SelectedValue.ToString());
                        lblError.Visible = false;
                        lblSuccess.Visible = true;
                        lblSuccess.Text = "لقد تمت الإضافة بنجاح";
                    }
                    else
                    {
                        lblSuccess.Visible = false;
                        lblError.Visible = true;
                        lblError.Text = "تأكد من إدخال جميع البيانات المطلوبة";
                    }
                }
                BindDataUsers();
            }
            catch (Exception excBtnSave)
            {
                throw excBtnSave;
            }
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                if (!string.IsNullOrEmpty(txtSearch.Text))
                {
                    dtUsers=cls_users.SearchUser(txtSearch.Text);
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
                throw excBtnSearch;
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
            }
            catch (Exception excBtnResetSearch)
            {
                throw excBtnResetSearch;
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
                throw excBtnAddUser;
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
                throw excgvUsers;
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
                throw excBtnClose;
            }
        }
    }
}