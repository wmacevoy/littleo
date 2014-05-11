#include <cmath>
#include <gmpxx.h>
#include <complex>
#include <vector>
#include <assert.h>
#include <iostream>
#include <iomanip>

template <typename F>
std::vector<F> operator+ (const std::vector<F> &a, const std::vector<F> &b)
{
  assert(a.size() == b.size());
  size_t n=a.size();
  std::vector<double> ans(a);
  for (size_t i=0; i<n; ++i) {
    ans[i] += b[i];
  }
  return ans;
}

template <typename F>
std::vector<F> operator* (const F &a, const std::vector<F> &b)
{
  std::vector<double> ans(b);
  for (size_t i=0; i<b.size(); ++i) {
    ans[i] *= a;
  }
  return ans;
}

double norm(double x) { return std::abs(x); }

template <typename F>
F norm(const std::complex<F> &z) { return hypot(real(z),imag(z)); }

template <typename F>
F maxnorm(const std::vector<F> &x) {
  F ans=0;
  for (auto &xi:x) {
    F nxi=norm(xi);
    if (nxi > ans) ans=nxi;
  }
  return ans;
}


#include "integrate.hpp"

int evals;

double norm1(const double  &x) { return std::abs(x); }
double f1(const double &x)
{
  ++evals;
  return (x <= sqrt(0.5)) ? 0 : std::pow(x-sqrt(0.5),-0.5);
}


typedef std::complex<double> C;

double norm2(const C &z) { return hypot(real(z),imag(z)); }

C f2(const double &x)
{
  ++evals;
  return exp(C(0,1)*x);
}

mpf_class norm3(const mpf_class &x) {
  return abs(x);
}

mpf_class f3(const mpf_class &x)
{
  ++evals;
  return sqrt(x+1);
}

double norm4(const std::vector<double> &x) {
  return maxnorm(x);
}

std::vector<double> f4(const double &x)
{
  ++evals;
  std::vector<double> ans(3,0.0);
  ans[0]=sqrt(x);
  ans[1]=(x <= sqrt(0.5)) ? 0 : 1/sqrt(x-0.5);
  ans[2]=sin(x);
  return ans;
}


int main()
{
  evals=0;
  double ans1 = integrate(f1,norm1,0.0,1.0,1e-6,1.0,53);
  std::cout << "ans1=" << std::setprecision(6) << ans1 << " evals=" << evals << std::endl;

  evals=0;
  C ans2  = integrate(f2,norm2,0.0,1.0,1e-6,1.0,53);
  std::cout << "ans2=" << std::setprecision(6) << ans2 << " evals=" << evals << std::endl;

  evals=0;
  mpf_class ans3  = integrate(f3,norm3,mpf_class(0.0,128),mpf_class(0.5,128),
                              mpf_class(1e-20),mpf_class(1.0),128);
  std::cout << "ans3=" << std::setprecision(30) << ans3 << " evals=" << evals << std::endl;

  evals=0;
  std::vector<double> ans4  = integrate(f4,norm4,0.0,1.0,1e-10,1.0,53);
  std::cout << "ans4=[" << std::setprecision(10);
  for (size_t i=0; i<ans4.size(); ++i) {
    if (i > 0) std::cout << ", ";
    std::cout << ans4[i];
  }
  std::cout << "]" << " evals=" << evals << std::endl;

  return 0;
}
