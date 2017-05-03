function renderGyms(response){
  var all_gyms = "<ul>";
  response.forEach(function(gym) {
    all_gyms += generateOneGym(gym);
  });
  all_gyms + "</ul>"
  $(".container").html(all_gyms);
}

function generateOneGym(gym){
  return `<li class="gym">
          <div class="gym-content">
            <p>
              <span class = "name"> 
              <h4>${gym.name}</h4>  </span>
              <span class= "address"> ${gym.street_address}</span><br>
              <span class= "city"> ${gym.city}</span><br>
              <span class= "zip"> ${gym.zip}</span><br>
            </p>
          </div>
        </li>`;
}

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
              <h2><a class="user-page" id="user-link" href="/users/${user.id}" >${user.first_name} ${user.last_name}</a></h2>  </span>
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
