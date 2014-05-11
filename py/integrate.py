import math

def integrate(f,a,b,errmax,hmax=None,fa=None,fb=None,depth=0):
  if depth > 54: return 0 # interval width is numerically zero

  if fa is None: fa=f(a) # saved values on recursions
  if fb is None: fb=f(b) # for efficiency

  x=0.5*(a+b) # midpoint
  fx=f(x)     
  h=b-a

  if hmax is None or h <= hmax:
    # i1a = integral(f,a,b)+o(h) for f in C^0
    i1a=fa*h

    # i1b = integral(f,a,b)+o(h) for f in C^0
    i1b=fb*h

    # i2 = integral(f,a,b)+o(h^2) for f in C^1
    i2=fx*h

    # i4 = integral(f,a,b)+o(h^4) for f in C^3
    i4=((2.0/3.0)*fx+(1.0/6.0)*(fa+fb))*h

    # err42=|i4-i2|=o(h^2) for f in C^3
    err42=math.fabs(i4-i2)

    # err21=|i2-i1a|+|i2-i1b|=o(h) for f in C^1
    err21=max(math.fabs(i2-i1a),math.fabs(i2-i1b))

    # if err42 is small compared to err21, then
    #   f is probably smooth (in C^3), so
    #     i4=integral(f,a,b)+o(h^4),
    #   so use a more optimistic error estimate
    if err42<=h*err21:
      err=h*h*err42
    else:
      err=err42

    if err <= errmax:
      return i4

  # otherwise, subdivide the interval
  return integrate(f,a,x,0.5*errmax,hmax,fa,fx,depth+1)+ \
         integrate(f,x,b,0.5*errmax,hmax,fx,fb,depth+1)
