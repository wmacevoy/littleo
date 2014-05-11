#include <math.h>
#include <stdio.h>

struct integrate_info 
{
  double (*f)(double x, void *misc);
  double epl;
  double hmax;
  void *misc;
};

double integrate_recursive(struct integrate_info *info, 
                           double a, double b, double fa, double fb, int depth)
{
  double x,h,fx;

  if (depth > 53) return 0.5*(b-a)*(fa+fb);
  x=0.5*(a+b);
  fx=info->f(x,info->misc);
  h=b-a;

  if (h <= info->hmax) {
    double i,err;
    i=((2.0/3.0)*fx+(1.0/6.0)*(fa+fb));
    err=fabs(i-fx);
    if (err <= h*(fabs(fa-fx)+fabs(fb-fx))) {
      err *= h*h;
    }
    if (err <= info->epl) return i*h;
  }

  return integrate_recursive(info,a,x,fa,fx,depth+1)+
    integrate_recursive(info,x,b,fx,fb,depth+1);
}

double integrate(double (*f)(double x), 
                 double a, double b, double errmax, double hmax)
{
  struct integrate_info info;
  info.f=(double (*)(double x,void *misc))f;
  info.epl=fabs(b-a)*errmax;
  info.hmax=hmax;
  info.misc=0;
  return integrate_recursive(&info,a,b,f(a),f(b),0);
}

double integrate_misc(double (*f)(double x, void *misc), void *misc,
                      double a, double b, double errmax, double hmax)
{
  struct integrate_info info;
  info.f=f;
  info.epl=errmax/(b-a);
  info.hmax=hmax;
  info.misc=misc;
  return integrate_recursive(&info,a,b,f(a,misc),f(b,misc),0);
}

struct ex_misc
{
  int mode;
  int count;
};

double ex1(double x, struct ex_misc *info)
{
  double p=-0.5;
  double x0=sqrt(0.5);
  if (info->mode == 0) {
    ++info->count;
    return (x <= x0) ? 0.0 : pow((x-x0),p);
  } else {
    return (x <= x0) ? 0.0 : (1.0/(p+1))*pow((x-x0),(p+1.0));
  }
}

double ex2(double x, struct ex_misc *info)
{
  if (info->mode == 0) {
    ++info->count;
    return sin(x);
  } else {
    return -cos(x);
  }
}

double ex3(double x, struct ex_misc *info)
{
  double x0=sqrt(0.5);
  if (info->mode == 0) {
    ++info->count;
    return (x <= x0) ?  0 : 1;
  } else {
    return (x <= x0) ?  0 : (x-x0);
  }
}

double ex4(double x, struct ex_misc *info)
{
  double c0=1,c1=2,c2=3,c3=4,c4=5,c5=6;
  if (info->mode == 0) {
    ++info->count;
    return ((((c5*x+c4)*x+c3)*x+c2)*x+c1)*x+c0;
  } else {
    return (((((c5/6*x+c4/5)*x+c3/4)*x+c2/3)*x+c1/2)*x+c0/1)*x;
  }
}

double (*f[])(double x, struct ex_misc *misc) = {ex1,ex2,ex3,ex4};

int main()
{
  double a=0;
  double b=1;
  double errmax=1e-6;
  double hmax=1;

  for (int i=0; i<4; ++i) {
    struct ex_misc misc;
    misc.count=0;
    misc.mode=0;
    double numeric=integrate_misc((double (*)(double x,void *misc))f[i],&misc,a,b,errmax,hmax);
    misc.mode=1;
    double exact=f[i](b,&misc)-f[i](a,&misc);
    double err=(numeric-exact)/errmax;
    printf("int(f%d,x=%lf..%lf)=%lg+(%lg), err/errmax=%lg, evals=%d\n",i,a,b,exact,numeric-exact,
           err,misc.count);
  }
  return 0;
}
