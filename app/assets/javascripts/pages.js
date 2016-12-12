

console.log("Begin");


window.onload = function (win) {
  var dataset = [ {label: "HTML5", count: 30}
               , {label: "D3", count: 15}
               , {label: "JavaScript", count: 20}
               , {label: "Atom", count: 30}
               , {label: "Human", count: 5}
  ];

  var width = 300
  var height = 150
  var radius = Math.min(width, height) / 2;
  console.log("Window: " + width + "x" + height + "... radius: " + radius);

  var canvas = document.querySelector("canvas");
  var context = canvas.getContext("2d");
  var arc = d3.arc()
      .outerRadius(radius - 10)
      .innerRadius(radius - 70)
      .context(context);

  var colors = ["#98abc5", "#8a89a6", "#7b6888", "#6b486b", "#a05d56", "#d0743c", "#ff8c00"];

  d3.select("body").append("p").text("New paragraph!");
  d3.select("#chart").append("p").text("Chart Title");
  d3.select("#chart")
      .data(dataset)
      .enter()
      .append("p")
      .text("Sample")
      .style("color", function(d) {
          return "hsl(1000, 30%, "+d.count*4+"%)";
      });

}; //load
