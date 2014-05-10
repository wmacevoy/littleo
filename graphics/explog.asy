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

real x0=0.67*X;
real y0=f(x0);
xaxis(Bottom,xmin=-1,xmax=1,LeftTicks(Label(fontsize(8pt)),new real[]{-1,0,1}));
yaxis(Left,ymin=0,ymax=2,RightTicks(Label(fontsize(8pt)),new real[]{0,0.5,1,2}));
	
dot((x0,y0));

label("${\scriptstyle x=\log_2 y}$",(x0,0),S);
label("${\scriptstyle y=2^x}$",(-1,y0),W);

draw((x0,0)--(x0,y0),dashed);
draw((-1,y0)--(x0,y0),dashed);
