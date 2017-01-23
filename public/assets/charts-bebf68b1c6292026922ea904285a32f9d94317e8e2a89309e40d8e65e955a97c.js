var window_size=400;window.onload=function(){var t={top:20,right:30,bottom:30,left:40},e=window_size-t.left-t.right,a=window_size-t.top-t.bottom,r=$("#spending").data("spending"),n=e/r.length;maximal=0,r.forEach(function(t){+t.value>maximal&&(maximal=t.value)}),maximal=1.2*maximal;var l=d3.scaleLinear().domain([maximal,0]).range([a,0]),i=(d3.scaleOrdinal().range([0,e],.1),d3.select(".barchart").attr("width",e+t.left+t.right).attr("height",a+t.top+t.bottom));i.append("text").attr("x",e/2).attr("y",20).attr("class","charttitle").style("font","17px sans-serif").style("fill","steelblue").text("Value of awarded contracts in previous 12 months");var o=i.selectAll("g").data(r).enter().append("g").attr("transform",function(t,e){return"translate("+e*n+",0)"});o.append("rect").attr("y",function(t){return a-l(t.value)}).attr("height",function(t){return l(t.value)}).attr("width",n-1),o.append("text").attr("x",n/2).attr("y",a+5).attr("dy",".75em").text(function(t){return t.name.slice(0,3)}),o.append("text").attr("x",n/2).attr("y",function(t){return a-l(t.value)-15}).attr("dy",".75em").text(function(t){return Math.round(t.value/1e6)>0?"$"+Math.round(t.value/1e6)+"m":"< $1m"});var d=d3.scaleOrdinal(d3.schemeCategory20b),s={top:40,right:10,bottom:10,left:10},p=window_size,u=window_size,c=Math.min(p-s.left-s.right,u-s.top-s.bottom)/2-20,m=c-70,f=d3.arc().innerRadius(m).outerRadius(c),h=d3.pie().padAngle(.01),g=$("#departmentspending").data("departmentspending"),x=d3.select(".piechart").attr("width",p).attr("height",u).append("svg").attr("width",p-s.left-s.right).attr("height",u-s.top-s.bottom).append("g").attr("transform","translate("+s.left+","+s.top+")");x.append("text").attr("x",p/2-35).attr("y",-20).attr("class","charttitle").style("font","15px sans-serif").style("fill","steelblue").style("text-anchor","center").text("Department % value for previous 12 months");var v=x.selectAll("g.arc").data(h.value(function(t){return t.value})(g)).enter().append("g").attr("class","arc").attr("transform","translate("+c+","+c+")");v.append("path").attr("fill",function(t,e){return d(e)}).attr("d",f),v.append("text").attr("transform",function(t){return"translate("+f.centroid(t)+")"}).attr("text-anchor","middle").text(function(t){return t.data.name});var w=10,y=4,b=x.selectAll(".legend").data(g).enter().append("g").attr("class","legend").attr("transform",function(t,e){var a=w+y,r=-100,n=140,l=e*a-r;return"translate("+n+","+l+")"});b.append("rect").attr("width",w).attr("height",w).style("fill",function(t,e){return d(e)}).style("stroke","black"),b.append("text").attr("x",w+3*y).attr("y",w-y).text(function(t){return t.name})};