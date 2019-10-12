import graph;
import math;
defaultpen(fontsize(6pt));
unitsize(1cm);
real X=1.1;
real Y=4.0;

real f(real x) { return exp(x); }
real w(real x) { return 0.05*sin(20*x); }

//path xax=(-0.25*X,0)--(X,0);
//path yax=(-0.25*X,0)--(Y,0);
//draw(xax,Arrows);
//draw(yax,Arrows);
draw(graph(f,-X,X,operator ..));

real tic=0.1;
real x=0.5;

draw((-1.25,0)--(1.25,0));

draw((-1,0)--(-1,-tic)); label("$-1$",(-1,-tic),S);
draw((0,0)--(0,-tic)); label("$0$",(0,-tic),S);
draw((x,0)--(x,-tic)); label(rotate(-90)*"$x=\ln y$",(x,-tic),S);
draw((1,0)--(1,-tic)); label("$1$",(1,-tic),S);

{ real x0=-1;
  draw((x0,0)--(x0,f(x0)),dashed);
  dot((x0,f(x0)));
  label("$\frac{1}{e}=e^{-1}$",(x0+tic,f(x0)),NW);
}


{ real x0=0;
  draw((x0,0)--(x0,f(x0)),dashed);
  dot((x0,f(x0)));
  label("$1=e^0$",(x0,f(x0)),NW);
}

{ real x0=x;
  draw((x0,0)--(x0,f(x0)),dashed);
  dot((x0,f(x0)));
  label("$y=e^x$",(x0,f(x0)),NW);
}

{ real x0=1;
  //  draw((x0,0)--(x0,-tic));
  draw((x0,0)--(x0,f(x0)),dashed);
  dot((x0,f(x0)));
  label("$2.72 \approx e=e^1$",(x0,f(x0)),NW);
}
//  exp(x0))--(-1-tic,exp(-1))); label("$\frac{1}{e}$",(-1-tic,exp(-1)),W); }
// draw((-1,exp(-1/2))--(-1-tic,exp(-1/2))); label("$\frac{1}{\sqrt{e}}$",(-1-tic,exp(-1/2)),W);
// draw((-1,exp(0))--(-1-tic,exp(0))); label("$1$",(-1-tic,exp(0)),W);
// draw((-1,exp(1))--(-1-tic,exp(1))); label("$e$",(-1-tic,exp(1)),W);

// draw((-1,0)--(-1,exp(-1)),dashed);


