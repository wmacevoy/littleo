import graph;
import math;

size(4cm);
real eps=0.3;
real X=1.1;
real Y=3.0;

real f(real x) { return 2**x; }
real w(real x) { return 0.05*sin(20*x); }

//path xax=(-0.25*X,0)--(X,0);
//path yax=(-0.25*X,0)--(Y,0);
//draw(xax,Arrows);
//draw(yax,Arrows);
draw(graph(f,-X,X,operator ..));
xaxis(Arrows);
yaxis(Arrows);

real x0=0.67*X;
real y0=f(x0);

label("${\scriptstyle x=\log_2 y}$",(x0,0),S);
label("${\scriptstyle y=2^x}$",(0,y0),W);

draw((x0,0)--(x0,y0));
draw((0,y0)--(x0,y0));
