import math

def integrate(f,a,b,epl,dxmax=None,fa=f(a),fb=f(b),depth=0):
  if depth > 54:
    return 0

  dx=(b-a)
  x=(1.0/2.0)*(a+b)
  fx=f(x)

  if dxmax is None or dx <= dxmax:
    i1=((2.0/3.0)*fx+(1.0/6.0)*(fa+fb))
    smooth=(math.fabs(i1-fx)<=dx*(math.fabs(fa-fx)+math.fabs(fb-fx)))
    err=math.fabs(i1-fx)
    if smooth:
      err=err*math.pow(dx,4)
    if err <= epl:
      return dx*i1
    if not smooth:
      dxmax=0.1*dx

  return integrate(f,a,x,epl,dxmax,fa,fx,depth+1)+ \
         integrate(f,x,b,epl,dxmax,fx,fb,depth+1)
