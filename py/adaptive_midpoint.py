import math

def integrate(f,a,b,errmax,hmax=None,fa=None,fb=None,depth=0):
  if depth > 54: return 0 # interval width is numerically zero

  if fa is None: fa=f(a)
  if fb is None: fb=f(b)

  x=0.5*(a+b)
  fx=f(x)
  h=b-a

  if hmax is None or h <= hmax:
    i2=fx*h # + obar(h^2)
    i4=((2.0/3.0)*fx+(1.0/6.0)*(fa+fb))*h # + obar(h^4)
    err=math.fabs(i4-i2) # - obar(h^2)

    # if the error is small, the integral should be smooth
    # so scale the error estimate to be o(h^4), which is
    # a better estimate

    if err<=h*h*(math.fabs(fa-fx)+math.fabs(fb-fx)):
      err=err*h*h

    if err <= errmax:
      return i4

  # subdivide the interval and sum the results
  return integrate(f,a,x,0.5*errmax,hmax,fa,fx,depth+1)+ \
         integrate(f,x,b,0.5*errmax,hmax,fx,fb,depth+1)
