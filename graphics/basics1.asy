import graph;
import math;
defaultpen(fontsize(8pt));
// size(3cm,0);
unitsize(1cm);

real f(real x) { return (1+x)**3; }
real g(real x) { return (1+3*x); }

bool3 boundf(real x) { real y=f(x); return 0 <= y && y <= 2; }
bool3 boundg(real x) { real y=g(x); return 0 <= y && y <= 2; }

real X=0.5;
draw(graph(f,cond=boundf,-X,X,operator ..));
draw(graph(g,cond=boundg,-X,X,operator ..),dashed);
pair lf=(X,0.9); draw(lf..(-0.4,f(-0.4)),ArcArrow); label("$(1+h)^3$",lf,E);
pair lg=(X,0.5); draw(lg..(-0.3,g(-0.3)),ArcArrow); label("$1+3h$",lg,E);


xaxis("$h$",Bottom,LeftTicks(Label(fontsize(8pt)),new real[]{-X,0,X}));
yaxis("$y$",Left,RightTicks(Label(fontsize(8pt)),new real[]{1-2*X,1-X,1,1+X,1+2*X,1+3*X}));
//xaxis("$h$",xmin=-X,xmax=X,Bottom,
//      LeftTicks(Label(fontsize(8pt)),new real[]{-X,0,X}));
//yaxis("$y$",ymin=0,ymax=2,Left,
//      RightTicks(Label(fontsize(8pt)),new real[]{1-2*X,1-X,1,1+X,1+2*X}));

//xlimits(-1.1,2);
//ylimits(-2.2,2.0);
//crop();
