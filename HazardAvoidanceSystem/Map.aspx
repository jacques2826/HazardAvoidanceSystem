<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Map.aspx.cs" Inherits="HazardAvoidanceSystem.Map" %>


<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <style type="text/css">
        #map {
            height: 800px;
            width: 100%;
        }
            .settings{
                text-align:center; 
                align-content: center;
            }
    </style>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC_WL2E1OG9DneHA28oomrnOdQKCLpRQpU&callback=initMap" type="text/javascript"></script>
    
        <div id="map" class="map">

        </div>
    <asp:HiddenField runat="server" ID="hfRouteID" />

    <asp:HiddenField runat="server" ID="mapKey" />

    <script>
        function initMap() {
            var _d = {
                routeID: $('[id$="hfRouteID"]').val()
            };
            $.ajax({
                type: 'GET',
                url: '/Handler/GetRoute.ashx',
                data: _d,
                success: function (data) {
                    var json = JSON.parse(data);
                    var map = new google.maps.Map(document.getElementById('map'), {
                        zoom: 10, 
                        center: new google.maps.LatLng(json.center[0], json.center[1])
                    });

                    json.markers.forEach(function(element) {
                        element = new google.maps.Marker({
                            map: map,
                            position: new google.maps.LatLng(element.location[0], element.location[1]),
                            title: element.name,
                        });
                    });

                    if (json.hazards) {
                        json.hazards.forEach(function (element) {
                            element = new google.maps.Marker({
                                map: map,
                                position: new google.maps.LatLng(element.location[0], element.location[1]),
                                title: element.name,
                                animation: google.maps.Animation.BOUNCE
                            });
                        });
                    }
                },
                error: function (data) {
                    console.log('Error ' + data);
                }
            });
        }
    </script>
<%--    <script src="/Scripts/Map.js" type="text/javascript"></script>--%>
</asp:Content>
