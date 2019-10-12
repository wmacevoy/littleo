import graph;
import math;

real xmax=100;
real xmin=-100;

size(3cm,IgnoreAspect);
// unitsize(3cm/(xmax-xmin));
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

  draw(lp--(lp-0.1*dir)..((x0,g(x0))+0.1*u)--(x0,g(x0)),arrow=Arrow(TeXHead));
  label(tex,lp,dir);
}

real f(real k) { return 2*k**3+5*k**2-7*k+3; }
real g(real k) { return 2*k**3; }

real f10(real k) { return 2*(k/10)**3 + 5*(k/10)**2 - 7*(k/10) + 3; }
real g10(real k) { return 2*(k/10)**3; }

real ymin=xmin**3,ymax=xmax**3;

bool3 boundf(real x) { real y=f(x); return ymin <= y && y <= ymax; }
bool3 boundg(real x) { real y=g(x); return ymin <= y && y <= ymax; }

draw(graph(f,cond=boundf,xmin,xmax,operator --));
draw(graph(g,cond=boundg,xmin,xmax,operator --),dashed);

xaxis("$k$",Bottom,LeftTicks(new real[]{xmin/2,0,xmax/2}));
yaxis(Left,RightTicks(new real[]{ymin/2,0,ymax/2}));

labpath((xmin/2,ymax),60,f,"$\begin{array}{c}2k^3+5k^2\\\ -7k+3\end{array}$",N);
labpath((0,ymin/2),-50,g,"$2k^3$",E);
