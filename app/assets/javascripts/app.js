$(document).ready(function() {
  $("#new-pref").on("click", function(e) {
    e.preventDefault();
    hideLinks();
    $.ajax({url:"/preferences/new", method: "GET"}).done(function(response) {
      $("#pref").html(response.newPrefForm);
    })
  });

  $("#update-pref").on("click", function(e) {
    e.preventDefault();
    var action = $(this).attr("href");
    hideLinks();
    $.ajax({url:action, method: "GET"}).done(function(response) {
      $("#pref").html(response.editPrefForm);
    })
  });

  $("#gyms-link").on('click', function(event) {
    event.preventDefault();
    hideLinks();
    $.ajax({url:"/gyms", method: "GET"}).done(function(response) {
      renderGyms(response);
      $("div#pref").html("<a id='new-gym' href='/gyms/new'>Add a new gym!</a>");
    });
  });

  $("#pref").on("click", "#new-gym", function(event) {
    event.preventDefault();
    $.ajax({url: "/gyms/new", method: "GET"}).done(function(response) {
      $("div#pref").html(response.newGymForm);
    })
  })

  $("#pref").on('click', '#matched-users',function(event) {
    event.preventDefault();
    hideLinks();
    loadUsers();
  });

  $("#pref").on('click', ".user-page", function(event) {
    event.preventDefault();
    var action = $(this).attr("href");
    $.ajax({url: action, method: "GET"}).done(function(response) {
      $("div#pref").html(response.userInfo);
    })
  })

});
function renderGyms(response){
  var all_gyms = "";
  response.forEach(function(gym) {
    all_gyms += generateOneGym(gym);
  });
  $("#gyms-pylon").html(all_gyms);
}

function generateOneGym(gym){
  return `<li class="gym">
          <div class="gym-content">
            <p>
              <span class = "name">
              <a href="place url for specific gym profile page" >${gym.name} </a>  </span><br>
              <span class= "address"> ${gym.street_address}</span><br>
              <span class= "city"> ${gym.city}</span><br>
              <span class= "zip"> ${gym.zip}</span><br>
            </p>
          </div>
        </li>`;
}

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
  var all_users = "";
  response.forEach(function(user) {
    all_users += generateOneUser(user);
  });
  $("#users-pylon").html(all_users);
}

function generateOneUser(user){
  return `<li class="user">
          <div class="user-content">
            <p>
              <span class = "name">
              <a class="user-page" href="/users/${user.id}" >${user.first_name} ${user.last_name}</a>  </span>
              <span class= "age"> ${user.age}</span>
              <span class= "gender"> ${user.gender_pronoun}</span>
            </p>
          </div>
        </li>`;
}


