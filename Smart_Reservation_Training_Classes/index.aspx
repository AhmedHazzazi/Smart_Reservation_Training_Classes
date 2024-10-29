<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Smart_Reservation_Training_Classes.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <asp:Panel ID="Error_Panel" runat="server" Visible="false" CssClass="alert alert-danger" role="alert">
            <asp:Label ID="lblErrorMsg" runat="server"></asp:Label>
        </asp:Panel>
    </div>
    <div id="Admin" runat="server" visible="false" class="row row-cols-1">
        <div class="col-2 text-center">
            <div class="item-image">
                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-person-fill-lock" viewBox="0 0 16 16">
                    <path d="M11 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0m-9 8c0 1 1 1 1 1h5v-1a2 2 0 0 1 .01-.2 4.49 4.49 0 0 1 1.534-3.693Q8.844 9.002 8 9c-5 0-6 3-6 4m7 0a1 1 0 0 1 1-1v-1a2 2 0 1 1 4 0v1a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-4a1 1 0 0 1-1-1zm3-3a1 1 0 0 0-1 1v1h2v-1a1 1 0 0 0-1-1" />
                </svg>
                <div class="card-body">
                    <h5 class="card-title">الصلاحيات</h5>
                    <a id="linkRoles" runat="server" href="Roles.aspx" class="btn btn-group-lg btn-primary" onclick="return Loader();">عرض</a>
                </div>
            </div>
        </div>
        <div class="col-2 text-center">
            <div class="item-image">
                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-calendar-check" viewBox="0 0 16 16">
                    <path d="M10.854 7.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708 0" />
                    <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5M1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4z" />
                </svg>
                <div class="card-body">
                    <h5 class="card-title">الحجوزات</h5>
                    <a id="linkManageReservations" runat="server" href="ManageReservations.aspx" class="btn btn-group-lg btn-primary" onclick="return Loader();">عرض</a>
                </div>
            </div>
        </div>
        <div class="col-2 text-center">
            <div class="item-image">
                <img src="content/img/Rooms.png" class="item-image" alt="...">
                <div class="card-body">
                    <h5 class="card-title">القاعات التدريبية</h5>
                    <a id="linkRooms" runat="server" href="Rooms.aspx" class="btn btn-group-lg btn-primary" onclick="return Loader();">عرض</a>
                </div>
            </div>
        </div>
        <div class="col-2 text-center">
            <div class="item-image">
                <img src="content/img/Courses.png" class="item-image" alt="...">
                <div class="card-body">
                    <h5 class="card-title">الدورات التدريبية</h5>
                    <a id="linkCourses" runat="server" href="Courses.aspx" class="btn btn-group-lg btn-primary" onclick="return Loader();">عرض</a>
                </div>
            </div>
        </div>
    </div>
    <div id="Users" runat="server" visible="false" class="row row-cols-1">
        <div class="col-2 text-center">
            <div class="item-image">
                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-person-plus-fill" viewBox="0 0 16 16">
                    <path d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6" />
                    <path fill-rule="evenodd" d="M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5" />
                </svg>
                <div class="card-body">
                    <h5 class="card-title">تسجيل حجز جديد</h5>
                    <a id="linkNewReservationUser" runat="server" href="NewReservation.aspx" class="btn btn-group-lg btn-primary" onclick="return Loader()">حجز جديد</a>
                </div>
            </div>
        </div>
        <div class="col-2 text-center">
            <div class="item-image">
                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-calendar-check" viewBox="0 0 16 16">
                    <path d="M10.854 7.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708 0" />
                    <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5M1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4z" />
                </svg>
                <div class="card-body">
                    <h5 class="card-title">الحجوزات</h5>
                    <a id="linkUserReservations" runat="server" href="UserReservations.aspx" class="btn btn-group-lg btn-primary" onclick="return Loader()">عرض</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>