<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Rooms.aspx.cs" Inherits="Smart_Reservation_Training_Classes.Rooms" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="row text-center p-1">
                <div class="col-sm-12">
                    <asp:Label ID="lblSuccess" runat="server" CssClass="success" Visible="false"></asp:Label>
                    <asp:Label ID="lblError" runat="server" CssClass="error" Visible="false"></asp:Label>
                </div>
            </div>
            <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                <asp:View ID="View1" runat="server">
                    <div class="d-grid gap-2 d-md-block">
                        <asp:Button ID="BtnAddRoom" runat="server" Text="إضافة قاعة" CssClass="btn btn-success" OnClientClick="Loader()" OnClick="BtnAddRoom_Click" />
                    </div>
                    <asp:Panel ID="SearchPanel" runat="server" CssClass="" DefaultButton="BtnSearch">
                        <label class="label">البحث : </label>
                        <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control d-inline-block" autocomplete="off" Width="200px"></asp:TextBox>
                        <asp:Button ID="BtnSearch" runat="server" Text="بحث" CssClass="btn btn-primary m-1" OnClientClick="Loader()" OnClick="BtnSearch_Click" />
                        <asp:Button ID="BtnResetSearch" runat="server" Text="X" CssClass="btn btn-danger" OnClientClick="Loader()" Visible="False" OnClick="BtnResetSearch_Click" />
                    </asp:Panel>
                    <asp:Panel ID="ViewsPanel" runat="server" CssClass="m-1">
                        <asp:GridView ID="gvRooms" runat="server" CssClass="table table-bordered table-hover" DataKeyNames="RoomCode" HeaderStyle-BackColor="green" AutoGenerateColumns="False"
                            Font-Names="Arial" Font-Size="11pt" AlternatingRowStyle-BackColor="#C2D69B" AllowPaging="True"
                            CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCommand="gvRoomsAvailable_RowCommand">
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
                                <asp:TemplateField HeaderText=".....">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation="False" CommandName="Edited" OnClientClick="Loader();" CommandArgument='<%# Eval("UserID") %>'>
                                            <asp:Image ID="imgEdit" runat="server" ImageUrl="~/content/img/Edit.png" />
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="False" CommandName="Deleted" OnClientClick="javascript: return confirm('هل أنت متأكد من حذف الصلاحية من المستخدم ؟')" CommandArgument='<%# Eval("UserID") %>'>
                                            <asp:Image ID="imgRemove" runat="server" ImageUrl="~/content/img/Delete.png" />
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle Width="10px" />
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                            <EmptyDataTemplate>
                                لا يوجد قاعات تدريبية!
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
                    <form>
                        <div class="text-info fs-5 p-3">إضافة - تعديل قاعة تدريبية</div>
                        <div class="form-group row mb-3">
                            <label class="col-sm-1 col-form-label">كود القاعة</label>
                            <div class="col-sm-4">
                                <asp:TextBox ID="txtRoomCode" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row mb-3">
                            <label class="col-sm-1 col-form-label">اسم القاعة</label>
                            <div class="col-sm-4">
                                <asp:TextBox ID="txtRoomName" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row mb-3">
                            <label class="col-sm-1 col-form-label">نوع القاعة</label>
                            <div class="col-sm-4">
                                <asp:DropDownList ID="DDLRoomType" runat="server" CssClass="dropdown dropdown-item dropdown-item-text">
                                    <asp:ListItem Value="" Selected="True">-- أختر --</asp:ListItem>
                                    <asp:ListItem Value="قاعة معمل حاسب">قاعة معمل حاسب</asp:ListItem>
                                    <asp:ListItem Value="قاعة محاضرات عادية">قاعة محاضرات عادية</asp:ListItem>
                                    <asp:ListItem Value="قاعة طاولة مستديرة">قاعة طاولات مستديرة</asp:ListItem>
                                    <asp:ListItem Value="قاعة طاولة على شكل حرف U">قاعة طاولة على شكل حرف U</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group row mb-3">
                            <label class="col-sm-1 col-form-label">مكان القاعة</label>
                            <div class="col-sm-4">
                                <asp:TextBox ID="txtRoomLocation" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row mb-3">
                            <label class="col-sm-1 col-form-label">سعة القاعة</label>
                            <div class="col-sm-4">
                                <asp:TextBox ID="txtRoomCapacity" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row mb-3">
                            <div class="col-sm-10">
                                <asp:Button ID="BtnSave" runat="server" Text="حفظ" CssClass="btn btn-primary" OnClientClick="Loader()" OnClick="BtnSave_Click" />
                            </div>
                        </div>
                    </form>
                </asp:View>
            </asp:MultiView>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="BtnSave" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>