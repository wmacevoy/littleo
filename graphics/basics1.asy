import graph;
import math;

real X=1;

unitsize(3cm/(2*X));
defaultpen(fontsize(6pt));

typedef real r_r(real x);
typedef bool3 r_b3(real x);

void labpath(pair lp, real x0, r_r g, string tex, pair dir)
{
  real m=(g(x0+1e-6)-g(x0-1e-6))/(2e-6);
  pair u=(-m,1)/sqrt(m*m+1);
  pair p0=(x0,g(x0));
  if (p0.y>lp.y) {
    u=-u;
  }

  draw(lp..(lp-0.1*dir)..((x0,g(x0))+0.1*u)..(x0,g(x0)),arrow=Arrow(TeXHead));
  label(tex,lp,dir);
}

real f(real x) { return (1+x)**3; }
real g(real x) { return (1+3*x); }

real ymin=0,ymax=4;

bool3 boundf(real x) { real y=f(x); return ymin <= y && y <= ymax; }
bool3 boundg(real x) { real y=g(x); return ymin <= y && y <= ymax; }

draw(graph(f,cond=boundf,-X,X,operator ..));
draw(graph(g,cond=boundg,-X,X,operator ..),dashed);
labpath((0.25,3.5),0.4,f,"$y=(1+h)^3$",NW);
labpath((0.5,1.5),0.4,g,"$y=1+3h$",SE);

draw((0,0)--(0,f(0)),dotted);
draw((0,f(0))--(-X,f(0)),dotted);

xaxis("$h$",Bottom,LeftTicks(Label(fontsize(8pt)),new real[]{-X,0,X}));
yaxis("$y$",Left,RightTicks(Label(fontsize(8pt)),new real[]{1-2*X,1-X,1,1+X,1+2*X,1+3*X}));
