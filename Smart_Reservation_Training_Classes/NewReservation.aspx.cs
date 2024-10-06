using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;
using System.Collections;
using Smart_Reservation_Training_Classes.App_Code;

namespace Smart_Reservation_Training_Classes
{
    public partial class NewReservation : System.Web.UI.Page
    {
        CLS_Rooms cls_rooms = new CLS_Rooms();
        DataTable dtRoomsAvailable;
        public decimal Id;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserID"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }
            }
        }

        protected void BtnSaveNext2_Click(object sender, EventArgs e)
        {
            try
            {
                if (!string.IsNullOrWhiteSpace(txtSearchStartDate.Text) || !string.IsNullOrWhiteSpace(txtSearchEndDate.Text))
                {
                    foreach (GridViewRow row in gvRoomsAvailable.Rows)
                    {
                        RadioButton radiobutton = (RadioButton)row.FindControl("RadioButtonChooseRoom");
                        if (radiobutton.Checked)
                        {
                            txtRoomCode.Text = gvRoomsAvailable.Rows[row.RowIndex].Cells[1].Text;
                            txtStartDate.Text = txtSearchStartDate.Text;
                            txtEndDate.Text = txtSearchEndDate.Text;

                            lblWizardError.Visible = false;
                            lblWizardError.Text = string.Empty;
                            MultiViewCard.ActiveViewIndex = 1;
                        }
                        else
                        {
                            lblWizardError.Visible = true;
                            lblWizardError.Text = "يجب إختيار قاعة تدريبية من القاعات التدريبية المتاحة للإنتقال على بيانات الدورة";
                        }
                    }
                }
                else
                {
                    lblWizardError.Visible = true;
                    lblWizardError.Text = "يجب إدخال تاريخ البداية و تاريخ النهاية لعرض القاعات التدريبية المتاحة";
                }
            }
            catch (Exception excBtnSaveNext2)
            {
                lblWizardError.Visible = true;
                lblWizardError.Text = excBtnSaveNext2.Message.ToString();
            }
        }

        protected void BtnStepPrevious1_Click(object sender, EventArgs e)
        {
            try
            {
                lblWizardError.Visible = false;
                lblWizardError.Text = string.Empty;
                MultiViewCard.ActiveViewIndex = 0;
            }
            catch (Exception excBtnStepPrevious1)
            {
                lblWizardError.Visible = true;
                lblWizardError.Text = excBtnStepPrevious1.Message.ToString();
            }
        }

        protected void BtnSaveNext3_Click(object sender, EventArgs e)
        {
            try
            {
                lblWizardError.Visible = false;
                lblWizardError.Text = string.Empty;
                MultiViewCard.ActiveViewIndex = 2;
            }
            catch (Exception excBtnSaveNext3)
            {
                lblWizardError.Visible = true;
                lblWizardError.Text = excBtnSaveNext3.Message.ToString();
            }
        }

        protected void BtnStepPrevious2_Click(object sender, EventArgs e)
        {
            try
            {
                lblWizardError.Visible = false;
                lblWizardError.Text = string.Empty;
                MultiViewCard.ActiveViewIndex = 1;
            }
            catch (Exception excBtnStepPrevious2)
            {
                lblWizardError.Visible = true;
                lblWizardError.Text = excBtnStepPrevious2.Message.ToString();
            }
        }

        protected void BtnSend_Click(object sender, EventArgs e)
        {
            try
            {
                if (checkSureInfo.Checked == true)
                {
                    lblWizardError.Visible = false;
                    lblWizardError.Text = string.Empty;
                    //ApplicationSummary();
                }
                else
                {
                    lblWizardError.Visible = true;
                    lblWizardError.Text = "يجب النقر على الإقرار";
                }
            }
            catch (Exception excBtnSend)
            {
                lblWizardError.Visible = true;
                lblWizardError.Text = excBtnSend.Message.ToString();
            }
        }
        private void LoadRoomsAvailable()
        {
            try
            {
                if (!string.IsNullOrEmpty(txtSearchStartDate.Text) && !string.IsNullOrEmpty(txtSearchEndDate.Text))
                {
                    dtRoomsAvailable = cls_rooms.SearchRoomsAvailable(txtSearchStartDate.Text, txtSearchEndDate.Text);
                    if (dtRoomsAvailable.Rows.Count > 0)
                    {
                        gvRoomsAvailable.DataSource = dtRoomsAvailable;
                        gvRoomsAvailable.DataBind();
                    }
                    else
                    {
                        gvRoomsAvailable.DataSource = null;
                        gvRoomsAvailable.DataBind();
                    }
                    lblWizardError.Visible = false;
                    lblWizardError.Text = string.Empty;
                    txtSearchStartDate.Enabled = false;
                    txtSearchEndDate.Enabled = false;
                }
                else
                {
                    lblWizardError.Visible = true;
                    lblWizardError.Text = "يجب إدخال تاريخ البداية و تاريخ النهاية لعرض القاعات التدريبية المتاحة";
                }
            }
            catch (Exception excLoadRoomsAvailable)
            {
                lblWizardError.Visible = true;
                lblWizardError.Text = excLoadRoomsAvailable.Message.ToString();
            }
        }
        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            BtnResetSearch.Visible = true;
            LoadRoomsAvailable();
        }

        protected void BtnResetSearch_Click(object sender, EventArgs e)
        {
            BtnResetSearch.Visible = false;
            txtSearchStartDate.Text = "";
            txtSearchEndDate.Text = "";
            txtSearchStartDate.Enabled = true;
            txtSearchEndDate.Enabled = true;
            lblWizardError.Visible = false;
            lblWizardError.Text = string.Empty;
            //LoadRoomsAvailable();
        }
    }
}