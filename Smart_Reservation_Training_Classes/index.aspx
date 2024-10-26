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
                <img src="content/img/Roles.png" class="item-image" alt="...">
                <div class="card-body">
                    <h5 class="card-title">إدارة الصلاحيات</h5>
                    <a id="linkRoles" runat="server" href="Roles.aspx" class="btn btn-group-lg btn-primary" onclick="return Loader();">عرض</a>
                </div>
            </div>
        </div>
        <div class="col-2 text-center">
            <div class="item-image">
                <img src="content/img/Reservations.png" class="item-image" alt="...">
                <div class="card-body">
                    <h5 class="card-title">إدارة الحجوزات</h5>
                    <a id="linkManageReservations" runat="server" href="ManageReservations.aspx" class="btn btn-group-lg btn-primary" onclick="return Loader();">عرض</a>
                </div>
            </div>
        </div>
        <div class="col-2 text-center">
            <div class="item-image">
                <img src="content/img/Rooms.png" class="item-image" alt="...">
                <div class="card-body">
                    <h5 class="card-title">إدارة القاعات التدريبية</h5>
                    <a id="linkRooms" runat="server" href="Rooms.aspx" class="btn btn-group-lg btn-primary" onclick="return Loader();">عرض</a>
                </div>
            </div>
        </div>
        <div class="col-2 text-center">
            <div class="item-image">
                <img src="content/img/Courses.png" class="item-image" alt="...">
                <div class="card-body">
                    <h5 class="card-title">إدارة الدورات التدريبية</h5>
                    <a id="linkCourses" runat="server" href="Courses.aspx" class="btn btn-group-lg btn-primary" onclick="return Loader();">عرض</a>
                </div>
            </div>
        </div>
    </div>
    <div id="Users" runat="server" visible="false" class="row row-cols-1">
        <div class="col-2 text-center">
            <div class="item-image">
                <img src="content/img/Reservations.png" class="item-image" alt="...">
                <div class="card-body">
                    <h5 class="card-title">تسجيل حجز جديد</h5>
                    <a id="linkNewReservationUser" runat="server" href="NewReservation.aspx" class="btn btn-group-lg btn-primary" onclick="return Loader()">حجز جديد</a>
                </div>
            </div>
        </div>
        <div class="col-2 text-center">
            <div class="item-image">
                <img src="content/img/Reservations.png" class="item-image" alt="...">
                <div class="card-body">
                    <h5 class="card-title">إدارة الحجوزات</h5>
                    <a id="linkUserReservations" runat="server" href="UserReservations.aspx" class="btn btn-group-lg btn-primary" onclick="return Loader()">حجز جديد</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>