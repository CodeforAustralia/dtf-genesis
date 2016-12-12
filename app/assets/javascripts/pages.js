

console.log("Begin");


window.onload = function (win) {
  var dataset = [ {label: "HTML5", count: 30}
               , {label: "D3", count: 15}
               , {label: "JavaScript", count: 20}
               , {label: "Atom", count: 30}
               , {label: "Human", count: 5}
  ];

  var margin = {top: 20, right: 30, bottom: 30, left: 40}

  var width = 300 - margin.left - margin.right;
  var height = 150 - margin.top - margin.bottom;
  var radius = Math.min(width, height) / 2;
  console.log("Window: " + width + "x" + height + "... radius: " + radius);

  // var canvas = document.querySelector("canvas");
  // var context = canvas.getContext("2d");
  // var arc = d3.arc()
  //     .outerRadius(radius - 10)
  //     .innerRadius(radius - 70)
  //     .context(context);

  // var colors = ["#98abc5", "#8a89a6", "#7b6888", "#6b486b", "#a05d56", "#d0743c", "#ff8c00"];

  var data = ($('#spending').data('spending'));

  // d3.select("body").append("p").text("New paragraph!");
  // // d3.select("#chart").append("p").text("Chart Title");

  // d3.select("#chart")
  //   .append("div").text("Monthly Spending Bar Chart")
  //     .style("color","blue")
  //     .style("font-size", 22);

  // var body = d3.select("body");
  // var div = body.append("div");
  // div.html("Hello, d3!");

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
       .attr("class","title")
       .style("font", "18px sans-serif")
       .style("fill", "steelblue")
       .text("Construction spend/month");

  // var xAxis = d3.axisBottom()
  //     .scale(xscale);
  // var yAxis = d3.axisLeft()
  //     .scale(heightscale);
  // var yAxis = d3.axisLeft()
  //     .scale(heightscale)
  //     .ticks(10, "%");

  // chart.append("g")
  //     .attr("class", "x axis")
  //     .attr("transform", "translate(0," + height + ")")
  //     .call(xAxis);

  // chart.append("g")
  //     .attr("class", "y axis")
  //     .call(yAxis);

  var barWidth = width / data.length;

  var bar = chart.selectAll("g")
       .data(data)
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


  // d3.select(".barchart")
  //     .data(datadump)
  //     .enter()
  //     .append("div")
  //     // .text(function(d) {
  //     //     return d.name;
  //     // })
  //     .attr("class", "bar")
  //     .style("fill", function(d) {
  //         return "hsl(1000, 30%, "+(d.value/25000)+"%)";
  //     })
  //     .style("height", function(d) {
	// 			return (d.value/25000) + "px";
	// 		});

}; //load
