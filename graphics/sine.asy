import graph;
import math;
defaultpen(fontsize(8pt));
// size(3cm,0);
unitsize(1cm);

real pi=4*atan(1);
real xmin=0;
real xmax=4;

real ymin=-1.5;
real ymax= 1.5;

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

real f(real x) { return sin(x); }

bool3 boundf(real x) { real y=f(x);   return ymin <= y && y <= ymax; }

{
  draw(graph(f,cond=boundf,xmin,xmax,operator --));
  pair lp=(2.5,0);
  real x0=2;
  labpath(lp,x0,f,"$\sin x$",S);
}

struct G
{
  real x0;
  string x0tex;
  real x1;
  pair lp;
  pair dir=E;
  string tex;

  real at(real x) {
    return f(x0)+((f(x0+1e-6)-f(x0-1e-6))/(2e-6))*(x-x0);
  }
  bool3 in(real x) {
    real y=at(x);
    return ymin <= y && y <= ymax;
  }
  void draw() {
    draw(graph(at,cond=in,xmin,xmax,operator ..),dashed);
    if (tex != "") {
      labpath(lp,x1,at,tex,dir);
    }
    draw((x0,ymin)--(x0,f(x0)+0.1),dotted);
    label("$"+x0tex+"$",(x0,ymin),S);
  }
};

{
  G g;

  g.x0=1;
  g.x0tex="1";
  g.tex="$\sin "+g.x0tex+"+(\cos "+g.x0tex+") (x-"+g.x0tex+")$";
  g.lp=(1,2.25);
  g.x1=0.5;
  g.draw();
}

{
  G g;
  g.x0=pi;
  g.x0tex="\pi";
  g.tex="$\sin "+g.x0tex+"+(\cos "+g.x0tex+") (x-"+g.x0tex+")$";
  g.lp=(pi,1.75);
  g.x1=2.2;
  g.draw();
}
draw((-xmin,ymin)--(xmax,ymin));
yaxis("$y$",Left,RightTicks(new real[]{-1,-0.5,0,0.5,1}));
