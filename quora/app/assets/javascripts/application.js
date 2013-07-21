// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require jquery.colorbox
//= require_tree .

$(document).ready(function(){
  var sign_in_form = '<form accept-charset="UTF-8" action="/sessions" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="✓"><input name="authenticity_token" type="hidden" value="LSt0M29Cq+1+wrqJJm+/exRNZ+Ffqt1lRdxMSx8vwUE="></div> <input id="session_email" name="session[email]" placeholder="Email" size="30" type="text"> <input id="session_password" name="session[password]" placeholder="Password" size="30" type="password"> <input name="commit" type="submit" value="Sign In" class="btn btn-large btn-primary"></form>';
  var sign_up_form = $('.form form');

  $(document).on('click', 'button.best_answer_button', function(){
    $(this).next('.best_answer').toggle();
  });

  $('#switch-form').on('click', function(e){
    e.preventDefault();
    $('.form h1').html('Sign In');
    $('.form form').replaceWith(sign_in_form);
  });

  $('.highest_rated').on('ajax:success', function(e, data){
    $('.container').html(data);
  });

  $('.trending').on('ajax:success', function(e, data){
    $('.container').html(data);
  });

  $('.bestanswer_link').on('ajax:success', function(event, data, status, xhr){
    $('span.best-answer').removeClass('best-answer');
    $(this).parent(0).children().first().addClass('best-answer');
  });

  $('.bestanswer_link_user_profile').on('ajax:success', function(e, data){
    console.log($(this));
    $('.best_answer_user_profile').removeClass('best_answer_user_profile');
    $(this).parent().addClass('best_answer_user_profile');
  })

  $('.upvote').on('ajax:success', function(e, data){
    //TODO refactor this. it's horrible
    $('html').html(data);
  });

  $('.downvote').on('ajax:success', function(e, data){
    //TODO refactor this. it's horrible
    $('html').html(data);
  });

});
