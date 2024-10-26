﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewReservations.aspx.cs" Inherits="Smart_Reservation_Training_Classes.ViewReservations" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row text-center p-1">
        <div class="col-sm-12">
            <asp:Label ID="lblSuccess" runat="server" CssClass="success" Visible="false"></asp:Label>
            <asp:Label ID="lblError" runat="server" CssClass="error" Visible="false"></asp:Label>
        </div>
    </div>
    <asp:Panel ID="PanelWizard3" runat="server" CssClass="mt-1">
        <div class="card">
            <div class="card-header">
                ملخص طلب حجز القاعة التدريبية
            </div>
            <div class="card-block Panel-wizard">
                <asp:HiddenField ID="hfReservationID" runat="server" />
                <asp:HiddenField ID="hfUserID" runat="server" />
                <div class="row">
                    <div class="col-md-12">
                        <div class="alert alert-primary">بيانات مقدم طلب الحجز</div>
                    </div>
                    <div class="col-md-6" style="text-align: right; margin-bottom: 10px;">
                        <label class="control-label label-wizard" style="max-width: 200px;" for="txtName">الإسم</label>
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control text-wizard" placeholder="الإسم" MaxLength="300" ReadOnly="true" autocomplete="off"></asp:TextBox>
                    </div>
                    <div class="col-md-6" style="text-align: right; margin-bottom: 10px;">
                        <label class="control-label label-wizard" style="max-width: 200px;" for="txtUserName">إسم المستخدم</label>
                        <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control text-wizard" placeholder="إسم المستخدم" MaxLength="300" ReadOnly="true" autocomplete="off"></asp:TextBox>
                    </div>
                    <div class="col-md-6" style="text-align: right; margin-bottom: 10px;">
                        <label class="control-label label-wizard" style="max-width: 200px;" for="txtEmail">البريد الإلكتروني</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control text-wizard" placeholder="البريد الإلكتروني" MaxLength="300" ReadOnly="true" autocomplete="off"></asp:TextBox>
                    </div>
                    <div class="col-md-12">
                        <div class="alert alert-primary">بيانات حجز القاعة التدريبية</div>
                    </div>
                    <div class="col-md-6" style="text-align: right; margin-bottom: 10px;">
                        <label class="control-label label-wizard" style="max-width: 200px;" for="txtTypeSubtraction">نوع الطرح</label>
                        <asp:TextBox ID="txtTypeSubtraction" runat="server" CssClass="form-control text-wizard" placeholder="نوع الطرح" MaxLength="300" ReadOnly="true" autocomplete="off"></asp:TextBox>
                    </div>
                    <div class="col-md-6" style="text-align: right; margin-bottom: 10px;">
                        <label class="control-label label-wizard" style="max-width: 200px;" for="txtTargetGroup">الفئة المستهدفة</label>
                        <asp:TextBox ID="txtTargetGroup" runat="server" CssClass="form-control text-wizard" placeholder="الفئة المستهدفة" MaxLength="300" ReadOnly="true" autocomplete="off"></asp:TextBox>
                    </div>
                    <div class="col-md-6" style="text-align: right; margin-bottom: 10px;">
                        <label class="control-label label-wizard" style="max-width: 200px;" for="txtImplementingEntity">الجهة المنفذة</label>
                        <asp:TextBox ID="txtImplementingEntity" runat="server" CssClass="form-control text-wizard" placeholder="الجهة المنفذة" MaxLength="300" ReadOnly="true" autocomplete="off"></asp:TextBox>
                    </div>
                    <div class="col-md-6" style="text-align: right; margin-bottom: 10px;">
                        <label class="control-label label-wizard" style="max-width: 200px;" for="txtBeneficiaryEntity">الجهة المستفيدة</label>
                        <asp:TextBox ID="txtBeneficiaryEntity" runat="server" CssClass="form-control text-wizard" placeholder="الجهة المستفيدة" MaxLength="300" ReadOnly="true" autocomplete="off"></asp:TextBox>
                    </div>
                    <div class="col-md-6" style="text-align: right; margin-bottom: 10px;">
                        <label class="control-label label-wizard" style="max-width: 200px;" for="txtTime">الوقت</label>
                        <asp:TextBox ID="txtTime" runat="server" CssClass="form-control text-wizard" placeholder="الوقت" MaxLength="300" ReadOnly="true" autocomplete="off"></asp:TextBox>
                    </div>
                    <div class="col-md-6" style="text-align: right; margin-bottom: 10px;">
                        <label class="control-label label-wizard" style="max-width: 200px;">التاريخ</label>
                        <asp:TextBox ID="txtStartDate" runat="server" CssClass="form-control d-inline-block" ReadOnly="true" autocomplete="off" Width="200px"></asp:TextBox>
                        <div class="vr"></div>
                        <asp:TextBox ID="txtEndDate" runat="server" CssClass="form-control d-inline-block" ReadOnly="true" autocomplete="off" Width="200px"></asp:TextBox>
                    </div>
                    <div class="col-md-6" style="text-align: right; margin-bottom: 10px;">
                        <label class="control-label label-wizard" style="max-width: 200px;" for="txtExpectedNumber">العدد المتوقع</label>
                        <asp:TextBox ID="txtExpectedNumber" runat="server" CssClass="form-control text-wizard" placeholder="العدد المتوقع" MaxLength="300" ReadOnly="true" autocomplete="off"></asp:TextBox>
                    </div>
                    <div class="col-md-6" style="text-align: right; margin-bottom: 10px;">
                        <label class="control-label label-wizard" style="max-width: 200px;" for="txtDuration">مدتها</label>
                        <asp:TextBox ID="txtDuration" runat="server" CssClass="form-control text-wizard" placeholder="مدتها" MaxLength="300" ReadOnly="true" autocomplete="off"></asp:TextBox>
                    </div>
                    <div class="col-md-6" style="text-align: right; margin-bottom: 10px;">
                        <label class="control-label label-wizard" style="max-width: 200px;" for="txtRoomCode">كود القاعة</label>
                        <asp:TextBox ID="txtRoomCode" runat="server" CssClass="form-control text-wizard" placeholder="كود القاعة" MaxLength="300" ReadOnly="true" autocomplete="off"></asp:TextBox>
                    </div>
                    <div class="col-md-6" style="text-align: right; margin-bottom: 10px;">
                        <label class="control-label label-wizard" style="max-width: 200px;" for="txtRoomName">إسم القاعة</label>
                        <asp:TextBox ID="txtRoomName" runat="server" CssClass="form-control text-wizard" placeholder="إسم القاعة" MaxLength="300" ReadOnly="true" autocomplete="off"></asp:TextBox>
                    </div>
                    <div class="col-md-6" style="text-align: right; margin-bottom: 10px;">
                        <label class="control-label label-wizard" style="max-width: 200px;" for="txtRoomType">نوع القاعة</label>
                        <asp:TextBox ID="txtRoomType" runat="server" CssClass="form-control text-wizard" placeholder="نوع القاعة" MaxLength="300" ReadOnly="true" autocomplete="off"></asp:TextBox>
                    </div>
                    <div class="col-md-6" style="text-align: right; margin-bottom: 10px;">
                        <label class="control-label label-wizard" style="max-width: 200px;" for="txtRoomLocation">مكان القاعة</label>
                        <asp:TextBox ID="txtRoomLocation" runat="server" CssClass="form-control text-wizard" placeholder="مكان القاعة" MaxLength="300" ReadOnly="true" autocomplete="off"></asp:TextBox>
                    </div>
                    <div class="col-md-6" style="text-align: right; margin-bottom: 10px;">
                        <label class="control-label label-wizard" style="max-width: 200px;" for="txtRoomCapacity">سعة القاعة</label>
                        <asp:TextBox ID="txtRoomCapacity" runat="server" CssClass="form-control text-wizard" placeholder="سعة القاعة" MaxLength="300" ReadOnly="true" autocomplete="off"></asp:TextBox>
                    </div>
                    <div class="col-md-6" style="text-align: right; margin-bottom: 10px;">
                        <label class="control-label label-wizard" style="max-width: 200px;" for="txtCourseCode">كود الدورة</label>
                        <asp:TextBox ID="txtCourseCode" runat="server" CssClass="form-control text-wizard" placeholder="كود الدورة" MaxLength="300" ReadOnly="true" autocomplete="off"></asp:TextBox>
                    </div>
                    <div class="col-md-6" style="text-align: right; margin-bottom: 10px;">
                        <label class="control-label label-wizard" style="max-width: 200px;" for="txtCourseName">إسم الدورة</label>
                        <asp:TextBox ID="txtCourseName" runat="server" CssClass="form-control text-wizard" placeholder="إسم الدورة" MaxLength="300" ReadOnly="true" autocomplete="off"></asp:TextBox>
                    </div>
                    <div class="col-md-6" style="text-align: right; margin-bottom: 10px;">
                        <label class="control-label label-wizard" style="max-width: 200px;" for="txtCourseType">نوع الدورة</label>
                        <asp:TextBox ID="txtCourseType" runat="server" CssClass="form-control text-wizard" placeholder="نوع الدورة" MaxLength="300" ReadOnly="true" autocomplete="off"></asp:TextBox>
                    </div>
                    <div class="col-md-6" style="text-align: right; margin-bottom: 10px;">
                        <label class="control-label label-wizard" style="max-width: 200px;" for="txtLecturerName">اسم المدرب</label>
                        <asp:TextBox ID="txtLecturerName" runat="server" CssClass="form-control text-wizard" placeholder="اسم المدرب" MaxLength="300" ReadOnly="true" autocomplete="off"></asp:TextBox>
                    </div>
                    <div class="col-md-6" style="text-align: right; margin-bottom: 10px;">
                        <label class="control-label label-wizard" style="max-width: 200px;" for="txtRequirements">المتطلبات</label>
                        <asp:TextBox ID="txtRequirements" runat="server" CssClass="form-control text-wizard" placeholder="المتطلبات" MaxLength="300" ReadOnly="true" autocomplete="off"></asp:TextBox>
                    </div>
                    <div class="col-md-6" style="text-align: right; margin-bottom: 10px;">
                        <label class="control-label label-wizard" style="max-width: 200px;" for="txtLanguage">اللغة</label>
                        <asp:TextBox ID="txtLanguage" runat="server" CssClass="form-control text-wizard" placeholder="اللغة" MaxLength="300" ReadOnly="true" autocomplete="off"></asp:TextBox>
                    </div>
                    <div class="col-md-6" style="text-align: right; margin-bottom: 10px;">
                        <label class="control-label label-wizard" style="max-width: 200px;" for="txtUseOfComputer">استخدام معمل الحاسب</label>
                        <asp:TextBox ID="txtUseOfComputer" runat="server" CssClass="form-control text-wizard" placeholder="استخدام معمل الحاسب" MaxLength="300" ReadOnly="true" autocomplete="off"></asp:TextBox>
                    </div>
                    <div class="col-md-6" style="text-align: right; margin-bottom: 10px;">
                        <label class="control-label label-wizard" style="max-width: 200px;" for="txtCourseTopics">محاور الدورة</label>
                        <asp:TextBox ID="txtCourseTopics" runat="server" CssClass="form-control text-wizard" placeholder="محاور الدورة" MaxLength="300" ReadOnly="true" autocomplete="off"></asp:TextBox>
                    </div>
                    <div class="col-md-6" style="text-align: right; margin-bottom: 10px;">
                        <label class="control-label label-wizard" style="max-width: 200px;" for="txtNotes">ملاحظات</label>
                        <asp:TextBox ID="txtNotes" runat="server" CssClass="form-control text-wizard" placeholder="ملاحظات" MaxLength="300" ReadOnly="true" autocomplete="off"></asp:TextBox>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>
    <div class="row-cols-6 text-center">
        <asp:Button ID="BtnApproval" runat="server" Text="إعتماد الطلب" CssClass="btn btn-primary w-auto" OnClientClick="Loader()" OnClick="BtnApproval_Click" />
        <div class="vr"></div>
        <asp:Button ID="BtnReject" runat="server" CssClass="btn btn-primary w-auto" Text="رفض الطلب" OnClientClick="Loader()" OnClick="BtnReject_Click" />
    </div>
</asp:Content>