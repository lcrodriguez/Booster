var map;
var $map;
var lastMarker;
var markers = [];

function initializeMap() {
    $map = $("#map_canvas");
      
    var myOptions = {
      zoom:15,
      mapTypeId: google.maps.MapTypeId.ROADMAP,
    }

    map = new google.maps.Map($map[0], myOptions);
}

function deleteOverlays() {
  if (markers) {
    for (i in markers) {
      markers[i].setMap(null);
    }
    markers.length = 0;
  }
}

function enableShowMap() {
  $("a#show-map").fancybox();
  initializeMap();
  google.maps.event.trigger(map, 'resize');
  $(".address-check").click(updateMap);
}

function updateMap() {
  
  deleteOverlays();
  bounds = new google.maps.LatLngBounds();
    
  $addresses = $(".address-check:checked");
  if ($addresses.length > 0) {
    $(".address-check:checked").each(function() {
      markAddress($(this).attr("data-address"), $(this).attr("data-title"));
    });
  }
}

function addressChanged() {
    var city = $(".field-city option:selected").text();
    var state = $(".field-state option:selected").text();
    var street = $(".field-street").val();
    var number = $(".field-streetnumber").val();
    
    if (city == "" || state == "" || street == "")
      return;

    var street = street;
    if (number != "")
      street += " " + number;
    if (city != "")
      street += ", " + city;
    if (state != "")
      street += ", " + state;
      
    deleteOverlays();
    markAddress(street);
}

var bounds;

function markAddress(address, title) {
      if (address == "")
        return;
      
      var geocoder = new google.maps.Geocoder();
      geocoder.geocode( { 'address': address}, 
      
        function(results, status) {
      
          if (status == google.maps.GeocoderStatus.OK) 
          {
            lastMarker = new google.maps.Marker({
                map: map, 
                position: results[0].geometry.location,
                title: title
            });

            markers.push(lastMarker);

            if (bounds !== undefined) {
              bounds.extend(lastMarker.position);
              map.fitBounds(bounds);
            }
            else {
              map.setCenter(lastMarker.position);
              $("#address-found").text(results[0].formatted_address);
            }
          }
        });
}