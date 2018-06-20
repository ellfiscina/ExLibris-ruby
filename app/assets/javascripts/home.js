/*$(document).ready(function() {
    $(".dropdown-toggle").dropdown();
});*/
$(document).ready(function() {
  $("#bigger").on("hide.bs.collapse", function(){
    $("#iconB").html('<i class="fa fa-arrow-circle-down"></i>');
  });
  $("#bigger").on("show.bs.collapse", function(){
    $("#iconB").html('<i class="fa fa-arrow-circle-up"></i>');
  });
  $("#smaller").on("hide.bs.collapse", function(){
    $("#iconS").html('<i class="fa fa-arrow-circle-down"></i>');
  });
  $("#smaller").on("show.bs.collapse", function(){
    $("#iconS").html('<i class="fa fa-arrow-circle-up"></i>');
  });
});
