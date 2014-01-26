# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.App = {}

$ ->
 google.maps.event.addDomListener(window, 'load', window.App.GoogleMapView.initialize)


window.App.GoogleMapView = initialize: ->
  mapLatLng = new google.maps.LatLng(40.159263,-82.909454)
  medallionLatLng = new google.maps.LatLng(40.175189,-82.892356)
  hotelLatLng = new google.maps.LatLng(40.139401,-82.975749)

  mapOptions =
    center: mapLatLng
    zoom: 13
    mapTypeId: google.maps.MapTypeId.ROADMAP

  map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions)

  directionsService = new google.maps.DirectionsService()
  directionsDisplay = new google.maps.DirectionsRenderer({suppressMarkers: true})

  directionsDisplay.setMap(map)

  request =
    origin: hotelLatLng
    destination: medallionLatLng
    waypoints: [
      {location: new google.maps.LatLng(40.14501,-82.882835), stopover: false}
    ]
    travelMode: google.maps.TravelMode.DRIVING

  directionsService.route(request, (response, status) ->
    if status == google.maps.DirectionsStatus.OK
      directionsDisplay.setDirections(response)
  )

  hotelAddress = "Hilton Garden Inn<br />" + "8535 Lyra Drive<br />" + "Columbus, OH 43240"
  medallionAddress = "The Medallion Club<br />" + "5000 Club Dr<br />" + "Westerville, OH 43082"

  hotelInfo = new google.maps.InfoWindow({content: hotelAddress})
  medallionInfo = new google.maps.InfoWindow({content: medallionAddress})

  hotelMarker = new google.maps.Marker({
    position: hotelLatLng,
    map: map,
    title: "Hilton Garden Inn"
  })

  medallionMarker = new google.maps.Marker({
    position: medallionLatLng,
    map: map,
    title: "The Medallion Club"
  })

  google.maps.event.addListener(hotelMarker, 'click', ->
    hotelInfo.open(map, hotelMarker)
  )

  google.maps.event.addListener(medallionMarker, 'click', ->
    medallionInfo.open(map, medallionMarker)
  )

  medallionMarker.setMap(map)

