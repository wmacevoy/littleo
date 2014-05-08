import graph;
import math;
defaultpen(fontsize(8pt));
// size(3cm,0);
unitsize(1cm);

real f(real x) { return sin(x); }
real g1(real x) { return sin(1)+cos(1)*(x-1); }
real g2(real x) { return sin(sqrt(2))+cos(sqrt(2))*(x-sqrt(2)); }
real g3(real x) { return sin(3)+cos(3)*(x-3); }

real ymin=-1.5;
real ymax= 1.5;

bool3 boundf(real x) { real y=f(x);   return ymin <= y && y <= ymax; }
bool3 boundg1(real x) { real y=g1(x); return ymin <= y && y <= ymax; }
bool3 boundg2(real x) { real y=g2(x); return ymin <= y && y <= ymax; }
bool3 boundg3(real x) { real y=g3(x); return ymin <= y && y <= ymax; }

real xmin=0;
real xmax=4;

// draw(graph(g1,cond=boundg1,xmin,xmax,operator ..),dashed);
// draw(graph(g2,cond=boundg2,xmin,xmax,operator ..),dashed);
// draw(graph(g3,cond=boundg3,xmin,xmax,operator ..),dashed);

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

void tangent(pair lp, real x0, string tex, r_r g, r_b3 p)
{
  draw(graph(g,cond=p,xmin,xmax,operator ..),dashed);
  labpath(lp,x0,g,tex,E);
}
  
{
  draw(graph(f,cond=boundf,xmin,xmax,operator --));
  pair lp=(1,0);
  real x0=0.33;
  labpath(lp,x0,f,"$\sin x$",E);
}

tangent((1,2.30),0.5,"$\sin 1+(\cos 1) (x-1)$",g1,boundg1);
tangent((sqrt(2),2), 1.10, "$\sin \sqrt{2} +(\cos \sqrt{2}) (x-\sqrt{2})$",g2,boundg2);
tangent((3,1.70),2.10,"$\sin 3 +(\cos 3) (x-3)$",g3,boundg3);

xaxis("$x$",Bottom,LeftTicks(Label(fontsize(8pt)),new real[]{0,1,2,3}));
yaxis("$y$",Left,RightTicks(Label(fontsize(8pt)),new real[]{-1,-0.5,0,0.5,1}));
