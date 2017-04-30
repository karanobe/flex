$(document).ready(function() {

  // loadUsers();
});

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
  $("#users-pylon").append(all_users);
}

function generateOneUser(user){
  return `<li class="user">
          <div class="user-content">
            <p>
              <span class = "name">${user.first_name} ${user.last_name}</span>
              <span class= "age"> ${user.age}</span>
              <span class= "gender"> ${user.gender_pronoun}</span>
            </p>
          </div>
        </li>`;
}


