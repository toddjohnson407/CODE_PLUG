import GMaps from 'gmaps/gmaps.js';



function loadGoogleMap() {

const styles = [
    {
        "stylers": [
            {
                "hue": "#ff1a00"
            },
            {
                "invert_lightness": true
            },
            {
                "saturation": -100
            },
            {
                "lightness": 33
            },
            {
                "gamma": 0.5
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#2D333C"
            }
        ]
    }
]

var contentString = 'test'

const mapElement = document.getElementById('map');
if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const map = new GMaps({ el: '#map', lat: 0, lng: 0 });
  const markers = JSON.parse(mapElement.dataset.markers);
  // console.log(markers);

  // var infowindow = new google.maps.InfoWindow({
  //   content: contentString,
  //   maxWidth: 40
  // });
  map.addMarkers(markers);
  map.markers.forEach(function(marker){
    //console.log(marker);
    marker.addListener('click', function() {
      infowindow.open(map, marker);
    });
  });

  // map.addMarkers(markers);
  if (markers.length === 0) {
    map.setZoom(2);
  } else if (markers.length === 1) {
    map.setCenter(markers[0].lat, markers[0].lng);
    map.setZoom(14);
  } else {
    map.fitLatLngBounds(markers);
  }
  map.addStyle({
    styles: styles,
    mapTypeId: 'map_style'
  });
  map.setStyle('map_style');


}
}



loadGoogleMap();

document.loadGoogleMap = loadGoogleMap; // makes availabe inside views




