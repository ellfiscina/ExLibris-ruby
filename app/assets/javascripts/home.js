$(document).ready(function() {
  $('#edit_progress').on('click', function(){
    $('#reading_progress').modal('show')
  });
  $('#edit_status').on('click', function(){
    $('#reading_status').modal('show')
  });
  $('#add_author').on('click', function(){
    $('#new_author').modal('show')
  });

  $('#list_book_id').multiSelect();
  $('#sidebarCollapse').on('click', function () {
    $('#sidebar').toggleClass('active');
  });

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

  $('.status input[type="radio"]').click(function() {
    if($(this).attr('value') == 2) {
      $('.pages_read').show();
    }
    else{
      var pg
      if($(this).attr('value') == 1){
        pg = $('input[name="book[pages]"]').val();
      }
      else if($(this).attr('value') == 3){
        pg = 0;
      }
      $('.pages_read').hide();
      $('input[name="book[pages_read]"]').val(pg);
    }
  });
});
