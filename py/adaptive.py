import math

def integrate(f,a,b,errmax=None,hmax=None,fa=None,fb=None,depth=0):
  if depth == 0:
    if hmax is None: hmax=0.2*(b-a)
    if errmax is None: errmax=1e-12
    errmax=(errmax)/(b-a)
    fa=f(a)
    fb=f(b)
  elif depth >= 53:
    return 0.5*(b-a)*(fa+fb)

  x=0.5*(a+b)
  fx=f(x)     
  h=b-a

  if h <= hmax:
    i=((2.0/3.0)*fx+(1.0/6.0)*(fa+fb))
    err=math.fabs(i-fx)
    if err <= h*(math.fabs(fa-fx)+math.fabs(fb-fx)):
      err=h*h*err
    if err <= errmax:
      return i*h

  return integrate(f,a,x,errmax,hmax,fa,fx,depth+1)+ \
         integrate(f,x,b,errmax,hmax,fx,fb,depth+1)
