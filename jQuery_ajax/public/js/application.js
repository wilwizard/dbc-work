$(document).ready(function(){
  $("#get_color").on("click", function(){
    $.ajax({
      url: '/color',
      method: 'post'
    }).done(function(response){
      var cell = $.parseJSON(response)["cell"];
      var color = $.parseJSON(response)["color"];
      $("#color_me li:nth-child("+cell+")").css("background-color", color);
    });
  });
});