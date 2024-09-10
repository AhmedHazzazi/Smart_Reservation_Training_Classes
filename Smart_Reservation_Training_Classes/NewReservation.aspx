<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewReservation.aspx.cs" Inherits="Smart_Reservation_Training_Classes.NewReservation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <contenttemplate>
            <div class="row" style="padding: 10px 0 10px 0;">
                <div class="col-12">
                    <asp:Label ID="lblWizardError" runat="server" CssClass="error" Visible="false"></asp:Label>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingOne">
                    <h3 class="panel-title">إسمارة الطلب</h3>
                </div>
                <div class="panel-body">
                    <asp:HiddenField ID="hfRequsetID" runat="server" />
                    <asp:Table ID="tblDataEmployee" runat="server" CssClass="table table-responsive-lg">
                        <asp:TableRow CssClass="forms-input-row">
                            <asp:TableCell CssClass="forms-input-label">
                                <label class="forms-input-label">أسم الموظف</label>
                            </asp:TableCell>
                            <asp:TableCell CssClass="forms-input-label">
                                <asp:TextBox ID="TextBox" runat="server" CssClass="form-control"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow CssClass="forms-input-row">
                            <asp:TableCell CssClass="forms-input-label">
                                <label class="forms-input-label">رقم الملف</label>
                            </asp:TableCell>
                            <asp:TableCell CssClass="forms-input-row-spacing">
                                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow CssClass="forms-input-row">
                            <asp:TableCell CssClass="forms-input-label">
                                <label class="forms-input-label">السجل المدني</label>
                            </asp:TableCell>
                            <asp:TableCell CssClass="forms-input-row-spacing">
                                <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow CssClass="forms-input-row">
                            <asp:TableCell CssClass="forms-input-label">
                                <label class="forms-input-label">نوع الجنس</label>
                            </asp:TableCell>
                            <asp:TableCell CssClass="forms-input-row-spacing">
                                <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow CssClass="forms-input-row">
                            <asp:TableCell CssClass="forms-input-label">
                                <label class="forms-input-label">تاريخ الميلاد</label>
                            </asp:TableCell>
                            <asp:TableCell CssClass="forms-input-row-spacing">
                                <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow CssClass="forms-input-row">
                            <asp:TableCell CssClass="forms-input-label">
                                <label class="forms-input-label">الكلية</label>
                            </asp:TableCell>
                            <asp:TableCell CssClass="forms-input-row-spacing">
                                <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow CssClass="forms-input-row">
                            <asp:TableCell CssClass="forms-input-label">
                                <label class="forms-input-label">القسم</label>
                            </asp:TableCell>
                            <asp:TableCell CssClass="forms-input-row-spacing">
                                <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow CssClass="forms-input-row">
                            <asp:TableCell CssClass="forms-input-label">
                                <label class="forms-input-label">الرتبة العلمية</label>
                            </asp:TableCell>
                            <asp:TableCell CssClass="forms-input-row-spacing">
                                <asp:TextBox ID="TextBox7" runat="server" CssClass="form-control"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                    <div style="text-align: center; padding: 5px;">
                        <asp:Button ID="BtnSend" runat="server" Text="إرسال الطلب" CssClass="btn btn-primary" />
                    </div>
                </div>
            </div>
        </contenttemplate>
        <triggers>
            <%--<asp:PostBackTrigger ControlID="btnSave_Next" />--%>
        </triggers>
    </asp:UpdatePanel>
</asp:Content>