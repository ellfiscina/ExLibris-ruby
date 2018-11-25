$(document).ready(function() {
  // sortable('#books', {
  //   items: 'tr'
  // });
  // if (typeof sortable('#books')[0] != 'undefined'){
  //   sortable('#books')[0].addEventListener('sortupdate', function(e) {
  //     var dataIDList = $(this).children().map(function(index){
  //        $(this).find( ".position" ).text(index + 1)
  //        return "book[]=" + $(this).data("id");
  //     }).get().join("&");
  //     Rails.ajax({
  //         url: $(this).data("url"),
  //         type: "PATCH",
  //         data: dataIDList,
  //       });
  //   });
  // }
  $('#draggable').tableDnD();
});
