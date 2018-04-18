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
                <div class="dropdown driver">
                    <asp:Label runat="server" AssociatedControlID="ddlDriver" Text="Driver for Route: "></asp:Label>
                    <asp:DropDownList runat="server" ID="ddlDriver">
                        <asp:ListItem runat="server" Value="0" Text="Select A Driver:"></asp:ListItem>
                    </asp:DropDownList>
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
                    <asp:DropDownList runat="server" ID="ddlDrivers" OnTextChanged="ddlDrivers_OnSelectedIndexChanged" AutoPostBack="True"  >
                        <asp:ListItem runat="server" Value="0" Text="Select A Driver:"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="routes">
                    <asp:Label runat="server" ID="lblRoutes" AssociatedControlID="ddlRoutes" Text="Select Route: "></asp:Label>
                    <asp:DropDownList runat="server" ID="ddlRoutes">
                        <asp:ListItem runat="server" Value="0" Text="Select A Route:"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <br />
                <div class="button-section">
                    <asp:Button runat="server" ID="btnConfirmDriverMap" Text="View Map" Width="250" OnClick="btnConfirmDriverMap_OnClick" OnClientClick="btnConfirmDriverMap_OnClientClick()" />

                </div>
<%--                <div id="map" style="display: none;">

                </div>--%>
                <asp:HiddenField runat="server" ID="hfRouteID" />
            </asp:View>
        </asp:MultiView>
    </div>
<%--    <script>
        //function btnConfirmDriverMap_OnClick() {
        //    debugger;
        //    initMap();
        //}

        function initMap() {
            if ($('[id$="hfRouteID"]').val() > 0) {
                $('#map').show();

                const json = getJsonString();

                var map = new google.maps.Map(document.getElementById('map'), {
                    zoom: 13,
                    center: new google.maps.LatLng(json.center[0], json.center[1])
                });
            }
            //var _d = {
            //    routeID: $('[id$="hfRouteID"]').val()
            //}
            //$.ajax({
            //    type: 'GET',
            //    url: '/Handler/GetRoute.ashx', 
            //    data: _d,
            //    success: function (data) {
            //        console.log(data);
            //        debugger;
            //        var map = new google.maps.Map(document.getElementById('map'), {
            //            zoom: 12,
            //            center: new google.maps.LatLng(data.center[0], data.center[1])
            //        });




            //        //$('#map').show();
            //    }, 
            //    error: function (data) {
            //        console.log('error');
            //        debugger;
            //    }
            //});
        }

        function getJsonString() {
            var json;
            var _d = {
                routeID: $('[id$="hfRouteID"]').val()
            };

            $.ajax({
                type: 'GET',
                url: '/Handler/GetRoute.ashx',
                data: _d,
                success: function (data) {
                    console.log('success');
                    console.log(data);
                    debugger;
                },
                error: function (data) {
                    console.log('error');
                    console.log(data);
                    debugger;
                }
            });

            return json;
        }






        //function initMap() {

        //    var map = new google.maps.Map(document.getElementById('map'), {
        //        zoom: 17, 
        //        center: new google.maps.LatLng(41.8048, -77.0704)
        //    });

        //    const markers = getMarkers();

        //    for (destination of markers) {
        //        let marker = new google.maps.Marker({
        //            map: map,
        //            position: new google.maps.LatLng(destination.location[0], destination.location[1]),
        //            title: destination.name
        //        });
        //    }
        //}

        //function getMarkers() {  //TODO: implement ajax call to database with route id to return center and json string with markers.
        //    const markers = [
                //{
                //    name: 'Wellsboro Plaza', 
                //    location: [41.7487, -77.3005]
                //},
                //{
                //    name: 'Walmart Supercenter', 
                //    location: [41.7838, -77.0669]
                //}, 
                //{
                //    name: 'Lowes Home Improvement', 
                //    location: [41.7683, -77.0717]
                //}, 
                //{
                //    name: 'Harley Davidson', 
                //    location: [41.7612, -77.0797]
                //}, 
                //{
                //    name: 'Williamsport', 
                //    location: [41.2412, -77.0011]
                //}
        //    ];
        //    return markers;
        //}
    </script>--%>
    
</asp:Content>
