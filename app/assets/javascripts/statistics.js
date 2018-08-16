$(document).ready(function() {
  var list = gon.count;
  var shelf = gon.shelf
  var year = Object.keys(list);

  var data = []

  Morris.Donut({
    element: 'morris-donut-chart',
    data: [{
      label: "Livros lidos",
      value: shelf.read
    }, {
      label: "Livros lendo",
      value: shelf.reading
    }, {
      label: "Fila de Leitura",
      value: shelf.to_read
    }],
    colors: ['#2ecc71', '#3498db', '#e74c3c'],
    resize: true
  });

  for (i = 0; i < year.length; i++) {
    data.push({
      'year': year[i],
      'books': list[year[i]]['books'],
      'pages': list[year[i]]['pages']
    });
  }

  data = data.sort(function (a, b) {
    if (a.year > b.year) {
      return 1;
    }
    if (a.year < b.year) {
      return -1;
    }
    return 0;
  });


  var colors =  [ ["Livros", "#ecd555"], ["Páginas", "#BF55EC"] ];

  var margin = {top: 80, right: 80, bottom: 80, left: 20},
      width = 970 - margin.left - margin.right,
      height = 500 - margin.top - margin.bottom;

  var x = d3.scaleBand().rangeRound([0, width]);

  var y0 = d3.scaleLinear().domain([300, 1100]).range([height, 0]),
      y1 = d3.scaleLinear().domain([20, 80]).range([height, 0]);

  var xAxis = d3.axisBottom(x);
  var yAxisLeft = d3.axisLeft(y0);
  var yAxisRight = d3.axisRight(y1);

  var svg = d3.select("#bargraph").append("svg")
    .attr("width", width + margin.left + margin.right)
    .attr("height", height + margin.top + margin.bottom)
    .append("g")
    .attr("class", "graph")
    .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

  x.domain(data.map(function(d) { return d.year; }));
  y0.domain([0, d3.max(data, function(d) { return d.books; })]);
  y1.domain([0, d3.max(data, function(d) { return d.pages; })]);

  svg.append("g")
    .attr("class", "x axis")
    .attr("transform", "translate(0," + height + ")")
    .call(xAxis);

  svg.append("g")
    .attr("class", "y axis axisLeft")
    .attr("transform", "translate(0,0)")
    .call(yAxisLeft)
    .append("text")
    .attr("y", 6)
    .attr("dy", "-2em")
    .style("text-anchor", "end")
    .style("text-anchor", "end")
    .text("Livros");

  svg.append("g")
    .attr("class", "y axis axisRight")
    .attr("transform", "translate(" + (width) + ",0)")
    .call(yAxisRight)
    .append("text")
    .attr("y", 6)
    .attr("dy", "-2em")
    .attr("dx", "2em")
    .style("text-anchor", "end")
    .text("Páginas");

  bars = svg.selectAll(".bar").data(data.sort()).enter();

  plot('b');
  plot('p');

  var legend = svg
  .append("g")
  .selectAll("g")
  .data(colors)
  .enter()
  .append('g')
  .attr('class', 'legend')
  .attr('transform', function(d, i) {
    var height = 20;
    var x = 0;
    var y = (i * height ) - 70;
    return 'translate(' + x + ',' + y + ')';
  });

  legend.append('rect')
  .attr('width', "15")
  .attr('height', "15")
  .style('fill', (d,i) => colors[i][1])
  .style('stroke', (d,i) => colors[i][1]);

  legend.append('text')
  .attr('x', "20")
  .attr('y', "13")
  .text((d,i) => colors[i][0]);


  function plot(type) {
    if(type == 'b'){
      var tip = d3.tip().attr("class", "d3-tip").html(d => d.books + " livros");
      svg.call(tip);
      bars.append("rect")
      .attr("class", "bar1")
      .attr("x", d => x(d.year)+ 15)
      .attr("width", "30")
      .attr("y", d => y0(d.books))
      .attr("height", d => height - y0(d.books))
      .attr("fill",colors[0][1])
      .on("mouseover", function(d){
        d3.select(this).style("fill", "#B9A743");
        tip.show(d);
      })
      .on("mouseout", function(d){
        d3.select(this).style("fill", colors[0][1]);
        tip.hide(d);
      });
    }
    else{
      var tip = d3.tip().attr("class", "d3-tip").html(d => d.pages + " páginas");
      svg.call(tip);
      bars.append("rect")
      .attr("class", "bar2")
      .attr("x", d => x(d.year) + 30)
      .attr("width", "30")
      .attr("y", d => y1(d.pages))
      .attr("height", d => height - y1(d.pages))
      .attr("fill",colors[1][1])
      .on("mouseover", function(d){
        d3.select(this).style("fill", "#9643B9");
        tip.show(d);
      })
      .on("mouseout", function(d){
        d3.select(this).style("fill", colors[1][1]);
        tip.hide(d);
      });
    }


  }

});
