<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Driver.aspx.cs" Inherits="HazardAvoidanceSystem.Driver" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        .form{
            text-align: center;
        }
    </style>
    <div class="jumbotron">
        <h1>Hello, Driver</h1>
    </div>

    <div class="form">
        <asp:Label runat="server" AssociatedControlID="ddlRoutes">Please Confirm Your Route:</asp:Label>
        <asp:DropDownList runat="server" ID="ddlRoutes" >
            <asp:ListItem runat="server" Value="0" Text="Choose A Route"></asp:ListItem>
            <asp:ListItem runat="server" Value="1" Text="Route 1"></asp:ListItem>
            <asp:ListItem runat="server" Value="2" Text="Route 2"></asp:ListItem>
            <asp:ListItem runat="server" Value="3" Text="Route 3"></asp:ListItem>
            <asp:ListItem runat="server" Value="4" Text="Route 4"></asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        <div class="button-section">
            <asp:Button runat="server" ID="btnConfirmRoute" Text="Confirm Route" OnClick="btnConfirmRoute_OnClick" />
            <asp:Button runat="server" ID="btnUploadRoute" Text="Upload New Route" OnClick="btnUploadRoute_OnClick" />
        </div>
    </div>
</asp:Content>
