import graph;
import math;
size(4cm);

real f(real x) { return (x*x+1)/(x*x-1); }
pair F(real x) { return (x,f(x)); }
xaxis("$x$",Arrows);
yaxis("$y$",Arrows);
real eps=0.3;
real X=2.5;
draw(graph(f,-X,-1-eps,operator ..));
draw(graph(f,1+eps,X,operator ..));
draw(graph(f,-1+eps,1-eps,operator ..));
draw((-1,-3)--(-1,4),dashed);
draw((1,-3)--(1,4),dashed);
label("$-1$",(-1,0),NW);
label("$+1$",(1,0),NE);
draw((-X,1)--(X,1),dashed);
draw((-X,-1)--(X,-1),dashed);
label("$+1$",(X*(1.1),1),E);
label("$-1$",(X*(1.1),-1),E);
