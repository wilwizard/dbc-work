$(document).ready(function() {
  var handle = window.location.pathname.replace('/','');

  var followerPost = { url: '/fetch/' + handle, method: 'post' };

  $.ajax(followerPost).done(function(followers){
    console.log(followers);
    $("#follower_content").html(followers);
  });
});
