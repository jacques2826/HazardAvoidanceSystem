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

    <asp:HiddenField runat="server" ID="mapKey" />

    <script>
        function initMap() {

            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 17, 
                center: new google.maps.LatLng(41.8048, -77.0704)
            });

            const markers = getMarkers();

            for (destination of markers) {
                let marker = new google.maps.Marker({
                    map: map,
                    position: new google.maps.LatLng(destination.location[0], destination.location[1]),
                    title: destination.name
                });
            }
            //var center = new google.maps.LatLng(41.8048, -77.0704);
            //var destinationOne = new google.maps.LatLng(41.8039, -77.0727);
            //var destinationTwo = new google.maps.LatLng(41.8117, -77.0811);
            //var destinationThree = new google.maps.LatLng(41.8069, -77.0780);
            //var map = new google.maps.Map(document.getElementById('map'), {
            //    zoom: 17,
            //    center: center
            //});
            //var marker = new google.maps.Marker({
            //    position: center,
            //    map: map
            //});
            //var markerTwo = new google.maps.Marker({
            //    position: destinationOne,
            //    map: map
            //});
            //var markerTwo = new google.maps.Marker({
            //    position: destinationTwo,
            //    map: map
            //});
            //var markerThree = new google.maps.Marker({
            //    position: destinationThree,
            //    map: map
            //});
        }

        function getMarkers() {  //TODO: implement ajax call to database with route id to return center and json string with markers.
            const markers = [
                {
                    name: 'Wellsboro Plaza', 
                    location: [41.7487, -77.3005]
                },
                {
                    name: 'Walmart Supercenter', 
                    location: [41.7838, -77.0669]
                }, 
                {
                    name: 'Lowes Home Improvement', 
                    location: [41.7683, -77.0717]
                }, 
                {
                    name: 'Harley Davidson', 
                    location: [41.7612, -77.0797]
                }, 
                {
                    name: 'Williamsport', 
                    location: [41.2412, -77.0011]
                }
            ];
            return markers;
        }
    </script>
<%--    <script src="/Scripts/Map.js" type="text/javascript"></script>--%>
</asp:Content>
