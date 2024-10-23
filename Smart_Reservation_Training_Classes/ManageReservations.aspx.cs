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
    public partial class ManageReservations : System.Web.UI.Page
    {
        CLS_Rooms cls_Rooms = new CLS_Rooms();
        CLS_Reservations cls_Reservations = new CLS_Reservations();
        DataTable dtRoomsAvailable, dtReservations;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserID"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }
                hfUserID.Value = (string)Session["UserID"];
            }
        }

        protected void BtnApproval_Click(object sender, EventArgs e)
        {

        }

        protected void BtnReject_Click(object sender, EventArgs e)
        {

        }
    }
}