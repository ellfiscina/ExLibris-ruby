$(document).ready(function() {
  var list = gon.count;
  var shelf = gon.shelf;
  var published = gon.published;
  var year = Object.keys(list);
  var key = Object.keys(published);
  var data = [];
  var nodes = [];
  var links = [];

  morris(shelf);

  for (i = 0; i < year.length; i++) {
    data.push({
      'year': year[i],
      'books': list[year[i]]['books'],
      'pages': list[year[i]]['pages']
    });
  }

  data = sort(data);

  for (i = 0; i < key.length; i++) {
    nodes.push({
      'id': published[key[i]]['link'],
      'group': published[key[i]]['year'],
      'book': published[key[i]]['title'],
      'author': published[key[i]]['author'],
    });

    for (j = i+1; j < key.length; j++){
      if (published[key[i]]['year'] == published[key[j]]['year']){
        links.push({
          'source': published[key[i]]['link'],
          'target': published[key[j]]['link'],
          'value': published[key[i]]['year']
        });
      }
    }
  }

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

  bargraph();
  nodeLink();

  function bargraph(){
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
  }

  function nodeLink(){
    var svg = d3.select("#timegraph").append("svg")
      .attr("width", width + margin.left + margin.right)
      .attr("height", height + margin.top + margin.bottom)
      .append("g")
      .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

    var color = d3.scaleOrdinal(d3.schemeCategory20);

    var simulation = d3.forceSimulation()
      .force("link", d3.forceLink().id(function(d) { return d.id; }))
      .force("charge", d3.forceManyBody())
      .force("center", d3.forceCenter(width / 2, height / 2));

    var link = svg.append("g")
      .attr("class", "links")
      .selectAll("line")
      .data(links)
      .enter().append("line")
      .attr("stroke-width", d => Math.sqrt(d.value)/10)
      .attr("stroke", "black");

    var node = svg.append("g")
      .attr("class", "nodes")
      .selectAll("circle")
      .data(nodes)
      .enter().append("circle")
      .attr("r", 5)
      .attr("fill", d=>color(d.id))
      .call(d3.drag()
        .on("start", dragstarted)
        .on("drag", dragged)
        .on("end", dragended));

    node.append("title").text(d=>d.book);

    simulation.nodes(nodes).on("tick", ticked);

    simulation.force("link").links(links);

    function ticked() {
      link
          .attr("x1", function(d) { return d.source.x; })
          .attr("y1", function(d) { return d.source.y; })
          .attr("x2", function(d) { return d.target.x; })
          .attr("y2", function(d) { return d.target.y; });

      node
          .attr("cx", function(d) { return d.x; })
          .attr("cy", function(d) { return d.y; });
    }

    function dragstarted(d) {
      if (!d3.event.active) simulation.alphaTarget(0.3).restart();
      d.fx = d.x;
      d.fy = d.y;
    }

    function dragged(d) {
      d.fx = d3.event.x;
      d.fy = d3.event.y;
    }

    function dragended(d) {
      if (!d3.event.active) simulation.alphaTarget(0);
      d.fx = null;
      d.fy = null;
    }
  }
});
function morris(shelf){
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
}
function sort(data){
  d = data.sort(function (a, b) {
      if (a.year > b.year) {
        return 1;
      }
      if (a.year < b.year) {
        return -1;
      }
      return 0;
    });
  return data
}