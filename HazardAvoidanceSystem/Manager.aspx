<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Manager.aspx.cs" Inherits="HazardAvoidanceSystem.Manager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC_WL2E1OG9DneHA28oomrnOdQKCLpRQpU&callback=initMap" type="text/javascript"></script>
    <style type="text/css">
        .sidebar{
            float: left;
            width: 30%;
            text-align: center;
        }
        .main{
            
        }
        #map{
            margin-left: 30%;
            margin-top: 25px;
            height: 800px; 
            width: 70%;
        }
    </style>

    <div class="jumbotron">
        <h1>Hello, Manager</h1>
    </div>

    <div class="sidebar">
        <div class="label">
            <h3 style="color: black;">Choose an Option:</h3>
        </div>
        <div class="button-section">
            <asp:Button runat="server" ID="btnUploadRoute" Text="Upload New Route" OnClick="btnUploadRoute_OnClick" Width="300" Height="50" />
            <br />
            <br />
            <asp:Button runat="server" ID="btnChooseDriver" Text="Choose Driver" OnClick="btnChooseDriver_OnClick" Width="300" Height="50" />
            <br />
            <br />
            <asp:Button runat="server" ID="btnChangeRoute" Text="Update A Route" OnClick="btnChangeRoute_OnClick" Width="300" Height="50" />
            <br />
            <br />
            <asp:Button runat="server" ID="btnSeeRoute" Text="View A Driver's Route" OnClick="btnSeeRoute_OnClick" Width="300" Height="50" />
        </div>
    </div>

    <div class="main">
        <asp:MultiView runat="server" ID="mvOptions">
            <asp:View runat="server" ID="viewUploadRoute">
                <div class="file upload">
                    <asp:Label runat="server" AssociatedControlID="fileNewRoute" Text="Upload New Route(.txt only)"></asp:Label>
                    <asp:FileUpload runat="server" ID="fileNewRoute" />
                </div>
                <br />
                <div class="text name">
                    <asp:Label runat="server" AssociatedControlID="txtName" Text="Optional Name for Route:" ></asp:Label>
                    <asp:TextBox runat="server" ID="txtName"></asp:TextBox>
                </div>
                <div class="dropdown driver">
                    <asp:Label runat="server" AssociatedControlID="txtDriver" Text="Optional Driver for Route: "></asp:Label>
                    <asp:TextBox runat="server" ID="txtDriver"></asp:TextBox>
                </div>
                <br />
                <br />
                <div class="button-section">
                    <asp:Button runat="server" ID="btnConfirmUpload" Text="Confirm Upload" Width="250" OnClick="btnConfirmUpload_OnClick" />
                </div>
                <div class="message" style="display: none;">
                    <h4 class="success">Route has been successfully uploaded.</h4>
                </div>
            </asp:View>
            <asp:View runat="server" ID="viewChooseDriver">
                <h3>Choose Driver</h3>
            </asp:View>
            <asp:View runat="server" ID="viewChangeRoute">
                <h3>Change Route</h3>
            </asp:View>
            <asp:View runat="server" ID="viewSeeRoute">
                <div class="driver">
                    <asp:Label runat="server" AssociatedControlID="ddlDrivers" Text="Select Driver: " ></asp:Label>
                    <asp:DropDownList runat="server" ID="ddlDrivers" OnSelectedIndexChanged="ddlDrivers_OnSelectedIndexChanged" >
                        <asp:ListItem runat="server" Value="0" Text="Select A Driver:"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="routes">
                    <asp:Label runat="server" AssociatedControlID="ddlRoutes" Text="Select Route: "></asp:Label>
                    <asp:DropDownList runat="server" ID="ddlRoutes">
                        <asp:ListItem runat="server" Value="0" Text="Select A Route:"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <br />
                <div class="button-section">
                    <asp:Button runat="server" ID="btnConfirmDriverMap" Text="View Map" Width="250" OnClick="btnConfirmDriverMap_OnClick" />
                </div>
                <div id="map">

                </div>
                <asp:HiddenField runat="server" ID="hfRouteID" />
            </asp:View>
        </asp:MultiView>
    </div>
    <script>
        function initMap() {
            var center = new google.maps.LatLng(41.8048, -77.0704);
            var destinationOne = new google.maps.LatLng(41.8039, -77.0727);
            var destinationTwo = new google.maps.LatLng(41.8117, -77.0811);
            var destinationThree = new google.maps.LatLng(41.8069, -77.0780);
            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 17,
                center: center
            });
            var marker = new google.maps.Marker({
                position: center,
                map: map
            });
            var markerTwo = new google.maps.Marker({
                position: destinationOne,
                map: map
            });
            var markerTwo = new google.maps.Marker({
                position: destinationTwo,
                map: map
            });
            var markerThree = new google.maps.Marker({
                position: destinationThree,
                map: map
            });
        }
    </script>
    
</asp:Content>
