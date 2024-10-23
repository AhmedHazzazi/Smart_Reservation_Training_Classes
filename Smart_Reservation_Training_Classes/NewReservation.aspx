<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewReservation.aspx.cs" Inherits="Smart_Reservation_Training_Classes.NewReservation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <label class='<%if (Convert.ToInt32(MultiViewCard.ActiveViewIndex) >= 0)
            {%> btn btn-success <%}
            else
            {%> btn btn-light <%}%>'>
            القاعات المتاحة</label>
        <label class='<%if (Convert.ToInt32(MultiViewCard.ActiveViewIndex) >= 1)
            {%> btn btn-success <%}
            else
            {%> btn btn-light <%}%>'>
            بيانات الدورة</label>
        <label class='<%if (Convert.ToInt32(MultiViewCard.ActiveViewIndex) >= 2)
            {%> btn btn-success <%}
            else
            {%> btn btn-light <%}%>'>
            تأكيد الطلب</label>

        <asp:Label ID="lblWizardError" runat="server" CssClass="error p-1 mx-1" Visible="false"></asp:Label>
    </div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <contenttemplate>
            <%--<div class="row p-2">
                <div class="col">
                    <asp:Label ID="lblWizardError" runat="server" CssClass="error" Visible="false"></asp:Label>
                </div>
            </div>--%>
            <div class="text-primary fs-5 py-1">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file-text" aria-hidden="true">
                    <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line><polyline points="10 9 9 9 8 9"></polyline>
                </svg>
                تسجيل حجز جديد
            </div>
            <div class="bg-light p-1">
                <asp:MultiView ID="MultiViewCard" runat="server" ActiveViewIndex="0">
                    <asp:View ID="View1" runat="server">
                        <asp:Panel ID="PanelWizard1" runat="server" CssClass="mt-1">
                            <div class="card">
                                <div class="card-header">
                                    القاعات المتاحة
                                </div>
                                <div class="card-block Panel-wizard">
                                    <asp:Panel ID="SearchToolbarPanel" runat="server" CssClass="pb-2" DefaultButton="BtnSearch">
                                        <label class="label">تاريخ البداية : </label>
                                        <asp:TextBox ID="txtSearchStartDate" runat="server" CssClass="form-control hijri-date-input d-inline-block" autocomplete="off" Width="200px"></asp:TextBox>
                                        <label class="label">تاريخ النهاية : </label>
                                        <asp:TextBox ID="txtSearchEndDate" runat="server" CssClass="form-control hijri-date-input d-inline-block" autocomplete="off" Width="200px"></asp:TextBox>
                                        <asp:Button ID="BtnSearch" runat="server" Text="بحث" CssClass="btn btn-primary w-auto" OnClientClick="Loader()" OnClick="BtnSearch_Click" />
                                        <asp:Button ID="BtnResetSearch" runat="server" Text="X" CssClass="btn btn-danger w-auto" OnClientClick="Loader()" Visible="False" OnClick="BtnResetSearch_Click" />
                                    </asp:Panel>
                                    <asp:Panel ID="ViewsPanel" runat="server" CssClass="mt-1" Visible="false">
                                        <asp:GridView ID="gvRoomsAvailable" runat="server" CssClass="table table-bordered table-hover" DataKeyNames="RoomCode" AutoGenerateColumns="False" AlternatingRowStyle-BackColor="#C2D69B" AllowPaging="True" CellPadding="4" GridLines="None">
                                            <Columns>
                                                <asp:TemplateField HeaderText="اختار">
                                                    <ItemTemplate>
                                                        <asp:RadioButton ID="RadioButtonChooseRoom" runat="server" />
                                                        <asp:HiddenField ID="hfRoomCode" runat="server" Value='<%#Eval("RoomCode")%>' />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="10px" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="RoomCode" HeaderText="كود القاعة"></asp:BoundField>
                                                <asp:BoundField DataField="RoomName" HeaderText="اسم القاعة"></asp:BoundField>
                                                <asp:BoundField DataField="RoomType" HeaderText="نوع القاعة"></asp:BoundField>
                                                <asp:BoundField DataField="RoomLocation" HeaderText="مقر القاعة"></asp:BoundField>
                                                <asp:BoundField DataField="RoomCapacity" HeaderText="سعة القاعة"></asp:BoundField>
                                            </Columns>
                                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <AlternatingRowStyle BackColor="White" />
                                            <EmptyDataTemplate>
                                                لا يوجد قاعات تدريبية متاحة حاليا!
                                            </EmptyDataTemplate>
                                            <RowStyle BackColor="#EFF3FB" />
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <EditRowStyle BackColor="#2461BF" />
                                        </asp:GridView>
                                        <div class="row-cols-6 text-center">
                                            <asp:Button ID="BtnSaveNext2" runat="server" Text="التالي" CssClass="btn btn-primary w-auto" OnClientClick="Loader();" OnClick="BtnSaveNext2_Click" />
                                        </div>
                                    </asp:Panel>
                                </div>
                            </div>
                        </asp:Panel>
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                        <asp:Panel ID="PanelWizard2" runat="server" CssClass="mt-1">
                            <div class="card">
                                <div class="card-header">
                                    بيانات الدورة
                                </div>
                                <div class="card-block Panel-wizard">
                                    <asp:HiddenField ID="hfReservationID" runat="server" />
                                    <asp:HiddenField ID="hfUserID" runat="server" />
                                    <asp:Table ID="tblDataReservation" runat="server" CssClass="table table-responsive-lg">
                                        <asp:TableRow CssClass="forms-input-row">
                                            <asp:TableCell>
                                            <label class="forms-input-label">نوع الطرح</label>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:RadioButtonList ID="RBLTypeSubtraction" runat="server" CssClass="hideradio" RepeatDirection="Horizontal">
                                                    <asp:ListItem Value="دورة تدريبية">دورة تدريبية</asp:ListItem>
                                                    <asp:ListItem Value="برنامج تدريبي">برنامج تدريبي</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                        <label class="forms-input-label">الفئة المستهدفة</label>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:DropDownList ID="DDLTargetGroup" runat="server" CssClass="dropdownlists">
                                                    <asp:ListItem Value="" Selected="True">-- أختر --</asp:ListItem>
                                                    <asp:ListItem Value="هيئة التدريس">هيئة التدريس</asp:ListItem>
                                                    <asp:ListItem Value="هيئة التدريس الجدد">هيئة التدريس الجدد</asp:ListItem>
                                                    <asp:ListItem Value="قيادات أكاديمية">قيادات أكاديمية</asp:ListItem>
                                                    <asp:ListItem Value="قيادات إدارية">قيادات إدارية</asp:ListItem>
                                                    <asp:ListItem Value="إداريين">إداريين</asp:ListItem>
                                                    <asp:ListItem Value="سكرتارية">سكرتارية</asp:ListItem>
                                                    <asp:ListItem Value="طلاب">طلاب</asp:ListItem>
                                                    <asp:ListItem Value="طلاب دراسات عليا">طلاب دراسات عليا</asp:ListItem>
                                                    <asp:ListItem Value="معيدين ومحاضرين">معيدين ومحاضرين</asp:ListItem>
                                                    <asp:ListItem Value="فنيين">فنيين</asp:ListItem>
                                                </asp:DropDownList>
                                            </asp:TableCell>
                                        </asp:TableRow>

                                        <asp:TableRow CssClass="forms-input-row">
                                            <asp:TableCell>
                                        <label class="forms-input-label">الجهة المنفذة</label>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:TextBox ID="txtImplementingEntity" runat="server" CssClass="form-control text-wizard"></asp:TextBox>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                        <label class="forms-input-label">الجهة المستفيدة</label>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:TextBox ID="txtBeneficiaryEntity" runat="server" CssClass="form-control text-wizard"></asp:TextBox>
                                            </asp:TableCell>
                                        </asp:TableRow>

                                        <asp:TableRow CssClass="forms-input-row">
                                            <asp:TableCell>
                                        <label class="forms-input-label">الوقت</label>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:TextBox ID="txtTime" runat="server" CssClass="form-control text-wizard"></asp:TextBox>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                        <label class="forms-input-label">التاريخ</label>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:TextBox ID="txtStartDate" runat="server" CssClass="form-control text-wizard d-inline-block" ReadOnly="true" autocomplete="off" Width="200px"></asp:TextBox>
                                                <div class="vr"></div>
                                                <asp:TextBox ID="txtEndDate" runat="server" CssClass="form-control text-wizard d-inline-block" ReadOnly="true" autocomplete="off" Width="200px"></asp:TextBox>
                                            </asp:TableCell>
                                        </asp:TableRow>

                                        <asp:TableRow CssClass="forms-input-row">
                                            <asp:TableCell>
                                        <label class="forms-input-label">العدد المتوقع</label>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:TextBox ID="txtExpectedNumber" runat="server" CssClass="form-control text-wizard" autocomplete="off"></asp:TextBox>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                        <label class="forms-input-label">مدتها</label>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:TextBox ID="txtDuration" runat="server" CssClass="form-control text-wizard" autocomplete="off"></asp:TextBox>
                                            </asp:TableCell>
                                        </asp:TableRow>

                                        <asp:TableRow CssClass="forms-input-row">
                                            <asp:TableCell>
                                        <label class="forms-input-label">كود القاعة</label>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:TextBox ID="txtRoomCode" runat="server" CssClass="form-control text-wizard" ReadOnly="true" autocomplete="off"></asp:TextBox>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                        <label class="forms-input-label">كود الدورة</label>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:TextBox ID="txtCourseCode" runat="server" CssClass="form-control text-wizard" autocomplete="off"></asp:TextBox>
                                            </asp:TableCell>
                                        </asp:TableRow>

                                        <asp:TableRow CssClass="forms-input-row">
                                            <asp:TableCell>
                                        <label class="forms-input-label">اسم المدرب</label>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:TextBox ID="txtLecturerName" runat="server" CssClass="form-control text-wizard" autocomplete="off"></asp:TextBox>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                        <label class="forms-input-label">المتطلبات</label>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:TextBox ID="txtRequirements" runat="server" CssClass="form-control text-wizard" autocomplete="off" TextMode="MultiLine"></asp:TextBox>
                                            </asp:TableCell>
                                        </asp:TableRow>

                                        <asp:TableRow CssClass="forms-input-row">
                                            <asp:TableCell>
                                        <label class="forms-input-label">اللغة</label>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:RadioButtonList ID="RblLanguage" runat="server" CssClass="hideradio" RepeatDirection="Horizontal">
                                                    <asp:ListItem Value="عربي">عربي</asp:ListItem>
                                                    <asp:ListItem Value="إنجليزي">إنجليزي</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                        <label class="forms-input-label">استخدام معمل الحاسب</label>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:RadioButtonList ID="RblUseOfComputer" runat="server" CssClass="hideradio" RepeatDirection="Horizontal">
                                                    <asp:ListItem Value="نعم">نعم</asp:ListItem>
                                                    <asp:ListItem Value="لا">لا</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </asp:TableCell>
                                        </asp:TableRow>

                                        <asp:TableRow CssClass="forms-input-row">
                                            <asp:TableCell>
                                        <label class="forms-input-label">محاور الدورة</label>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:TextBox ID="txtCourseTopics" runat="server" CssClass="form-control text-wizard" autocomplete="off" TextMode="MultiLine"></asp:TextBox>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                        <label class="forms-input-label">ملاحظات</label>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:TextBox ID="txtNotes" runat="server" CssClass="form-control text-wizard" autocomplete="off" TextMode="MultiLine"></asp:TextBox>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                </div>
                            </div>
                            <div class="row-cols-6 text-center">
                                <asp:Button ID="BtnStepPrevious1" runat="server" CssClass="btn btn-primary w-auto" Text="السابق" OnClientClick="Loader()" OnClick="BtnStepPrevious1_Click" />
                                <div class="vr"></div>
                                <asp:Button ID="BtnSaveNext3" runat="server" Text="التالي" CssClass="btn btn-primary w-auto" OnClientClick="Loader()" OnClick="BtnSaveNext3_Click" />
                            </div>
                        </asp:Panel>
                    </asp:View>
                    <asp:View ID="View3" runat="server">
                        <asp:Panel ID="PanelWizard3" runat="server" CssClass="mt-1">
                            <div class="card">
                                <div class="card-header">
                                    ملخص الطلب
                                </div>
                                <div class="card-block Panel-wizard">
                                    <asp:HiddenField ID="hfReservationID_S" runat="server" />
                                    <asp:HiddenField ID="hfUserID_S" runat="server" />
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="alert alert-primary">ملخص بيانات الدورة التدريبية</div>
                                        </div>
                                        <div class="col-md-6" style="text-align: right; margin-bottom: 10px;">
                                            <label class="control-label label-wizard" style="max-width: 200px;" for="FullName">نوع الطرح</label>
                                            <asp:TextBox ID="txtTypeSubtraction_S" runat="server" CssClass="form-control text-wizard" placeholder="الفئة المستهدفة" MaxLength="300" ReadOnly="true" autocomplete="off"></asp:TextBox>
                                        </div>
                                        <div class="col-md-6" style="text-align: right; margin-bottom: 10px;">
                                            <label class="control-label label-wizard" style="max-width: 200px;" for="FullName">الفئة المستهدفة</label>
                                            <asp:TextBox ID="txtTargetGroup_S" runat="server" CssClass="form-control text-wizard" placeholder="الفئة المستهدفة" MaxLength="300" ReadOnly="true" autocomplete="off"></asp:TextBox>
                                        </div>
                                        <div class="col-md-6" style="text-align: right; margin-bottom: 10px;">
                                            <label class="control-label label-wizard" style="max-width: 200px;" for="nid">الجهة المنفذة</label>
                                            <asp:TextBox ID="txtImplementingEntity_S" runat="server" CssClass="form-control text-wizard" placeholder="الجهة المنفذة" MaxLength="300" ReadOnly="true" autocomplete="off"></asp:TextBox>
                                        </div>
                                        <div class="col-md-6" style="text-align: right; margin-bottom: 10px;">
                                            <label class="control-label label-wizard" style="max-width: 200px;" for="gender">الجهة المستفيدة</label>
                                            <asp:TextBox ID="txtBeneficiaryEntity_S" runat="server" CssClass="form-control text-wizard" placeholder="الجهة المستفيدة" MaxLength="300" ReadOnly="true" autocomplete="off"></asp:TextBox>
                                        </div>
                                        <div class="col-md-6" style="text-align: right; margin-bottom: 10px;">
                                            <label class="control-label label-wizard" style="max-width: 200px;" for="email">الوقت</label>
                                            <asp:TextBox ID="txtTime_S" runat="server" CssClass="form-control text-wizard" placeholder="الوقت" MaxLength="300" ReadOnly="true" autocomplete="off"></asp:TextBox>
                                        </div>
                                        <div class="col-md-6" style="text-align: right; margin-bottom: 10px;">
                                            <label class="control-label label-wizard" style="max-width: 200px;" for="phone1">التاريخ</label>
                                            <asp:TextBox ID="txtStartDate_S" runat="server" CssClass="form-control d-inline-block" ReadOnly="true" autocomplete="off" Width="200px"></asp:TextBox>
                                            <div class="vr"></div>
                                            <asp:TextBox ID="txtEndDate_S" runat="server" CssClass="form-control d-inline-block" ReadOnly="true" autocomplete="off" Width="200px"></asp:TextBox>
                                        </div>
                                        <div class="col-md-6" style="text-align: right; margin-bottom: 10px;">
                                            <label class="control-label label-wizard" style="max-width: 200px;" for="phone2">العدد المتوقع</label>
                                            <asp:TextBox ID="txtExpectedNumber_S" runat="server" CssClass="form-control text-wizard" placeholder="العدد المتوقع" MaxLength="300" ReadOnly="true" autocomplete="off"></asp:TextBox>
                                        </div>
                                        <div class="col-md-6" style="text-align: right; margin-bottom: 10px;">
                                            <label class="control-label label-wizard" style="max-width: 200px;" for="phone3">مدتها</label>
                                            <asp:TextBox ID="txtDuration_S" runat="server" CssClass="form-control text-wizard" placeholder="مدتها" MaxLength="300" ReadOnly="true" autocomplete="off"></asp:TextBox>
                                        </div>
                                        <div class="col-md-6" style="text-align: right; margin-bottom: 10px;">
                                            <label class="control-label label-wizard" style="max-width: 200px;" for="JobName">كود القاعة</label>
                                            <asp:TextBox ID="txtRoomCode_S" runat="server" CssClass="form-control text-wizard" placeholder="كود القاعة" MaxLength="300" ReadOnly="true" autocomplete="off"></asp:TextBox>
                                        </div>
                                        <div class="col-md-6" style="text-align: right; margin-bottom: 10px;">
                                            <label class="control-label label-wizard" style="max-width: 200px;" for="JobRank">كود الدورة</label>
                                            <asp:TextBox ID="txtCourseCode_S" runat="server" CssClass="form-control text-wizard" placeholder="كود الدورة" MaxLength="300" ReadOnly="true" autocomplete="off"></asp:TextBox>
                                        </div>
                                        <div class="col-md-6" style="text-align: right; margin-bottom: 10px;">
                                            <label class="control-label label-wizard" style="max-width: 200px;" for="JobPlace">اسم المدرب</label>
                                            <asp:TextBox ID="txtLecturerName_S" runat="server" CssClass="form-control text-wizard" placeholder="اسم المدرب" MaxLength="300" ReadOnly="true" autocomplete="off"></asp:TextBox>
                                        </div>
                                        <div class="col-md-6" style="text-align: right; margin-bottom: 10px;">
                                            <label class="control-label label-wizard" style="max-width: 200px;" for="phone3">المتطلبات</label>
                                            <asp:TextBox ID="txtRequirements_S" runat="server" CssClass="form-control text-wizard" placeholder="المتطلبات" MaxLength="300" ReadOnly="true" autocomplete="off"></asp:TextBox>
                                        </div>
                                        <div class="col-md-6" style="text-align: right; margin-bottom: 10px;">
                                            <label class="control-label label-wizard" style="max-width: 200px;" for="phone3">اللغة</label>
                                            <asp:TextBox ID="txtLanguage_S" runat="server" CssClass="form-control text-wizard" placeholder="اللغة" MaxLength="300" ReadOnly="true" autocomplete="off"></asp:TextBox>
                                        </div>
                                        <div class="col-md-6" style="text-align: right; margin-bottom: 10px;">
                                            <label class="control-label label-wizard" style="max-width: 200px;" for="phone3">استخدام معمل الحاسب</label>
                                            <asp:TextBox ID="txtUseOfComputer_S" runat="server" CssClass="form-control text-wizard" placeholder="استخدام معمل الحاسب" MaxLength="300" ReadOnly="true" autocomplete="off"></asp:TextBox>
                                        </div>
                                        <div class="col-md-6" style="text-align: right; margin-bottom: 10px;">
                                            <label class="control-label label-wizard" style="max-width: 200px;" for="phone3">محاور الدورة</label>
                                            <asp:TextBox ID="txtCourseTopics_S" runat="server" CssClass="form-control text-wizard" placeholder="محاور الدورة" MaxLength="300" ReadOnly="true" autocomplete="off"></asp:TextBox>
                                        </div>
                                        <div class="col-md-6" style="text-align: right; margin-bottom: 10px;">
                                            <label class="control-label label-wizard" style="max-width: 200px;" for="phone3">ملاحظات</label>
                                            <asp:TextBox ID="txtNotes_S" runat="server" CssClass="form-control text-wizard" placeholder="ملاحظات" MaxLength="300" ReadOnly="true" autocomplete="off"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                        <div class="col-12 d-inline-flex py-1">
                            <asp:CheckBox ID="checkSureInfo" runat="server" CssClass="text-black fs-6 p-1" Text="الإقرار على أن جميع البيانات المدخلة بهذا الطلب صحيحة." />
                            <asp:Label ID="lblErrorCheckSure" runat="server" CssClass="error d-inline-block p-1 mx-3" Visible="false"></asp:Label>
                            <asp:Label ID="lblSendError" runat="server" CssClass="error p-1" Visible="false">الإقرار على أن جميع البيانات المدخلة بهذا الطلب صحيحة</asp:Label>
                        </div>
                        <div class="row-cols-6 text-center">
                            <asp:Button ID="BtnStepPrevious2" runat="server" CssClass="btn btn-primary w-auto" Text="السابق" OnClientClick="Loader()" OnClick="BtnStepPrevious2_Click" />
                            <div class="vr"></div>
                            <asp:Button ID="BtnSend" runat="server" Text="إرسال الطلب" CssClass="btn btn-primary w-auto" ValidationGroup="Send" OnClientClick="Loader()" OnClick="BtnSend_Click" />
                        </div>
                    </asp:View>
                </asp:MultiView>
            </div>
            
        </contenttemplate>
        <triggers>
            <asp:PostBackTrigger ControlID="BtnSearch" />
            <%--<asp:AsyncPostBackTrigger ControlID="BtnSearch" EventName="Click" />--%>
            <asp:PostBackTrigger ControlID="BtnResetSearch" />
            <%--<asp:AsyncPostBackTrigger ControlID="BtnResetSearch" EventName="Click" />--%>
            <asp:PostBackTrigger ControlID="BtnSaveNext2" />
            <%--<asp:AsyncPostBackTrigger ControlID="BtnSaveNext2" EventName="Click" />--%>
            <asp:PostBackTrigger ControlID="BtnStepPrevious1" />
            <%--<asp:AsyncPostBackTrigger ControlID="BtnStepPrevious1" EventName="Click" />--%>
            <asp:PostBackTrigger ControlID="BtnSaveNext3" />
            <%--<asp:AsyncPostBackTrigger ControlID="BtnSaveNext3" EventName="Click" />--%>
            <asp:PostBackTrigger ControlID="BtnStepPrevious2" />
            <%--<asp:AsyncPostBackTrigger ControlID="BtnStepPrevious2" EventName="Click" />--%>
            <asp:PostBackTrigger ControlID="BtnSend" />
            <%--<asp:AsyncPostBackTrigger ControlID="BtnSend" EventName="Click" />--%>
        </triggers>
    </asp:UpdatePanel>
</asp:Content>