## @file likelihood.plt
## @brief plot likelihood function
## \f[
##  B(p,k;n) = {k\choose n} p^k(1-p)^{n-k}
## \f]
##
## @par
## Given an event which may happen with probability \f$p\f$ (or not happen with probability
## \f$1-p\f$) the binomial distribution gives the probability of observing \f$k\f$ times
## the event out of \f$n\f$ tries.

## @par
## I use the \f$\Gamma\f$-function as a factorial since \f$\Gamma(n+1) = n!\f$.
## Then I define the binomial function
## \f[
## {k\choose n} = \frac{n!}{(n-k)!k!} = \frac{\Gamma(n+1)}{\Gamma(n-k+1)\Gamma(k+1)}.
## \f]
binom(y,x) = ( gamma( x + 1 ) / ( gamma( x - y + 1 ) * gamma( y + 1 ) ) )


## The argument is a probability so \f$x\f$ runs in \f$[0,1]\f$.
set xrange [0:1]

set autoscale

set title "binomial distributions"
set xlabel "probability (for event to happen) p"
set ylabel "number of k successes"

n = 30
plot for [i=0:n:3] ( x ** i ) * ( ( 1. - x ) ** ( n - i ) ) * binom( i, n ) title sprintf( "B(p,%d;%d)", i, n)
