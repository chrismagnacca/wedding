function initialize() {
    var myLatLng = new google.maps.LatLng(40.08265039990075, -82.79795014489876);
    var mapLatLng = new google.maps.LatLng(40.133397, -82.932735);

    var mapOptions = {
        center: mapLatLng,
        zoom: 14,

        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var map = new google.maps.Map(document.getElementById("map-canvas"),
        mapOptions);

    var contentString = "St. Paul's Church<br/>" +
        "313 N State St,  ‎ <br />" +
        "Westerville, OH 43082";

    var infowindow = new google.maps.InfoWindow({
        content: contentString
    });

    var marker = new google.maps.Marker({
        position: mapLatLng,
        map: map,
        title: ""
    });
    google.maps.event.addListener(marker, 'click', function () {
        infowindow.open(map, marker);
    });


    marker.setMap(map);
}
google.maps.event.addDomListener(window, 'load', initialize);