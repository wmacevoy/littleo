import graph;
import math;
size(4cm);

real pi=3.14159;
real theta=2*pi/6;
real x=cos(theta);
real y=sin(theta);

path xax=(-1.33,0)--(1.33,0);
path yax=(0,-1.33)--(0,1.33);

draw(xax,black);
draw(yax,black);
// draw(yax,Arrows);

//draw((0,y)--(x,y),dashed);
//draw((x,0)--(x,y),dashed);
dot((x,y));
label("${\scriptstyle(\cos a,\sin a)}$",(x+0.4,y),N);
//dot("$(0,0)$",(0,0),NE);
// draw(arc((0,0),1.0,degrees(theta),90),dashed);
draw(arc((0,0),1.0,120,90),black,Arrow);
draw(arc((0,0),1.0,150,180),black,Arrow);
draw(arc((0,0),1.0,210,180),black,Arrow);
draw(arc((0,0),1.0,240,270),black,Arrow);
draw(arc((0,0),1.0,300,270),black,Arrow);
draw(arc((0,0),1.0,330,360),black,Arrow);
draw(arc((0,0),1.0,0,degrees(theta/3)),black);
draw(arc((0,0),1.0,degrees(2*theta/3),degrees(theta)),black,Arrow,PenMargins);
draw((x/3,y/3)--(0,0),black,Arrow);
draw((2*x/3,2*y/3)--(x,y),black,Arrow);
label("$1$",(x/2,y/2));
label("$a$",(cos(theta/2),sin(theta/2)));
label("$\frac{\pi}{2}$",(Cos(135),Sin(135)));
label("$\frac{\pi}{2}$",(Cos(225),Sin(225)));
label("$\frac{\pi}{2}$",(Cos(315),Sin(315)));
dot((1,0));
//label("$x=\cos a$",(0,-0.15),SE);
//label("$y=\sin a$",(0,-0.50),SE);
//draw("$1$",(0,0)--(x,y),black,Arrows);
