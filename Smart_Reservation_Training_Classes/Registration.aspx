<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Smart_Reservation_Training_Classes.Registraion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
    function ShowPopup(title, body) {
        $("#MyPopup .modal-title").html(title);
        $("#MyPopup .modal-body").html(body);
        new bootstrap.Modal($("#MyPopup").show();
    }
    </script>
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="row text-center p-1">
                <div class="col-sm-12">
                    <asp:Label ID="lblSuccess" runat="server" CssClass="success" Visible="false"></asp:Label>
                    <asp:Label ID="lblError" runat="server" CssClass="error" Visible="false"></asp:Label>
                </div>
            </div>
            <asp:Panel ID="ViewsPanel" runat="server" CssClass="m-1">
                <div class="row p-2">
                    <div class="row mb-3">
                        <label for="txtName" class="col-sm-2 col-form-label">الإسم الكامل</label>
                        <div class="col-sm-4">
                            <asp:HiddenField ID="hfUserID" runat="server" />
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control form-control-sm" autocomplete="off" placeholder="الإسم الكامل" />
                            <asp:RequiredFieldValidator ID="RFVtxtName" runat="server" ErrorMessage="<img src='content/img/validation-false.png'/> يجب إدخال الإسم الكامل" ForeColor="Red" ControlToValidate="txtName" />
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label for="txtUserName" class="col-sm-2 col-form-label">اسم المستخدم</label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control form-control-sm" autocomplete="off" placeholder="اسم المستخدم" OnTextChanged="txtUserName_TextChanged" AutoPostBack="True" />
                            <span id="spanAvailability" runat="server" class="notification-input ni-correct" visible="false" /><span id="spanNotAvailability" runat="server" class="notification-input ni-error" visible="false" />
                            <asp:RequiredFieldValidator ID="RFVtxtUserName" runat="server" ErrorMessage="<img src='content/img/validation-false.png'/> يجب إدخال اسم المستخدم" ForeColor="Red" ControlToValidate="txtUserName" />
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label for="txtPassword" class="col-sm-2 col-form-label">كلمة المرور</label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control form-control-sm" autocomplete="off" placeholder="كلمة المرور" TextMode="Password" />
                            <asp:RequiredFieldValidator ID="RFVtxtPassword" runat="server" ErrorMessage="<img src='content/img/validation-false.png'/> يجب إدخال كلمة المرور" ForeColor="Red" ControlToValidate="txtPassword" />
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label for="txtPassword" class="col-sm-2 col-form-label">تأكيد كلمة المرور</label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control form-control-sm" autocomplete="off" placeholder="تأكيد كلمة المرور" TextMode="Password" />
                            <asp:CompareValidator ID="ComparetxtConfirmPassword" runat="server" ErrorMessage="<img src='content/img/validation-false.png'/> كلمة المرور وتأكيد كلمة المرور غير متطابقتين" ForeColor="Red" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" />
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label for="txtEmail" class="col-sm-2 col-form-label">البريد الإلكتروني</label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control form-control-sm" autocomplete="off" placeholder="البريد الإلكتروني" />
                            <asp:RequiredFieldValidator ID="RFVtxtEmail" runat="server" ErrorMessage="<img src='content/img/validation-false.png'/> يجب إدخال البريد الإلكتروني" Display="Dynamic" ForeColor="Red" ControlToValidate="txtEmail" />
                            <asp:RegularExpressionValidator ID="REVtxtEmail" runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail" ForeColor="Red" ErrorMessage="عنوان البريد الإلكتروني غير صالح" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-10">
                            <asp:Button ID="BtnSave" runat="server" Text="حفظ" CssClass="btn btn-primary" OnClientClick="Loader()" OnClick="BtnSave_Click" />
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="BtnSave" />
            <asp:PostBackTrigger ControlID="BtnSave" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>