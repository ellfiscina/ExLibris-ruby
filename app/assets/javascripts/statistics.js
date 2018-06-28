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

var timeBegin = 2000,
    timeEnd = 2050;

var dataset = gon.dataset

var x = d3.scaleLinear().domain([timeBegin, timeEnd]).range([0,1000]);

var svg = d3.select("#graph")
  .append("svg")
  .append("g").attr("transform", "translate(-100,100)")
  .selectAll("circle")
  .data(dataset)
  .enter()
  .append("circle")
  .attr("r", d => {gon.size.count_pages(d[0])})
  .attr("cx", d => x(d[0]))
  .attr("cy", d => d[1]);
