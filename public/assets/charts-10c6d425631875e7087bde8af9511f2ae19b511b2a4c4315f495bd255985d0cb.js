var w=Math.max(document.documentElement.clientWidth,window.innerWidth||0);if(w<400)var window_size=w-.25*w,chart_font="10px sans-serif",bar_font="10px sans-serif";else var window_size=374,chart_font="15px sans-serif",bar_font="15px sans-serif";window.onload=function(){var t={top:20,right:30,bottom:30,left:40},e=window_size-t.left-t.right,a=window_size-t.top-t.bottom,r=$("#spending").data("spending"),n=e/r.length;maximal=0,r.forEach(function(t){+t.value>maximal&&(maximal=t.value)}),maximal=1.2*maximal;var i=d3.scaleLinear().domain([maximal,0]).range([a,0]),l=(d3.scaleOrdinal().range([0,e],.1),d3.select(".barchart").attr("width",e+t.left+t.right).attr("height",a+t.top+t.bottom));l.append("text").attr("x",e/2).attr("y",20).attr("class","charttitle").style("font",chart_font).style("fill","steelblue").text("Value of awarded contracts in previous 12 months");var o=l.selectAll("g").data(r).enter().append("g").attr("transform",function(t,e){return"translate("+e*n+",0)"});o.append("rect").attr("y",function(t){return a-i(t.value)}).attr("height",function(t){return i(t.value)}).attr("width",n-1),o.append("text").attr("x",n/2).attr("y",a+5).attr("dy",".75em").text(function(t){return t.name.slice(0,3)}),o.append("text").attr("x",n/2).attr("y",function(t){return a-i(t.value)-15}).attr("dy",".75em").text(function(t){return Math.round(t.value/1e6)>0?"$"+Math.round(t.value/1e6)+"m":"< $1m"});var d=d3.scaleOrdinal(d3.schemeCategory20b),s={top:40,right:10,bottom:10,left:10},c=window_size,p=window_size,u=Math.min(c-s.left-s.right,p-s.top-s.bottom)/2-20,f=u-70,m=d3.arc().innerRadius(f).outerRadius(u),h=d3.pie().padAngle(.01),x=$("#departmentspending").data("departmentspending"),g=d3.select(".piechart").attr("width",c).attr("height",p).append("svg").attr("width",c-s.left-s.right).attr("height",p-s.top-s.bottom).append("g").attr("transform","translate("+s.left+","+s.top+")");g.append("text").attr("x",c/2-35).attr("y",-20).attr("class","charttitle").style("font",bar_font).style("fill","steelblue").style("text-anchor","center").text("Department % value for previous 12 months");var w=g.selectAll("g.arc").data(h.value(function(t){return t.value})(x)).enter().append("g").attr("class","arc").attr("transform","translate("+u+","+u+")");w.append("path").attr("fill",function(t,e){return d(e)}).attr("d",m),w.append("text").attr("transform",function(t){return"translate("+m.centroid(t)+")"}).attr("text-anchor","middle").text(function(t){return t.data.name});var v=10,y=4,b=g.selectAll(".legend").data(x).enter().append("g").attr("class","legend").attr("transform",function(t,e){var a=v+y,r=-100,n=140,i=e*a-r;return"translate("+n+","+i+")"});b.append("rect").attr("width",v).attr("height",v).style("fill",function(t,e){return d(e)}).style("stroke","black"),b.append("text").attr("x",v+3*y).attr("y",v-y).text(function(t){return t.name})};