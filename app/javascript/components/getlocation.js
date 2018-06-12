
function sendCurrentLocation (data) {
  // console.log(data);

 fetch(`/current_locations`, {
   method: "POST",
   credentials: "same-origin",
   headers: {
     "Content-Type": "application/json"
   },
   credentials: 'same-origin',
   body: JSON.stringify(data)
 })
 .then(response => response.json())
 .then((data) => {
   console.log(data); // Look at local_names.default
 });

};

function setCurrentLocation () {
  navigator.geolocation.getCurrentPosition((position) => {
    sendCurrentLocation({ lat: position.coords.latitude, lng: position.coords.longitude });
  });
};

setCurrentLocation();

export { setCurrentLocation };
