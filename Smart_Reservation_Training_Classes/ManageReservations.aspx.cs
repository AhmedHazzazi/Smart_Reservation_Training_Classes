﻿using Smart_Reservation_Training_Classes.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Smart_Reservation_Training_Classes
{
    public partial class ManageReservations : System.Web.UI.Page
    {
        CLS_Users cls_Users = new CLS_Users();
        CLS_Reservations cls_Reservations = new CLS_Reservations();
        DataTable dtUsers, dtReservations;
        SRTC_DBDataContext ctxSRTC_DB;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }
            if (!IsPostBack)
            {
                RoleAccess();
                BindDataReservations();
            }
        }

        //Function Allow Access To Manage Roles For Admin And Not Allow For User
        public void RoleAccess()
        {
            try
            {
                dtUsers = cls_Users.SearchUser((string)Session["UserID"]);
                if (dtUsers.Rows.Count > 0)
                {
                    foreach (DataRow row in dtUsers.Rows)
                    {
                        if (row["Role"].ToString() == "Admin")
                        { }
                        else if (row["Role"].ToString() == "User")
                        {
                            lblError.Visible = true;
                            lblError.Text = "عفواً ... ليس لديك صلاحية على هذه الصفحة !!!";
                        }
                        break;
                    }
                }
                else
                {
                    lblError.Visible = true;
                    lblError.Text = "حدث خطأ في إسترجاع البيانات أو لا يوجد لديك صلاحية الوصول إلى هذه الصفحة";
                }
            }
            catch (Exception excRoleAccess)
            {
                lblError.Visible = true;
                lblError.Text = excRoleAccess.Message.ToString();
            }
        }
        //Function To Fetch Reservations Data And Display It In GridView
        public void BindDataReservations()
        {
            try
            {
                dtReservations = cls_Reservations.BindAllReservations();
                if (dtReservations.Rows.Count > 0)
                {
                    gvReservations.DataSource = dtReservations;
                    gvReservations.DataBind();
                }
                else
                {
                    gvReservations.DataSource = null;
                    gvReservations.DataBind();
                }
            }
            catch (Exception excBindDataUsers)
            {
                lblError.Visible = true;
                lblError.Text = excBindDataUsers.Message.ToString();
            }
        }

        protected void gvReservations_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvReservations.PageIndex = e.NewPageIndex;
            BindDataReservations();
        }

        //User Coloring Event System Administrator And User -- حدث تلوين المستخدمين مسؤول النظام ومستخدم 
        protected void gvReservations_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //for (int i = 0; i < gvReservations.Rows.Count; i++)
            //{
            //    for (int j = 0; j < gvReservations.Rows[i].Cells.Count; j++)
            //    {
            //        if (gvReservations.Rows[i].Cells[j].Text.ToString().Equals("قيد المراجعة"))
            //        {
            //            gvReservations.Rows[i].Cells[j].CssClass = "bg-success";
            //        }
            //        else if (gvReservations.Rows[i].Cells[j].Text.ToString().Equals("تم المراجعة"))
            //        {
            //            gvReservations.Rows[i].Cells[j].CssClass = "bg-warning";
            //        }
            //    }
            //}
        }

        //User Search Event -- حدث البحث عن المستخدمين
        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                if (!string.IsNullOrEmpty(txtSearch.Text))
                {
                    dtReservations = cls_Reservations.SearchReservation(txtSearch.Text);
                    if (dtReservations.Rows.Count > 0)
                    {
                        gvReservations.DataSource = dtReservations;
                        gvReservations.DataBind();
                        lblError.Visible = false;
                        lblError.Text = string.Empty;
                    }
                    else
                    {
                        gvReservations.DataSource = null;
                        gvReservations.DataBind();
                        lblError.Visible = true;
                        lblError.Text = "لم يتم العثور على بيانات تأكد من القيمة المدخلة الصحيحة";
                    }
                }
                else
                {
                    lblError.Visible = true;
                    lblError.Text = "يجب إدخال قيمة في حقل البحث";
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
                BtnResetSearch.Visible = false;
                txtSearch.Text = string.Empty;
                lblError.Visible = false;
                lblError.Text = string.Empty;
                BindDataReservations();
            }
            catch (Exception excBtnResetSearch)
            {
                lblError.Visible = true;
                lblError.Text = excBtnResetSearch.Message.ToString();
            }
        }
    }
}