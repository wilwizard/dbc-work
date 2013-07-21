$(document).ready(function() {
  var waitUntilDone = function (jid){
    $.ajax({
      url:'/status/'+jid,
      method: 'GET'
    }).done(function(response){
      if (response.complete === true) {
        console.log('done');
      } else {
        setTimeout(function() {
          console.log('not done');
          waitUntilDone(jid);
        }, 500);
      }
    });
  };

  $('form').submit(function(event){
    event.preventDefault();
    $.ajax({
      url: '/',
      method: 'POST',
      data: $(this).serialize()
    }).done(function(jid){
      waitUntilDone(jid);
    });
    $(this).trigger('reset');
  });
});
