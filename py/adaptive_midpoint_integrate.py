import math

def integrate(f,a,b,epl=1e-6,delta=None,f0=None):
  global F

  x=(a+b)/2.0
  dx=(b-a)
  if f0 is None:
    f0=f(x)

  h=dx/3.0
  fa1=f(x-h)
  fb1=f(x+h)
  i1=(6.0/24.0)*f0+(9.0/24.0)*(fa1+fb1)
  if delta is None or dx <= delta:
      if math.fabs((i1-f0))>dx*dx*math.fabs(f0):
          if math.fabs((i1-f0)) <= epl:
              return dx*i1
      else:
          if math.fabs((i1-f0)*pow(dx,4)) <= epl:
              return dx*i1
  h2=dx/6.0
  a2=x-h2
  b2=x+h2
  return integrate(f,a,a2,epl,delta,fa1)+ \
         integrate(f,a2,b2,epl,delta,f0)+ \
         integrate(f,b2,b,epl,delta,fb1)
