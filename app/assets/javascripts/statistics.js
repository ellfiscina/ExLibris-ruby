$(function() {
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
});

var year = gon.year;
var book = gon.book;
var dataset = [];

for (i = 0; i < year.length; i++) {
   dataset.push({'y': year[i], 'a': book[i]});
}

dataset = dataset.sort(function(a,b){
  return a.y - b.y;
});

Morris.Bar({
    element: 'graph',
    data: dataset,
    xkey: 'y',
    ykeys: ['a'],
    barColors: ['#16a085'],
    labels: ['Livros'],
    hideHover: 'auto',
    resize: true
});