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
                        <asp:Panel ID="SearchToolbarPanel" runat="server" CssClass="pb-2" DefaultButton="BtnSearch">
                            <label class="label">تاريخ البداية : </label>
                            <asp:TextBox ID="txtSearchStartDate" runat="server" CssClass="form-control hijri-date-input d-inline-block" autocomplete="off" Width="200px"></asp:TextBox>
                            <label class="label">تاريخ النهاية : </label>
                            <asp:TextBox ID="txtSearchEndDate" runat="server" CssClass="form-control hijri-date-input d-inline-block" autocomplete="off" Width="200px"></asp:TextBox>
                            <asp:Button ID="BtnSearch" runat="server" Text="بحث" CssClass="btn btn-primary w-auto" OnClientClick="Loader()" OnClick="BtnSearch_Click" />
                            <asp:Button ID="BtnResetSearch" runat="server" Text="X" CssClass="btn btn-danger w-auto" OnClientClick="Loader()" Visible="False" OnClick="BtnResetSearch_Click" />
                        </asp:Panel>
                        <asp:Panel ID="ViewsPanel" runat="server" CssClass="mt-1">
                            <asp:GridView ID="gvRoomsAvailable" runat="server" CssClass="table table-bordered table-hover" DataKeyNames="RoomCode" AutoGenerateColumns="False"
                                AlternatingRowStyle-BackColor="#C2D69B" AllowPaging="True" CellPadding="4" GridLines="None">
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
                        </asp:Panel>
                        <div class="row-cols-6 text-center">
                            <asp:Button ID="BtnSaveNext2" runat="server" Text="التالي" CssClass="btn btn-info w-auto" OnClientClick="Loader();" OnClick="BtnSaveNext2_Click" />
                        </div>
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <asp:HiddenField ID="hfReservationID" runat="server" />
                                <asp:Table ID="tblDataReservation" runat="server" CssClass="table table-responsive-lg">
                                    <%--<asp:TableRow CssClass="forms-input-row">
                                    <asp:TableCell>
                                        <label class="forms-input-label">نوع الطرح</label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                                            <asp:ListItem Value="دورة تدريبية">دورة تدريبية</asp:ListItem>
                                            <asp:ListItem Value="برنامج تدريبي">برنامج تدريبي</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <label class="forms-input-label">نوع الدورة</label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="dropdownLists">
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
                                </asp:TableRow>--%>
                                    <asp:TableRow CssClass="forms-input-row">
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
                                            <asp:TextBox ID="txtImplementingEntity" runat="server" CssClass="form-control"></asp:TextBox>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                        <label class="forms-input-label">الجهة المستفيدة</label>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:TextBox ID="txtBeneficiaryEntity" runat="server" CssClass="form-control"></asp:TextBox>
                                        </asp:TableCell>
                                    </asp:TableRow>

                                    <asp:TableRow CssClass="forms-input-row">
                                        <asp:TableCell>
                                        <label class="forms-input-label">الوقت</label>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:TextBox ID="txtTime" runat="server" CssClass="form-control"></asp:TextBox>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                        <label class="forms-input-label">التاريخ</label>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:TextBox ID="txtStartDate" runat="server" CssClass="form-control hijri-date-input d-inline-block" autocomplete="off" Width="200px"></asp:TextBox>
                                            <div class="vr"></div>
                                            <asp:TextBox ID="txtEndDate" runat="server" CssClass="form-control hijri-date-input d-inline-block" autocomplete="off" Width="200px"></asp:TextBox>
                                        </asp:TableCell>
                                    </asp:TableRow>

                                    <asp:TableRow CssClass="forms-input-row">
                                        <asp:TableCell>
                                        <label class="forms-input-label">العدد المتوقع</label>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:TextBox ID="txtExpectedNumber" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                        <label class="forms-input-label">مدتها</label>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:TextBox ID="txtDuration" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox>
                                        </asp:TableCell>
                                    </asp:TableRow>

                                    <asp:TableRow CssClass="forms-input-row">
                                        <asp:TableCell>
                                        <label class="forms-input-label">كود القاعة</label>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:TextBox ID="txtRoomCode" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                        <label class="forms-input-label">كود الدورة</label>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:TextBox ID="txtCourseCode" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox>
                                        </asp:TableCell>
                                    </asp:TableRow>

                                    <asp:TableRow CssClass="forms-input-row">
                                        <asp:TableCell>
                                        <label class="forms-input-label">اسم المدرب</label>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:TextBox ID="txtLecturerName" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                        <label class="forms-input-label">المتطلبات</label>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:TextBox ID="txtRequirements" runat="server" CssClass="form-control" autocomplete="off" TextMode="MultiLine"></asp:TextBox>
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
                                            <asp:TextBox ID="txtCourseTopics" runat="server" CssClass="form-control" autocomplete="off" TextMode="MultiLine"></asp:TextBox>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                        <label class="forms-input-label">ملاحظات</label>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:TextBox ID="txtNotes" runat="server" CssClass="form-control" autocomplete="off" TextMode="MultiLine"></asp:TextBox>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </div>
                        </div>
                        <div class="row-cols-6 text-center">
                            <asp:Button ID="BtnStepPrevious1" runat="server" CssClass="btn btn-info w-auto" Text="السابق" OnClientClick="Loader()" OnClick="BtnStepPrevious1_Click" />
                            <div class="vr"></div>
                            <asp:Button ID="BtnSaveNext3" runat="server" Text="التالي" CssClass="btn btn-info w-auto" OnClientClick="Loader()" OnClick="BtnSaveNext3_Click" />
                        </div>
                    </asp:View>
                    <asp:View ID="View3" runat="server">
                        <div class="card py-2">
                            <asp:Panel ID="Panel1" runat="server" CssClass="mt-1">
                                <asp:FormView ID="FormView1" runat="server"></asp:FormView>
                            </asp:Panel>
                            <div class="col-12 d-inline-flex py-1">
                                <asp:CheckBox ID="checkSureInfo" runat="server" CssClass="text-black fs-6 p-1" Text="الإقرار على أن جميع البيانات المدخلة بهذا الطلب صحيحة." />
                                <asp:Label ID="lblErrorCheckSure" runat="server" CssClass="error d-inline-block p-1 mx-3" Visible="false"></asp:Label>
                                <asp:Label ID="lblSendError" runat="server" CssClass="error p-1" Visible="false">الإقرار على أن جميع البيانات المدخلة بهذا الطلب صحيحة</asp:Label>
                            </div>
                            <div class="row-cols-6 text-center">
                                <asp:Button ID="BtnStepPrevious2" runat="server" CssClass="btn btn-info w-auto" Text="السابق" OnClientClick="Loader()" OnClick="BtnStepPrevious2_Click" />
                                <div class="vr"></div>
                                <asp:Button ID="BtnSend" runat="server" Text="إرسال الطلب" CssClass="btn btn-info w-auto" ValidationGroup="Send" OnClientClick="Loader()" OnClick="BtnSend_Click" />
                            </div>
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