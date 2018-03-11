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
            var markerThree = new google.maps.Marker({
                position: destinationTwo, 
                map: map
            });
            var markerFour = new google.maps.Marker({
                position: destinationThree,
                map: map
            });
        }
    </script>
<%--    <script src="/Scripts/Map.js" type="text/javascript"></script>--%>
</asp:Content>
