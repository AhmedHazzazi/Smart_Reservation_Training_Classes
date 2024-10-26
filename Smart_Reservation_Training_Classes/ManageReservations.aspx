<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageReservations.aspx.cs" Inherits="Smart_Reservation_Training_Classes.ManageReservations" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="SearchPanel" runat="server" CssClass="" DefaultButton="BtnSearch">
        <label class="label">البحث : </label>
        <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control d-inline-block" autocomplete="off" Width="200px"></asp:TextBox>
        <asp:Button ID="BtnSearch" runat="server" Text="بحث" CssClass="btn btn-primary m-1" OnClientClick="Loader()" OnClick="BtnSearch_Click" />
        <asp:Button ID="BtnResetSearch" runat="server" Text="X" CssClass="btn btn-danger" OnClientClick="Loader()" Visible="False" OnClick="BtnResetSearch_Click" />
        <asp:Label ID="lblError" runat="server" CssClass="error" Visible="false"></asp:Label>
    </asp:Panel>
    <asp:Panel ID="ViewsPanel" runat="server" CssClass="m-1">
        <asp:GridView ID="gvReservations" runat="server" CssClass="table table-bordered table-hover" DataKeyNames="ReservationID"
            AutoGenerateColumns="False" AllowPaging="True" OnRowDataBound="gvReservations_RowDataBound" OnPageIndexChanging="gvReservations_PageIndexChanging">
            <Columns>
                <asp:TemplateField HeaderText="#">
                    <ItemTemplate>
                        <%# Container.DataItemIndex + 1 %>
                    </ItemTemplate>
                    <ItemStyle Width="10px" />
                </asp:TemplateField>
                <asp:BoundField DataField="ReservationID" HeaderText="رقم الحجز"></asp:BoundField>
                <asp:BoundField DataField="Name" HeaderText="الإسم"></asp:BoundField>
                <asp:BoundField DataField="RoomName" HeaderText="القاعة"></asp:BoundField>
                <asp:BoundField DataField="Email" HeaderText="الدورة"></asp:BoundField>
                <asp:BoundField DataField="Status" HeaderText="الحالة"></asp:BoundField>
                <asp:HyperLinkField HeaderText="التفاصيل" Text="عرض" DataNavigateUrlFields="ReservationID" DataNavigateUrlFormatString="ViewReservations.aspx?ReservationID={0}" ControlStyle-CssClass="btn btn-primary" Target="_self" />
                <asp:TemplateField HeaderText=".....">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="False" CommandName="Deleted" OnClientClick="javascript: return confirm('هل أنت متأكد من حذف بيانات الحجز ؟')" CommandArgument='<%# Eval("ReservationID") %>'>
                            <asp:Image ID="imgRemove" runat="server" ImageUrl="~/content/img/Delete.png" />
                        </asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle Width="10px" />
                </asp:TemplateField>
            </Columns>
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
            <EmptyDataTemplate>
                <div class="alert alert-danger">لا يوجد بيانات</div>
            </EmptyDataTemplate>
            <RowStyle BackColor="#EFF3FB" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle CssClass="pagination" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <EditRowStyle BackColor="#2461BF" />
        </asp:GridView>
    </asp:Panel>
</asp:Content>