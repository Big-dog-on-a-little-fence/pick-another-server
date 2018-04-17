$( document ).ready(function() {
  
  $(".show-reply").on("click", function() {
    let id = $(this).closest("button").data("id");
    $("#"+id).show();
  });

  $(".cancel-reply").on("click", function() {
    let id = $(this).closest("button").data("id");
    $("#"+id).hide();
  });

}); // on document ready
