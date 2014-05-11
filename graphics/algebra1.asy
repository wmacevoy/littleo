import graph;
import math;

real X=2.5*1.25;

unitsize(3cm/(2*X));
defaultpen(fontsize(6pt));

real f(real x) { return (x*x+1)/(x*x-1); }
bool3 p(real x) { return (abs(x) != 1) && abs(f(x))<3; }

path xax=(-X,0)--(X,0);
draw(xax,Arrows);

yaxis("$y$",Arrows);

draw(graph(f,cond=p,-X,X,operator ..));

draw((-1,-3)--(-1,3),dashed);
draw((1,-3)--(1,3),dashed);
draw((-X,1)--(X,1),dashed);
draw((-X,-1)--(X,-1),dashed);

label("$-1$",(-1,0),NW);
label("$+1$",(1,0),NE);
label("$+1$",(X*(1.1),1),E);
label("$-1$",(X*(1.1),-1),E);
