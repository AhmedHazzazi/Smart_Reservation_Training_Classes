﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Roles.aspx.cs" Inherits="Smart_Reservation_Training_Classes.Roles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="row p-1">
                <div class="col-sm-12">
                    <asp:Label ID="lblSuccess" runat="server" CssClass="success" Visible="false"></asp:Label>
                    <asp:Label ID="lblError" runat="server" CssClass="error" Visible="false"></asp:Label>
                </div>
            </div>
            <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                <asp:View ID="View1" runat="server">
                    <div class="d-grid gap-2 d-md-block">
                        <asp:Button ID="BtnAddUser" runat="server" Text="إضافة جديد" CssClass="btn btn-success" OnClientClick="Loader()" OnClick="BtnAddUser_Click" />
                        <%--<asp:Button ID="BtnEditUser" runat="server" Text="تعديل" CssClass="btn btn-info" OnClientClick="Loader()" />--%>
                    </div>
                    <asp:Panel ID="SearchPanel" runat="server" CssClass="" DefaultButton="BtnSearch">
                        <label class="label">البحث : </label>
                        <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control d-inline-block" autocomplete="off" Width="200px"></asp:TextBox>
                        <asp:Button ID="BtnSearch" runat="server" Text="بحث" CssClass="btn btn-primary m-1" OnClientClick="Loader()" OnClick="BtnSearch_Click" />
                        <asp:Button ID="BtnResetSearch" runat="server" Text="X" CssClass="btn btn-danger" OnClientClick="Loader()" Visible="False" OnClick="BtnResetSearch_Click" />
                    </asp:Panel>
                    <asp:Panel ID="ViewsPanel" runat="server" CssClass="m-1">
                        <asp:GridView ID="gvUsers" runat="server" CssClass="table table-bordered table-hover" DataKeyNames="UserID" HeaderStyle-BackColor="green" AutoGenerateColumns="False"
                            Font-Names="Arial" Font-Size="11pt" AlternatingRowStyle-BackColor="#C2D69B" AllowPaging="True"
                            CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCommand="gvUsers_RowCommand">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                        <asp:HiddenField ID="hfUserID" runat="server" Value='<%#Eval("UserID")%>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="10px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="UserID" HeaderText="UserID" Visible="false"></asp:BoundField>
                                <asp:BoundField DataField="Name" HeaderText="الإسم الكامل"></asp:BoundField>
                                <asp:BoundField DataField="UserName" HeaderText="اسم المستخدم"></asp:BoundField>
                                <asp:BoundField DataField="Email" HeaderText="البريد الإلكتروني"></asp:BoundField>
                                <asp:BoundField DataField="Role" HeaderText="نوع الصلاحية"></asp:BoundField>
                                <asp:TemplateField HeaderText=".....">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation="False" CommandName="Edited" OnClientClick="Loader();" CommandArgument='<%# Eval("UserID") + "," + Eval("UserName") %>'>
                                            <asp:Image ID="imgEdit" runat="server" ImageUrl="~/content/img/Edit.png" />
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="False" CommandName="Deleted" OnClientClick="javascript: return confirm('هل أنت متأكد من حذف الصلاحية من المستخدم ؟')" CommandArgument='<%# Eval("UserID") + "," + Eval("UserName") %>'>
                                            <asp:Image ID="imgRemove" runat="server" ImageUrl="~/content/img/Delete.png" />
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle Width="10px" />
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                            <EmptyDataTemplate>
                                لا يوجد بيانات!
                            </EmptyDataTemplate>
                            <RowStyle BackColor="#EFF3FB" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle CssClass="pagination" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <EditRowStyle BackColor="#2461BF" />
                        </asp:GridView>
                    </asp:Panel>
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <div class="row p-2 overflow-scroll">
                        <div class="row mb-3">
                            <label for="txtName" class="col-sm-3 col-form-label col-form-label-sm">الإسم الكامل</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="txtName" runat="server" CssClass="form-control form-control-sm" placeholder="الإسم الكامل"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="txtUserName" class="col-sm-3 col-form-label">اسم المستخدم</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control form-control-sm" placeholder="اسم المستخدم"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <label for="txtPassword" class="col-sm-3 col-form-label col-form-label-lg">كلمة المرور</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control form-control-sm" placeholder="كلمة المرور" TextMode="Password"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <label for="txtEmail" class="col-sm-3 col-form-label col-form-label-lg">البريد الإلكتروني</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control form-control-sm" placeholder="البريد الإلكتروني"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <label for="RblRole" class="col-sm-3 col-form-label col-form-label-lg">نوع الصلاحية</label>
                            <div class="col-sm-8">
                                <asp:RadioButtonList ID="RblRole" runat="server" CssClass="form-check  form-check-inline">
                                    <asp:ListItem Value="Admin">مسؤول النظام</asp:ListItem>
                                    <asp:ListItem Value="User">المستخدمين</asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-10">
                                <asp:Button ID="BtnSave" runat="server" Text="حفظ" CssClass="btn btn-primary" OnClientClick="Loader()" OnClick="BtnSave_Click" />
                                <asp:Button ID="BtnClose" runat="server" Text="إغلاق" CssClass="btn btn-danger" OnClientClick="Loader()" OnClick="BtnClose_Click" />
                            </div>
                        </div>
                    </div>
                </asp:View>
            </asp:MultiView>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="BtnAddUser" />
            <asp:PostBackTrigger ControlID="BtnSearch" />
            <asp:PostBackTrigger ControlID="BtnResetSearch" />
            <asp:PostBackTrigger ControlID="gvUsers" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>