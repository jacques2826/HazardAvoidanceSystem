function initMap() {
    var center = {
        lat: 41.8048,
        long: 77.0704
    }; 
    var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 4,
        center: center
    });
}
