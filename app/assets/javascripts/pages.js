
window.onload = function (win) {
  var bar_margin = {top: 20, right: 30, bottom: 30, left: 40}
  var bc_width = 300 - bar_margin.left - bar_margin.right;
  var bc_height = 150 - bar_margin.top - bar_margin.bottom;

  var spending_data = ($('#spending').data('spending'));
  var barWidth = bc_width / spending_data.length;

  var heightscale = d3.scaleLinear()
      .domain([20000000,0])
      .range([bc_height, 0]);
  var widthscale = d3.scaleOrdinal()
      .range([0, bc_width], .1);

  var chart = d3.select(".barchart")
      .attr("width", bc_width + bar_margin.left + bar_margin.right)
      .attr("height", bc_height + bar_margin.top + bar_margin.bottom);
  chart.append("text")
       .attr("x", bc_width / 2)
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
       .attr("y", function(d) { return bc_height-heightscale(d.value); })
       .attr("height", function(d) { return heightscale(d.value); })
       .attr("width", barWidth - 1);

  bar.append("text")
      .attr("x", barWidth / 2)
      .attr("y", bc_height+5)
      .attr("dy", ".75em")
      .text(function(d) { return d.name.slice(0,3); });
  bar.append("text")
     .attr("x", barWidth / 2)
     .attr("y", function(d) { return bc_height-heightscale(d.value)-15; })
     .attr("dy", ".75em")
   .text(function(d) { return "$" + Math.round(d.value/1000000) + "m"; });





  var color = d3.scaleOrdinal(d3.schemeCategory20b);
  var pie_margin = {top: 20, right: 30, bottom: 10, left: 30}
  var pc_width = 300 - pie_margin.left - pie_margin.right;
  var pc_height = 150 - pie_margin.top - pie_margin.bottom;
  var outerRadius = (pc_width / 2) - pie_margin.left - pie_margin.right;
  var innerRadius = 20;
  var arc = d3.arc()
        .innerRadius(innerRadius)
        .outerRadius(outerRadius);
  var pie = d3.pie();
  var department_data = ($('#departmentspending').data('departmentspending'));
  var piechart = d3.select(".piechart")
      .append('svg')
      .attr("width", pc_width + pie_margin.left + pie_margin.right)
      .attr("height", pc_height + pie_margin.top + pie_margin.bottom)
      .append('g')
      .attr('transform', 'translate(' + pie_margin.left + ',' + pie_margin.top + ')');
  piechart.append("text")
       .attr("x", pc_width / 2)
       .attr("y", 0)
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
      	return color(i);
      })
      .attr("d", arc);

  //Labels
  arcs.append("text")
      .attr("transform", function(d) {
      	return "translate(" + arc.centroid(d) + ")";
      })
      .attr("text-anchor", "middle")
      .text(function(d) {
      	return d.data.name;
      });

      var legendRectSize = 10;
      var legendSpacing = 4;
      var legend = piechart.selectAll('.legend')
              .data(department_data)
              .enter()
              .append('g')
              .attr('class', 'legend')
              .attr('transform', function(d, i) {
                var height = legendRectSize + legendSpacing;
                var offset = -10;
                var horz = pc_width - 100;
                var vert = i * height - offset;
                return 'translate(' + horz + ',' + vert + ')';
              });
            legend.append('rect')
              .attr('width', legendRectSize)
              .attr('height', legendRectSize)
              .style('fill', function(d,i){ return color(i) })
              .style('stroke', "black");
            legend.append('text')
              .attr('x', legendRectSize + (legendSpacing*3))
              .attr('y', legendRectSize - legendSpacing)
              .text(function(d) {
                return d.name;
               });


}; //load
