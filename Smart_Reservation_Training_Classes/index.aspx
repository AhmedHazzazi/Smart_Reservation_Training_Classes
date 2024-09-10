<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Smart_Reservation_Training_Classes.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row row-cols-1 row-cols-md-3 g-4">
        <div class="col">
            <div class="card h-auto">
                <img src="content/img/cover.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title fs-3">إدارة الصلاحيات</h5>
                    <asp:Button ID="BtnViewRoles" runat="server" Text="عرض" CssClass="btn btn-group-lg btn-primary" />
                    <asp:Button ID="BtnAddRoles" runat="server" Text="إضافة" CssClass="btn btn-group-lg btn-success" />
                    <asp:Button ID="BtnEditRoles" runat="server" Text="تعديل" CssClass="btn btn-group-lg btn-warning" />
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-auto">
                <img src="content/img/cover.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title fs-3">إدارة الحجوزات</h5>
                    <asp:Button ID="Button1" runat="server" Text="عرض" CssClass="btn btn-group-lg btn-primary" />
                    <asp:Button ID="Button2" runat="server" Text="إضافة" CssClass="btn btn-group-lg btn-success" />
                    <asp:Button ID="Button3" runat="server" Text="تعديل" CssClass="btn btn-group-lg btn-warning" />
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-auto">
                <img src="content/img/cover31.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title fs-3">إدارة القاعات التدريبية</h5>
                    <asp:Button ID="Button4" runat="server" Text="عرض" CssClass="btn btn-group-lg btn-primary" />
                    <asp:Button ID="Button5" runat="server" Text="إضافة" CssClass="btn btn-group-lg btn-success" />
                    <asp:Button ID="Button6" runat="server" Text="تعديل" CssClass="btn btn-group-lg btn-warning" />
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-100">
                <img src="content/img/cover31.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title fs-3">إدارة الدورات التدريبية</h5>
                    <asp:Button ID="Button7" runat="server" Text="عرض" CssClass="btn btn-group-lg btn-primary" />
                    <asp:Button ID="Button8" runat="server" Text="إضافة" CssClass="btn btn-group-lg btn-success" />
                    <asp:Button ID="Button9" runat="server" Text="تعديل" CssClass="btn btn-group-lg btn-warning" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>