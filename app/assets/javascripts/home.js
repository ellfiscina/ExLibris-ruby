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

  $("#older").on("hide.bs.collapse", function(){
    $("#iconO").html('<i class="fa fa-arrow-circle-down"></i>');
  });
  $("#older").on("show.bs.collapse", function(){
    $("#iconO").html('<i class="fa fa-arrow-circle-up"></i>');
  });

  $("#newer").on("hide.bs.collapse", function(){
    $("#iconN").html('<i class="fa fa-arrow-circle-down"></i>');
  });
  $("#newer").on("show.bs.collapse", function(){
    $("#iconN").html('<i class="fa fa-arrow-circle-up"></i>');
  });
});
