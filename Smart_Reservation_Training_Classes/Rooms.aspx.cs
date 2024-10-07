using Smart_Reservation_Training_Classes.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Smart_Reservation_Training_Classes
{
    public partial class Rooms : System.Web.UI.Page
    {
        CLS_Rooms cls_Rooms = new CLS_Rooms();
        DataTable dtRoom;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }
            if (!IsPostBack)
            {
                BindDataRooms();
            }
            lblError.Visible = false;
            lblSuccess.Visible = false;
        }

        //Function To Fetch Rooms Data And Display It In GridView
        public void BindDataRooms()
        {
            try
            {
                dtRoom = cls_Rooms.BindAllRooms();
                if (dtRoom.Rows.Count > 0)
                {
                    gvRooms.DataSource = dtRoom;
                    gvRooms.DataBind();
                }
                else
                {
                    gvRooms.DataSource = null;
                    gvRooms.DataBind();
                }
            }
            catch (Exception excLoadDataUsers)
            {
                lblError.Visible = true;
                lblError.Text = excLoadDataUsers.Message.ToString();
            }
        }

        //Save Data To Database
        protected void BtnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (!string.IsNullOrEmpty(txtRoomCode.Text) && !string.IsNullOrEmpty(txtRoomName.Text)
                    && !string.IsNullOrEmpty(DDLRoomType.SelectedValue) && !string.IsNullOrEmpty(txtRoomLocation.Text)
                    && !string.IsNullOrEmpty(txtRoomCapacity.Text))
                {
                    dtRoom = cls_Rooms.SearchRoom(txtRoomCode.Text);
                    if (dtRoom.Rows.Count > 0)
                    {
                        cls_Rooms.UpdateRoom(txtRoomCode.Text, txtRoomName.Text, DDLRoomType.SelectedValue.ToString(), txtRoomLocation.Text, txtRoomCapacity.Text);
                        lblSuccess.Visible = true;
                        lblSuccess.Text = "لقد تم تعديل بيانات القاعة التدريبية بنجاح";
                    }
                    else
                    {
                        cls_Rooms.InsertRoom(txtRoomCode.Text, txtRoomName.Text, DDLRoomType.SelectedValue.ToString(), txtRoomLocation.Text, txtRoomCapacity.Text);
                        lblSuccess.Visible = true;
                        lblSuccess.Text = "لقد تم إضافة بيانات القاعة التدريبية الجديدة بنجاح";
                    }
                }
                else
                {
                    lblSuccess.Visible = false;
                    lblError.Visible = true;
                    lblError.Text = "يرجى التأكد من جميع البيانات المطلوبة";
                }
                BindDataRooms();
            }
            catch (Exception excBtnSave)
            {
                lblError.Visible = true;
                lblError.Text = excBtnSave.Message.ToString();
            }
        }

        //Navigation To The Add Room Form -- حدث الانتقال إلى نموذج إضافة قاعة
        protected void BtnAddRoom_Click(object sender, EventArgs e)
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

        //User Search Event -- حدث البحث عن القاعات
        protected void BtnSearch_Click(object sender, EventArgs e)
        {

        }

        //Search Reset Event -- حدث إعادة تعيين البحث
        protected void BtnResetSearch_Click(object sender, EventArgs e)
        {

        }

        protected void gvRoomsAvailable_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                //if (e.CommandName == "Edited")
                //{
                //    string UserID = e.CommandArgument.ToString();
                //    dtUsers = cls_users.SearchUser(UserID);
                //    if (dtUsers.Rows.Count > 0)
                //    {
                //        if (!string.IsNullOrEmpty(UserID))
                //        {
                //            foreach (DataRow dr in dtUsers.Rows)
                //            {
                //                //hfUserID.Value = dr["UserID"].ToString();
                //                txtName.Text = dr["Name"].ToString();
                //                txtUserName.Text = dr["UserName"].ToString();
                //                txtPassword.Text = dr["Password"].ToString();
                //                txtEmail.Text = dr["Email"].ToString();
                //                RblRole.SelectedValue = dr["Role"].ToString();

                //                txtUserName.Enabled = false;
                //                txtEmail.Enabled = false;
                //            }
                //            lblError.Visible = false;
                //        }
                //        else
                //        {
                //            lblError.Visible = true;
                //            lblError.Text = "لم يتم العثور على بيانات صلاحية المستخدم";
                //        }
                //    }
                //    else
                //    {
                //        lblError.Visible = true;
                //        lblError.Text = "لم يتم العثور على بيانات صلاحية المستخدم";
                //    }
                //    MultiView1.ActiveViewIndex = 1;
                //}
                //else if (e.CommandName == "Deleted")
                //{
                //    string UserID = e.CommandArgument.ToString();
                //    dtUsers = cls_users.SearchUser(UserID);
                //    if (dtUsers.Rows.Count > 0)
                //    {
                //        if (!string.IsNullOrEmpty(UserID))
                //        {
                //            cls_users.DeleteUser(Convert.ToDecimal(UserID));
                //            DataRow dr = dtUsers.Rows[0];
                //            dr.Delete();
                //            lblError.Visible = false;
                //            lblSuccess.Visible = true;
                //            lblSuccess.Text = "لقد تم حذف صلاحية المستخدم بنجاح";
                //        }
                //        else
                //        {
                //            lblError.Visible = true;
                //            lblError.Text = "لم يتم العثور على بيانات صلاحية المستخدم حتى يتم حذفه";
                //        }
                //    }
                //    else
                //    {
                //        lblError.Visible = true;
                //        lblError.Text = "لم يتم العثور على بيانات صلاحية المستخدم حتى يتم حذفه";
                //    }
                //    BindDataUsers();
                //}
            }
            catch (Exception excgvUsers)
            {
                lblError.Visible = true;
                lblError.Text = excgvUsers.Message.ToString();
            }
        }
    }
}