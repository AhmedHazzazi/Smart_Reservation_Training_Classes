<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Smart_Reservation_Training_Classes.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Main Content Start -->
    <main class="mt-1 pt-3 px-5">
        <div class="row">
            <div class="col-md-12 fw-bold fs-3">الرئيسية</div>
        </div>
        <div class="row">
            <%--<div class="col-md-3 mb-3">
                <div class="card-box bg-danger">
                    <div class="box">
                        <i class="icon fa fa-users fa-4x" style="color: #FFF; text-align: center; width: 100%;">
                            <span style="color: #FFF; font-size: 18px;">إدارة الحجوزات</span>
                        </i>
                    </div>
                    <div class="card-bottom">
                        <asp:Button ID="FirstNext" runat="server" CssClass="btn btn-group-justified btn-light" Text="إستعراض" />
                    </div>
                </div>
            </div>--%>
            <div class="col-md-3 mb-3">
                <div class="card text-white bg-primary h-100">
                    <div class="card-header fw-bold">إدارة الحجوزات</div>
                    <div class="card-body">
                        <asp:Button ID="FirstNext" runat="server" CssClass="btn  btn-light" Text="إستعراض" />
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="card text-white bg-success h-100">
                    <div class="card-header fw-bold">Header</div>
                    <div class="card-body">
                        <h5 class="card-title">Primary card title</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="card text-white bg-warning h-100">
                    <div class="card-header fw-bold">Header</div>
                    <div class="card-body">
                        <h5 class="card-title">Primary card title</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="card text-white bg-danger h-100">
                    <div class="card-header fw-bold">Header</div>
                    <div class="card-body">
                        <h5 class="card-title">Primary card title</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    </div>
                </div>
            </div>
        </div>
    </main>
</asp:Content>