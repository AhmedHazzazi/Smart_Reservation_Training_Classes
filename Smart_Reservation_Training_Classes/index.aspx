<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Smart_Reservation_Training_Classes.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <asp:Panel ID="Error_Panel" runat="server" Visible="false" CssClass="alert alert-danger" role="alert">
            <asp:Label ID="lblErrorMsg" runat="server"></asp:Label>
        </asp:Panel>
    </div>
    <div id="Admin" runat="server" visible="false" class="row row-cols-1 row-cols-md-3 g-4">
        <div class="col">
            <div class="card h-auto">
                <img src="content/img/cover.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title fs-3">إدارة الصلاحيات</h5>
                    <asp:Button ID="BtnViewRoles" runat="server" Text="عرض" CssClass="btn btn-group-lg btn-primary" OnClientClick="Loader();" />
                    <%--<asp:Button ID="BtnAddRoles" runat="server" Text="إضافة" CssClass="btn btn-group-lg btn-success" OnClientClick="Loader();" />--%>
                    <%--<asp:Button ID="BtnEditRoles" runat="server" Text="تعديل" CssClass="btn btn-group-lg btn-warning" OnClientClick="Loader();" />--%>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-auto">
                <img src="content/img/cover.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title fs-3">إدارة الحجوزات</h5>
                    <asp:Button ID="BtnViewReservationAdmin" runat="server" Text="عرض" CssClass="btn btn-group-lg btn-primary" OnClientClick="Loader();" />
                    <%--<asp:Button ID="BtnAddReservationAdmin" runat="server" Text="إضافة" CssClass="btn btn-group-lg btn-success" OnClientClick="Loader();" />--%>
                    <%--<asp:Button ID="BtnEditReservationAdmin" runat="server" Text="تعديل" CssClass="btn btn-group-lg btn-warning" OnClientClick="Loader();" />--%>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-auto">
                <img src="content/img/cover31.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title fs-3">إدارة القاعات التدريبية</h5>
                    <asp:Button ID="BtnViewRooms" runat="server" Text="عرض" CssClass="btn btn-group-lg btn-primary" OnClientClick="Loader();" />
                    <%--<asp:Button ID="BtnAddRooms" runat="server" Text="إضافة" CssClass="btn btn-group-lg btn-success" OnClientClick="Loader();" />--%>
                    <%--<asp:Button ID="BtnEditRooms" runat="server" Text="تعديل" CssClass="btn btn-group-lg btn-warning" OnClientClick="Loader();" />--%>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-100">
                <img src="content/img/cover31.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title fs-3">إدارة الدورات التدريبية</h5>
                    <asp:Button ID="BtnViewCourses" runat="server" Text="عرض" CssClass="btn btn-group-lg btn-primary" OnClientClick="Loader();" />
                    <%--<asp:Button ID="BtnAddCourses" runat="server" Text="إضافة" CssClass="btn btn-group-lg btn-success" OnClientClick="Loader();" />--%>
                    <%--<asp:Button ID="BtnEditCourses" runat="server" Text="تعديل" CssClass="btn btn-group-lg btn-warning" OnClientClick="Loader();" />--%>
                </div>
            </div>
        </div>
    </div>
    <div id="Users" runat="server" visible="false" class="row row-cols-1 row-cols-md-3 g-4">
        <div class="col">
            <div class="card h-auto">
                <img src="content/img/cover.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title fs-3">تسجيل حجز جديد</h5>
                    <%--<asp:Button ID="BtnNewReservationUser" runat="server" Text="حجز جديد" CssClass="btn btn-group-lg btn-primary" OnClientClick="Loader();" />--%>
                    <a id="lbtnNewReservationUser" runat="server" href="NewReservation.aspx" class="btn btn-group-lg btn-primary" onclick="return Loader()">حجز جديد</a>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-auto">
                <img src="content/img/cover.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title fs-3">إدارة الحجوزات</h5>
                    <asp:Button ID="BtnViewReservationUser" runat="server" Text="عرض" CssClass="btn btn-group-lg btn-primary" OnClientClick="Loader();" />
                    <asp:Button ID="BtnEditReservationUser" runat="server" Text="تعديل" CssClass="btn btn-group-lg btn-warning" OnClientClick="Loader();" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>