<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Smart_Reservation_Training_Classes.Registraion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div id="MyPopup" class="modal fade" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
                <div class="modal-dialog modal-dialog-scrollable">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title"></h4>
                            <button type="button" class="close" data-bs-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="row text-center p-1">
                                <div class="col-sm-12">
                                    <asp:Label ID="lblSuccess" runat="server" CssClass="success" Visible="false"></asp:Label>
                                    <asp:Label ID="lblError" runat="server" CssClass="error" Visible="false"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-success" data-bs-dismiss="modal">موافق</button>
                        </div>
                    </div>
                </div>
            </div>
            <asp:Panel ID="ViewsPanel" runat="server" CssClass="m-1">
                <div class="row p-2">
                    <div class="row mb-3">
                        <label for="txtName" class="col-sm-2 col-form-label">الإسم الكامل</label>
                        <div class="col-sm-8">
                            <asp:HiddenField ID="hfUserID" runat="server" />
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control form-control-sm" placeholder="الإسم الكامل" onkeyup="usernameChecker(this.value);" />
                            <span id="spanAvailability">
                            <asp:RequiredFieldValidator ID="RFVtxtName" runat="server" ErrorMessage="يجب إدخال الإسم الكامل" ForeColor="Red" ControlToValidate="txtName" />
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label for="txtUserName" class="col-sm-2 col-form-label">اسم المستخدم</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control form-control-sm" placeholder="اسم المستخدم" />
                            <asp:RequiredFieldValidator ID="RFVtxtUserName" runat="server" ErrorMessage="يجب إدخال اسم المستخدم" ForeColor="Red" ControlToValidate="txtUserName" />
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label for="txtPassword" class="col-sm-2 col-form-label">كلمة المرور</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control form-control-sm" placeholder="كلمة المرور" TextMode="Password" />
                            <asp:RequiredFieldValidator ID="RFVtxtPassword" runat="server" ErrorMessage="يجب إدخال كلمة المرور" ForeColor="Red" ControlToValidate="txtPassword" />
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label for="txtPassword" class="col-sm-2 col-form-label">تأكيد كلمة المرور</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control form-control-sm" placeholder="تأكيد كلمة المرور" TextMode="Password" />
                            <asp:CompareValidator ID="ComparetxtConfirmPassword" runat="server" ErrorMessage="كلمة المرور وتأكيد كلمة المرور غير متطابقتين" ForeColor="Red" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" />
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label for="txtEmail" class="col-sm-2 col-form-label">البريد الإلكتروني</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control form-control-sm" placeholder="البريد الإلكتروني" />
                            <asp:RequiredFieldValidator ID="RFVtxtEmail" runat="server" ErrorMessage="يجب إدخال البريد الإلكتروني" Display="Dynamic" ForeColor="Red" ControlToValidate="txtEmail" />
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
        </Triggers>
    </asp:UpdatePanel>

    <script type="text/javascript">
    var usernameCheckerTimer;
    var spanAvailability = $get("spanAvailability");

    function usernameChecker(username) {
        clearTimeout(usernameCheckerTimer);
        if (username.length == 0)
            spanAvailability.innerHTML = "";
        else {
            spanAvailability.innerHTML = "<span class='notification-input ni-ckeck' >حاري التحقق</span>";
            usernameCheckerTimer = setTimeout("checkUsernameUsage('" + username + "');", 750);
        }
    }

    function checkUsernameUsage(username) {
        // initiate the ajax pagemethod call
        // لتوصيل الجافا سكربت بكود asp والتحقق من أن اسم المستخدم متوفر
        PageMethods.IsUserAvailable(username, OnSucceeded);
    }

    // Callback function invoked on successful completion of the page method.
    function OnSucceeded(result, userContext, methodName) {
        if (methodName == "IsUserAvailable") {
            if (result == true)
                spanAvailability.innerHTML = "<span class='notification-input ni-correct' >متاح</span>";
            else
                spanAvailability.innerHTML = "<span class='notification-input ni-error' >غير متاح</span>";
        }
    }
    </script>   

</asp:Content>