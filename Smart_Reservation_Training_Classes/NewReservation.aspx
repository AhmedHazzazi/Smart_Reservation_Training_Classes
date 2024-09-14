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
                <div class="panel-heading">
                    <h3 class="panel-title">نموذج طرح دورة</h3>
                </div>
                <div class="panel-body">
                    <asp:HiddenField ID="hfReservationID" runat="server" />
                    <asp:Table ID="tblDataReservation" runat="server" CssClass="table table-responsive-lg">
                        <asp:TableRow CssClass="forms-input-row">
                            <%--<asp:TableCell CssClass="forms-input-label">
                                <label class="forms-input-label">نوع الطرح</label>
                            </asp:TableCell>
                            <asp:TableCell CssClass="forms-input-label">
                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" CssClass="form-check form-check-inline">
                                    <asp:ListItem Value="دورة تدريبية">دورة تدريبية</asp:ListItem>
                                    <asp:ListItem Value="برنامج تدريبي">برنامج تدريبي</asp:ListItem>
                                </asp:RadioButtonList>
                            </asp:TableCell>--%>
                            <asp:TableCell CssClass="forms-input-label">
                                <label class="forms-input-label">نوع الدورة</label>
                            </asp:TableCell>
                            <asp:TableCell CssClass="forms-input-label">
                                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="dropdown">
                                    <asp:ListItem Value="">-- أختر --</asp:ListItem>
                                    <asp:ListItem>إدارية</asp:ListItem>
                                    <asp:ListItem>تقنية</asp:ListItem>
                                    <asp:ListItem>تعليمية</asp:ListItem>
                                    <asp:ListItem>شخصية</asp:ListItem>
                                    <asp:ListItem>بحثية</asp:ListItem>
                                    <asp:ListItem>قيادية</asp:ListItem>
                                    <asp:ListItem>جودة</asp:ListItem>
                                    <asp:ListItem>أخرى</asp:ListItem>
                                </asp:DropDownList>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow CssClass="forms-input-row">
                            <asp:TableCell CssClass="forms-input-label">
                                <label class="forms-input-label">كود الدورة</label>
                            </asp:TableCell>
                            <asp:TableCell CssClass="forms-input-row-spacing">
                                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                            </asp:TableCell>
                            <asp:TableCell CssClass="forms-input-label">
                                <label class="forms-input-label">اسم الدورة</label>
                            </asp:TableCell>
                            <asp:TableCell CssClass="forms-input-row-spacing">
                                <asp:TextBox ID="TextBox8" runat="server" CssClass="form-control"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow CssClass="forms-input-row">
                            <asp:TableCell CssClass="forms-input-label">
                                <label class="forms-input-label">الفئة المستهدفة</label>
                            </asp:TableCell>
                            <asp:TableCell CssClass="forms-input-row-spacing">
                                <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow CssClass="forms-input-row">
                            <asp:TableCell CssClass="forms-input-label">
                                <label class="forms-input-label">الجهة المنفذة</label>
                            </asp:TableCell>
                            <asp:TableCell CssClass="forms-input-row-spacing">
                                <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox>
                            </asp:TableCell>
                            <asp:TableCell CssClass="forms-input-label">
                                <label class="forms-input-label">الجهة المستفيدة</label>
                            </asp:TableCell>
                            <asp:TableCell CssClass="forms-input-row-spacing">
                                <asp:TextBox ID="TextBox9" runat="server" CssClass="form-control"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow CssClass="forms-input-row">
                            <asp:TableCell CssClass="forms-input-label">
                                <label class="forms-input-label">الوقت</label>
                            </asp:TableCell>
                            <asp:TableCell CssClass="forms-input-row-spacing">
                                <asp:TextBox ID="TextBox10" runat="server" CssClass="form-control"></asp:TextBox>
                            </asp:TableCell>
                            <asp:TableCell CssClass="forms-input-label">
                                <label class="forms-input-label">التاريخ</label>
                            </asp:TableCell>
                            <asp:TableCell CssClass="forms-input-row-spacing">
                                <asp:TextBox ID="TextBox11" runat="server" CssClass="form-control"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow CssClass="forms-input-row">
                            <asp:TableCell CssClass="forms-input-label">
                                <label class="forms-input-label">العدد المتوقع</label>
                            </asp:TableCell>
                            <asp:TableCell CssClass="forms-input-row-spacing">
                                <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control"></asp:TextBox>
                            </asp:TableCell>
                            <asp:TableCell CssClass="forms-input-label">
                                <label class="forms-input-label">مدتها</label>
                            </asp:TableCell>
                            <asp:TableCell CssClass="forms-input-row-spacing">
                                <asp:TextBox ID="TextBox12" runat="server" CssClass="form-control"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow CssClass="forms-input-row">
                            <asp:TableCell CssClass="forms-input-label">
                                <label class="forms-input-label">مقر التنفيذ(القاعة)</label>
                            </asp:TableCell>
                            <asp:TableCell CssClass="forms-input-row-spacing">
                                <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control"></asp:TextBox>
                            </asp:TableCell>
                            <asp:TableCell CssClass="forms-input-label">
                                <label class="forms-input-label">التنفيذ</label>
                            </asp:TableCell>
                            <asp:TableCell CssClass="forms-input-row-spacing">
                                <div>
                                    <asp:RadioButton ID="RadioButton1" runat="server" Text="حضوري" GroupName="gender" />
                                    <asp:RadioButton ID="RadioButton2" runat="server" Text="بث تلفزيوني" GroupName="gender" />
                                    <asp:RadioButton ID="RadioButton3" runat="server" Text="عن بعد" GroupName="gender" />
                                </div>
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