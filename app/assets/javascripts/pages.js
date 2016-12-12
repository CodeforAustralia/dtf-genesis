

console.log("Begin");


window.onload = function (win) {
  var dataset = [ {label: "HTML5", count: 30}
               , {label: "D3", count: 15}
               , {label: "JavaScript", count: 20}
               , {label: "Atom", count: 30}
               , {label: "Human", count: 5}
  ];

  var width = 600
  var height = 300
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

  var chart = d3.select(".barchart")
      .attr("width", width)
      .attr("height", height);

  var barWidth = width / data.length;

  var bar = chart.selectAll("g")
       .data(data)
     .enter().append("g")
       .attr("transform", function(d, i) { return "translate(" + i * barWidth + ",0)"; });

  bar.append("rect")
       .attr("y", function(d) { return heightscale(d.value); })
       .attr("height", function(d) { return height - heightscale(d.value); })
       .attr("width", barWidth - 1);

  bar.append("text")
       .attr("x", barWidth / 2)
       .attr("y", height-20)
       .attr("dy", ".75em")
       .text(function(d) { return d.name; });


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
