import math

def integrate(f,a,b,epl=1e-6,delta=None,f0=None):
  x=(a+b)/2.0
  dx=(b-a)
  if f0 is None:
    f0=f(x)
#         (math.sqrt(3.0/20.0))
  h=dx*(0.387298334620741688517926539978239961083292170529159082658757)
  fa1=f(x-h)
  fb1=f(x+h)
  i1=((4.0/9.0)*f0+(2.5/9.0)*(fa1+fb1))
  if delta is None or dx <= delta:
    if math.fabs(i1-f0)>dx*dx*math.fabs(f0):
        if math.fabs(i1-f0) <= epl:
            return dx*i1
    else:
        if math.fabs((i1-f0)*math.pow(dx,8)) <= epl:
            return dx*i1

#          (math.sqrt(3.0/5.0)-0.5)
  h2=(b-a)*(0.274596669241483377035853079956479922166584341058318165317515)
  a2=x-h2
  b2=x+h2

  return integrate(f,a,a2,epl,delta,fa1)+ \
         integrate(f,a2,b2,epl,delta,f0)+ \
         integrate(f,b2,b,epl,delta,fb1)
