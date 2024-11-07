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
    public partial class ManageMyReservations : System.Web.UI.Page
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
                BindDataMyReservations();
            }
        }
        //Function To Fetch Reservations Data And Display It In GridView
        public void BindDataMyReservations()
        {
            try
            {
                dtReservations = cls_Reservations.GetMyReservation(Session["UserID"].ToString());
                if (dtReservations.Rows.Count > 0)
                {
                    gvMyReservations.DataSource = dtReservations;
                    gvMyReservations.DataBind();
                }
                else
                {
                    gvMyReservations.DataSource = null;
                    gvMyReservations.DataBind();
                }
            }
            catch (Exception excBindDataUsers)
            {
                lblError.Visible = true;
                lblError.Text = excBindDataUsers.Message.ToString();
            }
        }

        protected void gvMyReservations_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvMyReservations.PageIndex = e.NewPageIndex;
            BindDataMyReservations();
        }

        //User Coloring Event System Administrator And User -- حدث تلوين المستخدمين مسؤول النظام ومستخدم 
        protected void gvMyReservations_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //for (int i = 0; i < gvMyReservations.Rows.Count; i++)
            //{
            //    for (int j = 0; j < gvMyReservations.Rows[i].Cells.Count; j++)
            //    {
            //        if (gvMyReservations.Rows[i].Cells[j].Text.ToString().Equals("قيد المراجعة"))
            //        {
            //            gvMyReservations.Rows[i].Cells[j].CssClass = "bg-success";
            //        }
            //        else if (gvMyReservations.Rows[i].Cells[j].Text.ToString().Equals("تم المراجعة"))
            //        {
            //            gvMyReservations.Rows[i].Cells[j].CssClass = "bg-warning";
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
                        gvMyReservations.DataSource = dtReservations;
                        gvMyReservations.DataBind();
                        lblError.Visible = false;
                        lblError.Text = string.Empty;
                    }
                    else
                    {
                        gvMyReservations.DataSource = null;
                        gvMyReservations.DataBind();
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
                BindDataMyReservations();
            }
            catch (Exception excBtnResetSearch)
            {
                lblError.Visible = true;
                lblError.Text = excBtnResetSearch.Message.ToString();
            }
        }
    }
}