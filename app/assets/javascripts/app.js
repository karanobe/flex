$(document).ready(function() {
  $("div.container").on("click", "#new-pref", function(event) {
    event.preventDefault();
    $.ajax({url:"/preferences/new", method: "GET"}).done(function(response) {
      $(".container").html(response.newPrefForm);
    })
  });

  $("div.container").on("click", "#update-pref", function(e) {
    e.preventDefault();
    var action = $(this).attr("href");
    $.ajax({url:action, method: "GET"}).done(function(response) {
      $(".container").html(response.editPrefForm);
    })
  });

  $("div.container").on("submit", "form.edit_preference", function(event) {
    event.preventDefault();
  })



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
  $("body").on('click', ".user-page", function(event) {
    event.preventDefault();
    var action = $(this).attr("href");
    $.ajax({url: action, method: "GET"}).done(function(response) {
      $(".container").html(response.userInfo);
    })
  });

  // $('body').on('click', 'a#add', function(event) {
  //   console.log("add friend");
  //   event.preventDefault();
  // });

  // $('#pref').on('click', '.cancel', function(event) {
  //   event.preventDefault();
  //   console.log("cancel request");
  // });

  // $('#pref').on('click', '.unfriend', function(event) {
  //   event.preventDefault();
  //   console.log("unfriend");
  // });

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


