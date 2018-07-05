$(document).ready(function() {
  Morris.Donut({
    element: 'morris-donut-chart',
    data: [{
      label: "Livros lidos",
      value: gon.read
    }, {
      label: "Livros lendo",
      value: gon.reading
    }, {
      label: "Fila de Leitura",
      value: gon.to_read
    }],
    colors: ['#2ecc71', '#3498db', '#e74c3c'],
    resize: true
  });

  var year = gon.year;
  var pages = gon.pages;
  var books = gon.books;

  var dataset1 = []
  var dataset2 = []

  for (i = 0; i < year.length; i++) {
    dataset1.push({'y': year[i], 'a': books[i]});
  }
  for (i = 0; i < year.length; i++) {
    dataset2.push({'y': year[i], 'a': pages[i]});
  }


  var graph1 = Morris.Bar({
    element: 'graph1',
    data: dataset1,
    xkey: 'y',
    ykeys: ['a'],
    barColors: ['#16a085'],
    labels: ['Livros'],
    hideHover: 'auto',
    resize: true
  });
  var graph2 = Morris.Bar({
    element: 'graph2',
    data: dataset2,
    xkey: 'y',
    ykeys: ['a'],
    barColors: ['#16a085'],
    labels: ['Páginas'],
    hideHover: 'auto',
    axes: false,
    resize: true
  });


  function graph(type, string, element){
    var dataset = [];

    for (i = 0; i < year.length; i++) {
       dataset.push({'y': year[i], 'a': type[i]});
    }

    dataset = dataset.sort(function(a,b){
      return a.y - b.y;
    });


  }

  $('#pagesTab').click(function(){
    var x = 400;
    console.log(x);
    $('#graph2').width(x);
    graph2.redraw();
  });
  $('#booksTab').click(function(){
    var x = 320;
    console.log(x);
    $('#graph1').width(x);

    graph1.redraw();
  });
});