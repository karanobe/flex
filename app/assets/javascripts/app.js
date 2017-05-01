// To pull new preference form
$(document).ready(function() {
  $("div.container").on("click", "#new-pref",function(e) {
    e.preventDefault();
    $.ajax({url:"/preferences/new", method: "GET"}).done(function(response) {
      $(".container").html(response.newPrefForm);
    })
  });

// To pull edit preference form
  $("#pref").on("click", "#update-pref", function(e) {
    e.preventDefault();
    $(".container").html()
    var action = $(this).attr("href");
    $.ajax({url:action, method: "GET"}).done(function(response) {
      $(".container").html(response.editPrefForm);
    })
  });

// to submit updated preferences
  $("div.container").on("submit", "#edit_preference", function(e) {
    e.preventDefault();
    var action = $(this).attr("action");
    $.ajax({url: action, method: "POST", data: $(this).serialize()}).done(function(response) {
      $("div.container").html(generateRootPath());
    })
  })

  $("div.container").on("submit", "#new_preference", function(e) {
    e.preventDefault();
    var action = $(this).attr("action");
    $.ajax({url: action, method: "POST", data: $(this).serialize()}).done(function(response) {
      $("div.container").html(generateRootPath());
    })
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

function generateRootPath() {
  return `<h1>Flex</h1>
            <div class='container'>
              <div id="gyms">
              <a href="/gyms" >View Gyms</a>
              <ul id="gyms-pylon">
              </ul>
            </div>`;
}


