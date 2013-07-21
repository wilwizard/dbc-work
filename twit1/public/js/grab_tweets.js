$(document).ready(function() {
  var handle = window.location.pathname.replace('/','');

  var tweetPost = { url: '/fetch/' + handle, method: 'post' };
  
  $.ajax(tweetPost).done(function(tweets){
    $("#tweet_content").html(tweets);
  });
});
