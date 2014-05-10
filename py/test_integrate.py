import math
import adaptive

c=0
x1=math.sqrt(0.5)
p1=-0.50

def fex1(x):
  global c
  global p1
  global x1
  c=c+1
  if x <= x1:
    return 0
  return math.pow((x-x1),p1)

def Fex1(x):
  global p1
  global x1

  if (x <= x1):
    return 0

  return (1.0/(p1+1.0))*math.pow(x-x1,p1+1.0)

def fex2(x):
  global c
  c=c+1
  return math.sin(x) 

def Fex2(x):
  return -math.cos(x)

p3=math.sqrt(0.5)
def fex3(x):
  global c
  global p3
  c=c+1
  if x<p3:
    return 0
  else:
    return 1

def Fex3(x):
  global p3
  if x<p3:
    return 0
  else:
    return x-p3

def fex4(x):
  global c
  c=c+1
  return 1+2*math.pow(x,1)+3*math.pow(x,2)+\
      4*math.pow(x,3)+5*math.pow(x,4)+6*math.pow(x,5)

def Fex4(x):
  return math.pow(x,1)+math.pow(x,2)+math.pow(x,3)+\
      math.pow(x,4)+math.pow(x,5)+math.pow(x,6)
       
def main():
  global c
  global f
  global F
  a=0
  b=1
  errmax=(b-a)*1e-6
#  dxmax=None

  for fF in [["ex1",fex1,Fex1],["ex2",fex2,Fex2],["ex3",fex3,Fex3],["ex4",fex4,Fex4]]:
    print fF[0]
    f=fF[1]
    F=fF[2]

    if (1):
      c=0
      ans=adaptive.integrate(f,a,b,errmax)
      err=ans-(F(b)-F(a))
      print "midpoint: c="+str(c)+" ,ans="+str(ans)+", err="+str(err)+", err/epl="+str(err/errmax)

if __name__ == "__main__":
    main()
