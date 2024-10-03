<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewReservation.aspx.cs" Inherits="Smart_Reservation_Training_Classes.NewReservation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="myTaps">
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
    </div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <contenttemplate>
            <div class="row p-2">
                <div class="col">
                    <asp:Label ID="lblWizardError" runat="server" CssClass="error" Visible="false"></asp:Label>
                </div>
            </div>
            <asp:MultiView ID="MultiViewCard" runat="server" ActiveViewIndex="0">
                <asp:View ID="View1" runat="server">
                    <div style="text-align: center; padding: 5px;">
                        <asp:Button ID="BtnSaveNext2" runat="server" Text="حفظ و التالي" CssClass="btn btn-primary" OnClientClick="Loader()" OnClick="BtnSaveNext2_Click" />
                    </div>
                    <asp:Panel ID="SearchToolbarPanel" runat="server" CssClass="floatright" DefaultButton="BtnSearch">
                        <label class="label">تاريخ البداية : </label>
                        <asp:TextBox ID="txtSearchStartDate" runat="server" CssClass="form-control hijri-date-input d-inline-block" autocomplete="off" Width="200px"></asp:TextBox>
                        <label class="label">تاريخ النهاية : </label>
                        <asp:TextBox ID="txtSearchEndDate" runat="server" CssClass="form-control hijri-date-input d-inline-block" autocomplete="off" Width="200px"></asp:TextBox>
                        <asp:Button ID="BtnSearch" runat="server" Text="بحث" CssClass="btn btn-primary" OnClientClick="Loader()" OnClick="BtnSearch_Click" />
                        <asp:Button ID="BtnResetSearch" runat="server" Text="X" CssClass="btn btn-danger" OnClientClick="Loader()" Visible="False" OnClick="BtnResetSearch_Click" />
                    </asp:Panel>
                    <asp:Panel ID="ViewsPanel" runat="server" CssClass="mt-1">
                        <asp:GridView ID="gvRoomsAvailable" runat="server" CssClass="table table-bordered table-hover" DataKeyNames="RoomCode" HeaderStyle-BackColor="green" AutoGenerateColumns="False"
                            Font-Names="Arial" Font-Size="11pt" AlternatingRowStyle-BackColor="#C2D69B" AllowPaging="True"
                            CellPadding="4" ForeColor="#333333" GridLines="None">
                            <Columns>
                                <asp:TemplateField>
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
                </asp:View>
                <asp:View ID="View2" runat="server">
                    
                            <div style="text-align: center; padding: 5px;">
                                <asp:Button ID="BtnStepPrevious1" runat="server" CssClass="btn btn-info" Text="السابق" OnClientClick="Loader()" OnClick="BtnStepPrevious1_Click" />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="BtnSaveNext3" runat="server" Text="حفظ و التالي" CssClass="btn btn-primary" OnClientClick="Loader()" OnClick="BtnSaveNext3_Click" />
                            </div>
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <asp:HiddenField ID="hfReservationID" runat="server" />
                            <asp:Table ID="tblDataReservation" runat="server" CssClass="table table-responsive-lg">
                                <%--<asp:TableRow CssClass="forms-input-row">
                                    <asp:TableCell>
                                        <label class="forms-input-label">نوع الطرح</label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" CssClass="form-check form-check-inline">
                                            <asp:ListItem Value="دورة تدريبية">دورة تدريبية</asp:ListItem>
                                            <asp:ListItem Value="برنامج تدريبي">برنامج تدريبي</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <label class="forms-input-label">نوع الدورة</label>
                                    </asp:TableCell>
                                    <asp:TableCell>
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
                                </asp:TableRow>--%>
                                <asp:TableRow CssClass="forms-input-row">
                                    <asp:TableCell>
                                        <label class="forms-input-label">الفئة المستهدفة</label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtTargetGroup" runat="server" CssClass="form-control"></asp:TextBox>
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
                                        <asp:TextBox ID="txtStartDate" runat="server" CssClass="form-control d-inline-block" placeholder="تاريخ البدية"></asp:TextBox>
                                        <asp:TextBox ID="txtEndDate" runat="server" CssClass="form-control d-inline-block" placeholder="تاريخ النهاية"></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>

                                <asp:TableRow CssClass="forms-input-row">
                                    <asp:TableCell>
                                        <label class="forms-input-label">العدد المتوقع</label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtExpectedNumber" runat="server" CssClass="form-control"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <label class="forms-input-label">مدتها</label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtDuration" runat="server" CssClass="form-control"></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>

                                <asp:TableRow CssClass="forms-input-row">
                                    <asp:TableCell>
                                        <label class="forms-input-label">كود القاعة</label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtRoomCode" runat="server" CssClass="form-control"></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>

                                <asp:TableRow CssClass="forms-input-row">
                                    <asp:TableCell>
                                        <label class="forms-input-label">اسم المدرب</label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtLecturerName" runat="server" CssClass="form-control textarea"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <label class="forms-input-label">المتطلبات</label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtRequirements" runat="server" CssClass="form-control textarea"></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>

                                <asp:TableRow CssClass="forms-input-row">
                                    <asp:TableCell>
                                        <label class="forms-input-label">اللغة</label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtLanguage" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RadioButtonList ID="RblLanguage" runat="server" CssClass="form-check form-check-inline">
                                            <asp:ListItem Value="عربي">عربي</asp:ListItem>
                                            <asp:ListItem Value="إنجليزي">إنجليزي</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <label class="forms-input-label">استخدام معمل الحاسب</label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:RadioButtonList ID="RblUseOfComputer" runat="server" CssClass="form-check form-check-inline">
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
                                        <asp:TextBox ID="txtCourseTopics" runat="server" CssClass="form-control textarea"></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow CssClass="forms-input-row">
                                    <asp:TableCell>
                                        <label class="forms-input-label">ملاحظات</label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtNotes" runat="server" CssClass="form-control textarea"></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </div>
                    </div>
                </asp:View>
                <asp:View ID="View3" runat="server">
                    <div class="card">
                        <div class="col-12" style="text-align: right; display: flex; padding-top: 8px;">
                            <asp:CheckBox ID="checkSureInfo" runat="server" AutoPostBack="True" CssClass="required" Style="color: red; margin-right: 15px;" />
                            <p style="color: red; font-size: 90%; margin-right: 2px;">الإقرار على أن جميع البيانات المدخلة بهذا الطلب صحيحة.</p>
                            <asp:Label ID="lblErrorCheckSure" runat="server" CssClass="error d-inline-block" Visible="false"></asp:Label>
                        </div>
                        <div class="col-12" style="text-align: right;">
                            <asp:Label ID="lblSendError" runat="server" ForeColor="Red" Visible="false" Style="text-align: center; padding: 10px;"></asp:Label>
                        </div>
                        <div style="text-align: center; padding: 5px;">
                            <asp:Button ID="BtnStepPrevious2" runat="server" CssClass="btn btn-info" Text="السابق" OnClientClick="Loader()" OnClick="BtnStepPrevious2_Click" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="BtnSend" runat="server" Text="إرسال الطلب" CssClass="btn btn-primary" ValidationGroup="Send" OnClientClick="Loader()" OnClick="BtnSend_Click" />
                        </div>
                        <asp:Panel ID="Panel1" runat="server" CssClass="mt-1">
                        </asp:Panel>
                    </div>
                </asp:View>
            </asp:MultiView>
            
        </contenttemplate>
        <triggers>
            <asp:PostBackTrigger ControlID="BtnSearch" />
            <asp:PostBackTrigger ControlID="BtnResetSearch" />
            <asp:PostBackTrigger ControlID="BtnSaveNext2" />
            <asp:PostBackTrigger ControlID="BtnStepPrevious1" />
            <asp:PostBackTrigger ControlID="BtnSaveNext3" />
            <asp:PostBackTrigger ControlID="BtnStepPrevious2" />
            <%--<asp:PostBackTrigger ControlID="BtnSend" />--%>
        </triggers>
    </asp:UpdatePanel>
</asp:Content>