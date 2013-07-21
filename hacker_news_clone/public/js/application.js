$(document).ready(function() {
  $("#post_upvote").on("click", function(e) {
    e.preventDefault();
    var postId = $("#post_upvote").data("post-id");
    $.ajax({
      type: "POST",
      url: "/posts/" + postId + "/upvote"
    }).done( function(response) {
      $("#vote_count").html(response);
    });
  });
  $("#post_downvote").on("click", function(e) {
    e.preventDefault();
    var postId = $("#post_downvote").data("post-id");
    $.ajax({
      type: "POST",
      url: "/posts/" + postId + "/downvote"
    }).done( function(response) {
      $("#vote_count").html(response);
    });
  });
});
