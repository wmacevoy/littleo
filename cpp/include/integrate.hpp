#include <cmath>
#include <limits>
#include <complex>

template <typename X, typename Y, typename F, typename Norm>
class integrate_recursive
{
public:
  F &f;
  Norm &norm;

  const X epl;
  const X hmax;
  int dmax;

  Y recursive(const X &a, const X &b, const Y &fa, const Y &fb, int d)
  {
    if (d >= dmax) return ((0.5)*(b-a))*(fa+fb);

    const X x=0.5*(a+b);
    const Y fx=f(x);
    const X h=b-a;
    
    if (h <= hmax) {
      const Y i=((2.0/3.0)*fx+(1.0/6.0)*(fa+fb));
      const Y nfx=(-1.0)*fx;
      X err=norm(i+nfx);
      X erra=norm(fa+nfx);
      X errb=norm(fb+nfx);
      
      if (err <= h*(erra+errb)) {
        err *= (h*h);
      }

      if (err <= epl) return h*i;
    }
    return recursive(a,x,fa,fx,d+1)+recursive(x,b,fx,fb,d+1);
  }

  integrate_recursive(F &_f, Norm &_norm, const X &_a, const X &_b, const X &_errmax,const X &_hmax, int _dmax)
    : f(_f), norm(_norm), epl(_errmax/(_b-_a)), hmax(_hmax), dmax(_dmax)
  {
  }
};

template <typename X, typename Y, typename F, typename Norm>
Y integrate(F &f, Norm &norm, const X &a, const X &b, const X &errmax, const X &hmax, int dmax)
{
  integrate_recursive<X,Y,F,Norm> ir(f,norm,a,b,errmax,hmax,dmax);
  return ir.recursive(a,b,f(a),f(b),0);
}
