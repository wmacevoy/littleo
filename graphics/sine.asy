import graph;
import math;
defaultpen(fontsize(8pt));
// size(3cm,0);
unitsize(1cm);

real f(real x) { return sin(x); }
real g1(real x) { return sin(1)+cos(1)*(x-1); }
real g2(real x) { return sin(2)+cos(2)*(x-2); }
real g3(real x) { return sin(3)+cos(3)*(x-3); }

real ymin=-1.5;
real ymax= 1.5;

bool3 boundf(real x) { real y=f(x);   return ymin <= y && y <= ymax; }
bool3 boundg1(real x) { real y=g1(x); return ymin <= y && y <= ymax; }
bool3 boundg2(real x) { real y=g2(x); return ymin <= y && y <= ymax; }
bool3 boundg3(real x) { real y=g3(x); return ymin <= y && y <= ymax; }

real xmin=0;
real xmax=4;

draw(graph(f,cond=boundf,xmin,xmax,operator --));
draw(graph(g1,cond=boundg1,xmin,xmax,operator ..),dashed);
draw(graph(g2,cond=boundg2,xmin,xmax,operator ..),dashed);
draw(graph(g3,cond=boundg3,xmin,xmax,operator ..),dashed);

function tangent(pair lp, real x0, string txt, function g)
{
  pair lp=(1,0);
  real x0=0.33;
  draw(lp..(x0,g(x0)),ArcArrow);
  label("$\sin x$",lp,E);
}
  
{
  pair lp=(1,0);
  real x0=0.33;
  draw(lp..(x0,f(x0)),ArcArrow);
  label("$\sin x$",lp,E);
}

tangent((1,2.25),0.5,"$\sin 1+(\cos 1) h_1$");
// {
//   pair lp=(1,2.25);
//   real x0=0.5;
//   draw(lp..(x0,g1(x0)),ArcArrow);
//   label("$\sin 1+(\cos 1) h_1$",lp,E);
// }

{
  pair lp=(2,2);
  real x0=1.25;
  draw(lp..(x0,g2(x0)),ArcArrow);
  label("$\sin 2 +(\cos2) h_2$",lp,E);
}

{
  pair lp=(3,1.75);
  real x0=2.25;
  draw(lp..(x0,g3(x0)),ArcArrow);
  label("$\sin 3+(\cos 3) h_3$",lp,E);
}

xaxis("$x$",Bottom,LeftTicks(Label(fontsize(8pt)),new real[]{0,1,2,3}));
yaxis("$y$",Left,RightTicks(Label(fontsize(8pt)),new real[]{-1,-0.5,0,0.5,1}));
//xaxis("$h$",xmin=-X,xmax=X,Bottom,
//      LeftTicks(Label(fontsize(8pt)),new real[]{-X,0,X}));
//yaxis("$y$",ymin=0,ymax=2,Left,
//      RightTicks(Label(fontsize(8pt)),new real[]{1-2*X,1-X,1,1+X,1+2*X}));

//xlimits(-1.1,2);
//ylimits(-2.2,2.0);
//crop();
