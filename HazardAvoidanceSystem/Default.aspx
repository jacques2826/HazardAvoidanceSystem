<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HazardAvoidanceSystem._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        .form{
            text-align: center;
        }
    </style>
    <div class="jumbotron">
        <h1>Login</h1>
    </div>

    <div class="form">
        <table class="table" id="loginTable">
            <tr>
                <td>
                    <%--<asp:Label runat="server" AssociatedControlID="txtEmail" Text="E-Mail:"></asp:Label>--%>
                    E-Mail:
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txtEmail" Required="True"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <%--<asp:Label runat="server" AssociatedControlID="txtPassword" Text="Password:"></asp:Label>--%>
                    Password:
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txtPassword" Required="True" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
        </table>
        <div class="button-section">
            <asp:Button runat="server" ID="btnLogin" Text="Login" OnClick="btnLogin_OnClick" Width="200" Height="30" />
            <asp:Button runat="server" ID="btnClear" Text="Clear Information" Width="200" Height="30" />
        </div>
    </div>

</asp:Content>
