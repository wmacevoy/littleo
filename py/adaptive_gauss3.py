import math

def integrate(f,a,b,epl,dxmax=None,f0=None,depth=0):
  x=(1.0/2.0)*(a+b)
  dx=(b-a)
  if f0 is None:
    f0=f(x)
#      (math.sqrt(3.0/20.0))
  h=dx*(0.387298334620741688517926539978239961083292170529159082658757)
  fa1=f(x-h)
  fb1=f(x+h)

  if dxmax is None or dx <= dxmax:
    i1=((8.0/18.0)*f0+(5.0/18.0)*(fa1+fb1))
    smooth=(math.fabs(i1-f0)<=0.1*(math.fabs(f0-fa1)+math.fabs(f0-fb1)))
    err=math.fabs(i1-f0)
    if smooth:
      err=err*math.pow(dx,8)
    if err <= epl:
      return dx*i1
    if not smooth:
      dxmax=0.025*dx

#       (math.sqrt(3.0/5.0)-0.5)
  h2=dx*(0.274596669241483377035853079956479922166584341058318165317515)
  a2=x-h2
  b2=x+h2

  return integrate(f,a,a2,epl,dxmax,fa1,depth+1)+ \
         integrate(f,a2,b2,epl,dxmax,f0,depth+1)+ \
         integrate(f,b2,b,epl,dxmax,fb1,depth+1)
