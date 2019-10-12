import graph;
import math;

real X=2.5*1.25;

unitsize(3cm/(2*X)); // size(4cm,0);
defaultpen(fontsize(6pt));

real f(real x) { return (x*x+1)/(x*x-1); }
bool3 p(real x) { return (abs(x) != 1) && abs(f(x))<3; }

real w(real x) { return 0.05*sin(20*x); }
void end(real x,bool in) {
  if (in) {
    filldraw(circle(x,0.075),white);
  } else {
    filldraw(circle(x,0.075),black);
  }
}

path xax=(-X,0)--(X,0);
draw(xax,Arrows);
//yaxis("$y$",Arrows);
draw(graph(f,cond=p,-X,X,operator ..));
draw((-X,2)--(X,2),dashed);
draw((-X,-2)--(X,-2),dashed);

real x=-sqrt(3); string lab="${\scriptstyle-\sqrt{3}}$";
draw((x,0)--(x,f(x)),dashed+fontsize(8pt));
label(lab,(x,0),S);

real x=sqrt(3); string lab="${\scriptstyle+\sqrt{3}}$";
draw((x,0)--(x,f(x)),dashed+fontsize(8pt));
label(lab,(x,0),S);

real x=-1/sqrt(3); string lab="$\frac{-1}{\sqrt{3}}$";
draw((x,0)--(x,f(x)),dashed);
label(lab,(x,0),N);

real x=1/sqrt(3); string lab="$\frac{+1}{\sqrt{3}}$";
draw((x,0)--(x,f(x)),dashed);
label(lab,(x,0),N);

label("$+2$",(X,2),E);
label("$-2$",(X,-2),E);

draw(graph(w,-X,-sqrt(3),operator ..));
draw(graph(w,-1/sqrt(3),1/sqrt(3),operator ..));
draw(graph(w,sqrt(3),X,operator ..));
end(-sqrt(3),true);
end(-1/sqrt(3),true);
end(1/sqrt(3),true);
end(sqrt(3),true);
