import graph;
import math;
defaultpen(fontsize(8pt));
//size(3cm,0);
unitsize(10cm);

real f(real x) { return (x != 0) ? (1+x)**(1/x) : exp(1); }
real g(real x) { return exp(1); }

bool3 boundf(real x) { real y=f(x); return true; }
bool3 boundg(real x) { real y=g(x); return true; }

real X=0.1;
draw(graph(f,cond=boundf,-X,X,operator ..));
draw(graph(g,cond=boundg,-X,X,operator ..),dashed);
pair lf=(X,2.8183); draw(lf..(-0.08,f(-0.08)),ArcArrow); label("$(1+h)^{1/h}$",lf,E);
pair lg=(X,(2.8183+2.7183)/2); draw(lg..(0.05,g(0.05)),ArcArrow); label("$e$",lg,E);

filldraw(circle((0,exp(1)),0.0075),white);
xaxis("$h$",Bottom,LeftTicks(Label(fontsize(8pt)),new real[]{-X,0,X}));
yaxis(Left,RightTicks(Label(fontsize(8pt)),new real[]{exp(1)-X,exp(1),exp(1)+X}));
//xaxis("$h$",xmin=-X,xmax=X,Bottom,
//      LeftTicks(Label(fontsize(8pt)),new real[]{-X,0,X}));
//yaxis("$y$",ymin=0,ymax=2,Left,
//      RightTicks(Label(fontsize(8pt)),new real[]{1-2*X,1-X,1,1+X,1+2*X}));

//xlimits(-1.1,2);
//ylimits(-2.2,2.0);
//crop();
