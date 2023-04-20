let lat;
let lon;

navigator.geolocation.getCurrentPosition(function(pos) {
    console.log(pos);
    lat = pos.coords.latitude;
    lon = pos.coords.longitude;
});

function showPosition() {
    $(".lat").attr("value", lat);
    $(".lon").attr("value", lon);
}