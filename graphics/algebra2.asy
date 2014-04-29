import graph;
import math;
size(4cm);
real eps=0.3;
real X=2.5;

real f(real x) { return (x*x+1)/(x*x-1); }
real w(real x) { return 0.05*sin(20*x); }
void end(real x,bool in) {
  if (in) {
    filldraw(circle(x,0.075),white);
  } else {
    filldraw(circle(x,0.075),black);
  }
}

path xax=(-1.25*X,0)--(1.25*X,0);
draw(xax,Arrows);
//yaxis("$y$",Arrows);
draw(graph(f,-X,-1-eps,operator ..));
draw(graph(f,1+eps,X,operator ..));
draw(graph(f,-1+eps,1-eps,operator ..));
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

label("$+2$",(X*(1.1),2),E);
label("$-2$",(X*(1.1),-2),E);

draw(graph(w,-X*1.25,-sqrt(3),operator ..));
draw(graph(w,-1/sqrt(3),1/sqrt(3),operator ..));
draw(graph(w,sqrt(3),X*1.25,operator ..));
end(-sqrt(3),true);
end(-1/sqrt(3),true);
end(1/sqrt(3),true);
end(sqrt(3),true);
