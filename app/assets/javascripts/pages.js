

console.log("Begin");


window.onload = function (win) {
  var margin = {top: 20, right: 30, bottom: 30, left: 40}
  var width = 300 - margin.left - margin.right;
  var height = 150 - margin.top - margin.bottom;

  var spending_data = ($('#spending').data('spending'));
  var barWidth = width / spending_data.length;

  var heightscale = d3.scaleLinear()
      .domain([20000000,0])
      .range([height, 0]);
  var widthscale = d3.scaleOrdinal()
      .range([0, width], .1);

  var chart = d3.select(".barchart")
      .attr("width", width + margin.left + margin.right)
      .attr("height", height + margin.top + margin.bottom);
  chart.append("text")
       .attr("x", width / 2)
       .attr("y", 20)
       .attr("class","charttitle")
       .style("font", "18px sans-serif")
       .style("fill", "steelblue")
       .text("Construction spend/month");

  var bar = chart.selectAll("g")
       .data(spending_data)
     .enter().append("g")
       .attr("transform", function(d, i) { return "translate(" + i * barWidth + ",0)"; });

  bar.append("rect")
       .attr("y", function(d) { return height-heightscale(d.value); })
       .attr("height", function(d) { return heightscale(d.value); })
       .attr("width", barWidth - 1);

  bar.append("text")
      .attr("x", barWidth / 2)
      .attr("y", height+5)
      .attr("dy", ".75em")
      .text(function(d) { return d.name.slice(0,3); });
  bar.append("text")
     .attr("x", barWidth / 2)
     .attr("y", function(d) { return height-heightscale(d.value)-15; })
     .attr("dy", ".75em")
   .text(function(d) { return "$" + Math.round(d.value/1000000) + "m"; });






  var outerRadius = (width / 2) - margin.left - margin.right;
  var innerRadius = 0;
  var arc = d3.arc()
        .innerRadius(innerRadius)
        .outerRadius(outerRadius);
  var pie = d3.pie();
  var color = d3.category10; //Easy colors accessible via a 10-step ordinal scale
  var department_data = ($('#departmentspending').data('departmentspending'));
  // department_data = [{"name": 1, "value": 3000}, {"name": 2, "value": 2000}, {"name": 3, "value": 3500}];
  var piechart = d3.select(".piechart")
      .attr("width", width + margin.left + margin.right)
      .attr("height", height + margin.top + margin.bottom);
  piechart.append("text")
       .attr("x", width / 2)
       .attr("y", 20)
       .attr("class","charttitle")
       .style("font", "18px sans-serif")
       .style("fill", "steelblue")
       .text("Construction spend by agency");

       //Set up groups
  var arcs = piechart.selectAll("g.arc")
  			  .data(pie.value(function(d) { return d.value; })(department_data))
  			  .enter()
  			  .append("g")
  			  .attr("class", "arc")
  			  .attr("transform", "translate(" + outerRadius + "," + outerRadius + ")");

  //Draw arc paths
  arcs.append("path")
      .attr("fill", function(d, i) {
      	return "red";
      })
      .attr("d", arc);

  //Labels
  arcs.append("text")
      .attr("transform", function(d) {
      	return "translate(" + arc.centroid(d) + ")";
      })
      .attr("text-anchor", "middle")
      .text(function(d) {
      	return d.value + " - " + d.name;
      });





}; //load
