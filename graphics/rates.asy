import graph;
import math;

real pi=4*atan(1);
real xmin=-2;
real xmax= 2;

real ymin= 0;
real ymax= 3;

unitsize(4*2.54cm/(xmax-xmin));
defaultpen(fontsize(10pt));
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

real f(real x) { return exp(x); }
real g0(real x) { return 1; }
real g1(real x) { return 1+x; }
real g2(real x) { return 1+x+x**2/2; }

bool3 boundf(real x) { real y=f(x);   return ymin <= y && y <= ymax; }
bool3 boundg0(real x) { real y=g0(x);   return ymin <= y && y <= ymax; }
bool3 boundg1(real x) { real y=g1(x);   return ymin <= y && y <= ymax; }
bool3 boundg2(real x) { real y=g2(x);   return ymin <= y && y <= ymax; }

real x=0;
real h=0.75;
real tic=0.1;
real hup=0.25;

draw((x+h/3,hup)--(x,hup),arrow=Arrow(TeXHead));
draw((x+2*h/3,hup)--(x+h,hup),arrow=Arrow(TeXHead));
label("$h$",(x+h/2,hup));

draw((x+h,0)--(x+h,ymax),dotted);
draw((x,0)--(x,f(x)+hup),dotted);

{
  draw(graph(g0,cond=boundg0,xmin,xmax,operator --),dashed);
  pair lp=(-0.32,2.15);
  real x0=-0.25;
  labpath(lp,x0,g0,"$1$",W);
}

{
  draw(graph(g1,cond=boundg1,xmin,xmax+1,operator --),dashed);
  pair lp=(-0.07,2.40);
  real x0=1.2;
  labpath(lp,x0,g1,"$1+h$",W);
}

{
  draw(graph(g2,cond=boundg2,xmin,xmax,operator --),longdashed);
  pair lp=(0.25,2.65);
  real x0=log(2.65);
  labpath(lp,x0,g2,"$1+h+\frac{h^2}{2}$",W);
}

{
  draw(graph(f,cond=boundf,xmin,xmax,operator --));
  pair lp=(-0.25,2.9);
  real x0=log(2.7);
  labpath(lp,x0,f,"$e^h$",W);
}



yaxis("$y$",ymin=ymin,ymax=ymax,Left,RightTicks(new real[]{0,1,2,3}));
xaxis("$h$",xmin=-2,xmax=2,axis=Bottom,LeftTicks(new real[]{-1,0,1,2}));

real xo = xmax-1;

draw((x+h,f(x+h))--(xo+4*hup,f(x+h)),dotted);
dot((x+h,f(x+h)));

draw((xo+1.5*hup,0.6*f(x+h)+0.4*g0(x+h))--(xo+1.5*hup,f(x+h)),arrow=Arrow(TeXHead));
draw((xo+1.5*hup,0.6*g0(x+h)+0.4*f(x+h))--(xo+1.5*hup,g0(x+h)),arrow=Arrow(TeXHead));
label("$o(h^0)$",(xo+1.5*hup,(f(x+h)+g0(x+h))/2));
draw((x+h,g0(x+h))--(xo+2*hup,g0(x+h)),dotted);
dot((x+h,g0(x+h)));

draw((xo+2.5*hup,0.7*f(x+h)+0.3*g1(x+h))--(xo+2.5*hup,f(x+h)),arrow=Arrow(TeXHead));
draw((xo+2.5*hup,0.7*g1(x+h)+0.3*f(x+h))--(xo+2.5*hup,g1(x+h)),arrow=Arrow(TeXHead));
label("$o(h^1)$",(xo+2.5*hup,0.5*g1(x+h)+0.5*f(x+h)));
draw((x+h,g1(x+h))--(xo+3*hup,g1(x+h)),dotted);
dot((x+h,g1(x+h)));
    
draw((xo+3.5*hup,f(x+h)+tic)--(xo+3.5*hup,f(x+h)),arrow=Arrow(TeXHead));
draw((xo+3.5*hup,g2(x+h)-tic)--(xo+3.5*hup,g2(x+h)),arrow=Arrow(TeXHead));
label("$o(h^1)$",(xo+2.5*hup,0.5*g1(x+h)+0.5*f(x+h)));
// draw((xo+3.5*hup,g2(x+h))--(xo+3.5*hup,f(x+h)),arrow=Arrows(TeXHead));
label("$o(h^2)$",(xo+3.5*hup,f(x+h)+tic),N);
draw((x+h,g2(x+h))--(xo+4*hup,g2(x+h)),dotted);
dot((x+h,g2(x+h)));
