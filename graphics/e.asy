import graph;
import math;
//defaultpen(fontsize(8pt));
//size(3cm,0);
unitsize(2cm);

typedef real r_r(real x);
void labpath(pair lp, real x0, r_r g, string tex, pair dir)
{
  real m=(g(x0+1e-6)-g(x0-1e-6))/(2e-6);
  pair u=(-m,1)/sqrt(m*m+1);
  pair p0=(x0,g(x0));
  if (p0.y>lp.y) {
    u=-u;
  }

  draw(lp..(lp-0.01*dir)..((x0,g(x0))+0.01*u)..(x0,g(x0)),arrow=Arrow(TeXHead));
  label(tex,lp,dir);
}

real f(real x) { return (x != 0) ? (1+x)**(1/x) : exp(1); }
bool3 boundf(real x) { return (abs(x)<1) && (abs(f(x))<4); }
real g(real x) { return exp(1); }

real X=1;
draw(graph(f,cond=boundf,-X,X,operator ..));
draw(graph(g,-X,X,operator ..),dashed);
labpath((0,3.5),-0.25,f,"$(1+h)^{1/h}$",E);
// pair lf=(X,2.8183); draw(lf..(-0.08,f(-0.08)),ArcArrow); label("$(1+h)^{1/h}$",lf,E);
labpath((0.5,3.0),0.25,g,"$e$",E);
// pair lg=(X,(2.8183+2.7183)/2); draw(lg..(0.05,g(0.05)),ArcArrow); label("$e$",lg,E);

filldraw(circle((0,exp(1)),0.05),white);
xaxis("$h$",Bottom,LeftTicks(new real[]{-X,0,X}));
yaxis(Left,RightTicks(Label(fontsize(8pt)),new real[]{1.5,2,2.5,exp(1),3.0,3.5}));
//xaxis("$h$",xmin=-X,xmax=X,Bottom,
//      LeftTicks(Label(fontsize(8pt)),new real[]{-X,0,X}));
//yaxis("$y$",ymin=0,ymax=2,Left,
//      RightTicks(Label(fontsize(8pt)),new real[]{1-2*X,1-X,1,1+X,1+2*X}));

//xlimits(-1.1,2);
//ylimits(-2.2,2.0);
//crop();
