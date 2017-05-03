// function renderGyms(response){
//   var all_gyms = "<ul>";
//   response.forEach(function(gym) {
//     all_gyms += generateOneGym(gym);
//   });
//   all_gyms + "</ul>"
//   $(".container").html(all_gyms);
// }

// function generateOneGym(gym){
//   return `<li class="gym">
//           <div class="gym-content">
//             <p>
//               <span class = "name">
//               <h4><a href="/gyms/${gym.id}" id=${gym.id} class="set-primary">${gym.name}</a></h4>  </span>
//               <span class= "address"> ${gym.street_address}</span><br>
//               <span class= "city"> ${gym.city}</span><br>
//               <span class= "zip"> ${gym.zip}</span><br>
//             </p>
//           </div>
//         </li>`;
// }

//<h4><a href="place url for specific gym profile page" >${gym.name} </a></h4>  </span><br>

function hideLinks(){
  $('#gyms-link').hide();
  $('#new-pref').hide();
  $('#update-pref').hide();
  $('#matched-users').hide();
}

function loadUsers() {
  var promise = getUsers();
  promise.done(renderUsers);
}

function getUsers() {
   var requestPromise = $.ajax({url:"/users", method: "GET"});
  return requestPromise;
}


function renderUsers(response) {
  var all_users = "<ul>";
  response.forEach(function(user) {
    all_users += generateOneUser(user);
    all_users + "</ul>";
  });
  $(".container").html(all_users);
}

function generateOneUser(user){
  return `<li class="user">
          <div class="user-content">
            <div class="column-left">
              <span class = "name">
              <h3><a class="user-page" id="user-link" href="/users/${user.id}" >${user.first_name}</a></h3>  </span>
              </div>
              <div class="column-middle">
              <h4><span class= "age"> ${user.age}</span></h4>
              </div>
              <div class="column-middle">
              <h4><span class= "gender"> ${user.gender_pronoun}</span></h4>
              </div>
          </div>
        </li>`;
}

// function userProfile() {
//   $.ajax({url: action, method: "GET"}).done(function(response) {
//       $("div.container").html(response.userInfo)});
// }


  var placeSearch, autocomplete;
  var componentForm = {
    street_number: 'short_name',
    route: 'long_name',
    locality: 'long_name',
    administrative_area_level_1: 'short_name',
    country: 'long_name',
    postal_code: 'short_name'
  };

  function initAutocomplete() {
    // Create the autocomplete object, restricting the search to geographical
    // location types.
    autocomplete = new google.maps.places.Autocomplete(
        /** @type {!HTMLInputElement} */(document.getElementById('autocomplete')),
        {types: ['geocode']});

    // When the user selects an address from the dropdown, populate the address
    // fields in the form.
    autocomplete.addListener('place_changed', fillInAddress);
  }

  function fillInAddress() {
    // Get the place details from the autocomplete object.
    var place = autocomplete.getPlace();

    for (var component in componentForm) {
      document.getElementById(component).value = '';
      document.getElementById(component).disabled = false;
    }

    // Get each component of the address from the place details
    // and fill the corresponding field on the form.
    for (var i = 0; i < place.address_components.length; i++) {
      var addressType = place.address_components[i].types[0];
      if (componentForm[addressType]) {
        var val = place.address_components[i][componentForm[addressType]];
        document.getElementById(addressType).value = val;
      }
    }
  }

  function geolocate() {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(position) {
        var geolocation = {
          lat: position.coords.latitude,
          lng: position.coords.longitude
        };
        var circle = new google.maps.Circle({
          center: geolocation,
          radius: position.coords.accuracy
        });
        autocomplete.setBounds(circle.getBounds());
      });
    }
  }

  // $(".home").on('click',function(event) {
  //   event.preventDefault();
  //     $.ajax({url: '/home',type: 'GET'}).done(function(response){
  //       $(".container").html(response.indexPage);
  //     });
  //   })
