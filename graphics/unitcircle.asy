import graph;
import math;
size(4cm);

real pi=3.14159;
real theta=radians(35);
real x=cos(theta);
real y=sin(theta);

path xax=(-1.33,0)--(1.33,0);
path yax=(0,-1.33)--(0,1.33);

draw(xax,black);
draw(yax,black);
// draw(yax,Arrows);

draw((0,y)--(x,y),dashed);
draw((x,0)--(x,y),dashed);
real tic=0.4;
draw((x,0)--(x,-tic));
draw((0,-tic/2)--(x/5,-tic/2));
draw(((4/5)*x,-tic/2)--(x,-tic/2),ArcArrow);
label("${\scriptstyle \cos a}$",(x/2,-tic/2));

draw((0,y)--(-tic,y));
draw((-tic/2,0)--(-tic/2,y/3));
draw((-tic/2,2/3*y)--(-tic/2,y),ArcArrow);
label("${\scriptstyle \sin a}$",(-tic/2,y/2));

draw(arc((0,0),1.0,degrees(theta),90),dashed);
draw(arc((0,0),1.0,120,90),black);
draw(arc((0,0),1.0,150,180),black,ArcArrow);
draw(arc((0,0),1.0,210,180),black);
draw(arc((0,0),1.0,240,270),black,ArcArrow);
draw(arc((0,0),1.0,300,270),black);
draw(arc((0,0),1.0,330,360),black,ArcArrow);
draw(arc((0,0),1.0,0,degrees(theta/3)),black);
draw(arc((0,0),1.0,degrees(2*theta/3),degrees(theta)),black,ArcArrow,PenMargins);
draw((x/3,y/3)--(0,0),black);
draw((2*x/3,2*y/3)--(x,y),black,Arrow);
label("$\scriptstyle 1$",(x/2,y/2));
label("$\scriptstyle a$",(cos(theta/2),sin(theta/2)));
label("$\frac{\pi}{2}$",(Cos(135),Sin(135)));
label("$\frac{\pi}{2}$",(Cos(225),Sin(225)));
label("$\frac{\pi}{2}$",(Cos(315),Sin(315)));
dot((1,0));
//label("$x=\cos a$",(0,-0.15),SE);
//label("$y=\sin a$",(0,-0.50),SE);
//draw("$1$",(0,0)--(x,y),black,Arrows);
