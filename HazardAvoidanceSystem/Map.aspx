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
                        zoom: 12, 
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
                    var myPath = []; 
                    for (var i = 0; i < json.markers.length; i++) {
                        var path = new google.maps.LatLng(json.markers[i].location[0], json.markers[i].location[1]);
                        myPath.push(path);
                    }

                    var flightPath = new google.maps.Polyline({
                        path: myPath,
                        geodesic: true,
                        strokeColor: '#ff0000',
                        strokeOpacity: 1,
                        strokeWeight: 2
                    });
                    flightPath.setMap(map);
                },
                error: function (data) {
                    console.log('Error ' + data);
                }
            });
        }
    </script>
</asp:Content>
