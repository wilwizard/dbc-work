$(document).ready(function(){
  $(".pagination-section").pagination({
    total_pages: maxPage,
    current_page: currentPage+1,
    display_max: 10,
    callback: function(event, page) {
      event.preventDefault();
      var parent = $(event.target).parent();
      // don't do anything if link is disabled or currently active
      if (parent.hasClass('disabled') || parent.hasClass('active'))
      {
        location.reload();
      }
      else
      {
        window.location = "/?page="+(page-1);
      }
    }
  });
});
