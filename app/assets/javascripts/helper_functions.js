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
            <p>
              <span class = "name">
              <a class="user-page" href="/users/${user.id}" >${user.first_name} ${user.last_name}</a>  </span>
              <span class= "age"> ${user.age}</span>
              <span class= "gender"> ${user.gender_pronoun}</span>
            </p>
          </div>
        </li>`;
}

function userProfile() {
  $.ajax({url: action, method: "GET"}).done(function(response) {
      $("div.container").html(response.userInfo)});
}

  // $(".home").on('click',function(event) {
  //   event.preventDefault();
  //     $.ajax({url: '/home',type: 'GET'}).done(function(response){
  //       $(".container").html(response.indexPage);
  //     });
  //   })
