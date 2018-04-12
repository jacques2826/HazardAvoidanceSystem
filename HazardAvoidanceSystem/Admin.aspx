<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="HazardAvoidanceSystem.Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style type="text/css">
        .sidebar{
            float: left;
            width: 30%; 
            text-align: center;
        }
    </style>

    <div class="jumbotron">
        <h1>Hello, Admin</h1>
    </div>

    <div class="sidebar">
        <div class="label">
            <h3 style="color: black;">Choose an Option:</h3>
        </div>

        <div class="button-section">
            <asp:Button runat="server" ID="btnAddManager" Text="New Manager" OnClick="btnAddManager_OnClick" Width="300" Height="50" />
            <br />
            <br />
            <asp:Button runat="server" ID="btnAddDriver" Text="New Driver" OnClick="btnAddDriver_OnClick" Width="300" Height="50" />
            <br />
            <br />
            <asp:Button runat="server" ID="btnBackup" Text="Backup Database" OnClick="btnBackup_OnClick" Width="300" Height="50" />
            <br />
            <br />
            <asp:Button runat="server" ID="btnTestRoute" Text="Test Route" OnClick="btnTestRoute_OnClick" Width="300" Height="50" />
        </div>
    </div>

    <div class="main">
        <asp:MultiView runat="server" ID="mvOptions">
            <asp:View runat="server" ID="viewAddManager"> <%--TODO: add seperate divs to each field for better UI--%>
                <div class="form">
                    <asp:Label runat="server" AssociatedControlID="txtManagerID" Text="Manager ID: "></asp:Label>
                    <asp:TextBox runat="server" ID="txtManagerID" Required="True"></asp:TextBox>
                    <br />
                    <asp:Label runat="server" AssociatedControlID="txtManagerFirst" Text="First Name: "></asp:Label>
                    <asp:TextBox runat="server" ID="txtManagerFirst" Required="True"></asp:TextBox>
                    <br />
                    <asp:Label runat="server" AssociatedControlID="txtManagerLast" Text="Last Name: "></asp:Label>
                    <asp:TextBox runat="server" ID="txtManagerLast" Required="True"></asp:TextBox>
                    <br />
                    <asp:Label runat="server" AssociatedControlID="txtManagerEmail" Text="Email: "></asp:Label>
                    <asp:TextBox runat="server" ID="txtManagerEmail" Required="True"></asp:TextBox>

                    <asp:Button runat="server" ID="btnAddManagerConfirm" Text="Confirm New Manager" OnClick="btnAddManagerConfirm_OnClick" />
                </div>
            </asp:View>
            <asp:View runat="server" ID="viewAddDriver"> <%--TODO: add seperate divs to each field for better UI--%>
                <div class="form">
                    <asp:Label runat="server" AssociatedControlID="txtDriverID" Text="Driver ID: "></asp:Label>
                    <asp:TextBox runat="server" ID="txtDriverID" Required="True"></asp:TextBox>
                    <br />
                    <asp:Label runat="server" AssociatedControlID="txtDriverFirst" Text="First Name: "></asp:Label>
                    <asp:TextBox runat="server" ID="txtDriverFirst" Required="True"></asp:TextBox>
                    <br />
                    <asp:Label runat="server" AssociatedControlID="txtDriverLast" Text="Last Name: "></asp:Label>
                    <asp:TextBox runat="server" ID="txtDriverLast" Required="True"></asp:TextBox>
                    <br />
                    <asp:Label runat="server" AssociatedControlID="txtDriverEmail" Text="Email: "></asp:Label>
                    <asp:TextBox runat="server" ID="txtDriverEmail" Required="True"></asp:TextBox>
                    <br />
                    <asp:Label runat="server" AssociatedControlID="ddlManagerID" Text="Manager: "></asp:Label>
                    <asp:DropDownList runat="server" ID="ddlManagerID">
                        <asp:ListItem runat="server" Value="0" Text="Select A Manager: "></asp:ListItem>
                    </asp:DropDownList>

                    <asp:Button runat="server" ID="btnAddDriverConfirm" Text="Confirm New Driver" OnClick="btnAddDriverConfirm_OnClick" />
                </div>
            </asp:View>
            <asp:View runat="server" ID="viewBackup">

            </asp:View>
            <asp:View runat="server" ID="viewTestRoute">

            </asp:View>
        </asp:MultiView>
    </div>

</asp:Content>
