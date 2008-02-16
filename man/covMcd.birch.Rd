\name{covMcd.birch}
\alias{covMcd.birch}
\alias{covMcdBirch.refinement}
\title{Finding the Minimum Covariance Determinant using BIRCH}
\description{
A function that uses a birch object to find an approximate solution to
the MCD problem. The goal is to find a subset of size $alpha \times n$
with the smallest determinant of sample covariance. 
}
\usage{
covMcd.birch(birchObject, alpha=0.5, nsamp=100)
covMcdBirch.refinement(covOut, x, alpha=0.5) 
}
\arguments{
  \item{birchObject}{an object created by the function
    \code{birch}. Contains a CF-tree.}
  \item{alpha}{numeric parameter controlling the size of the subsets
    over which the determinant is minimized, i.e., alpha*n observations
    are used for computing the determinant. Allowed values are between
    0.5 and 1 and the default is 0.5.}
  \item{nsamp}{number of subsets used for initial estimates}
  \item{covOut}{the output from \code{covMcd.birch}}
  \item{x}{a data set on which to perform a set of concentration steps.}
}
\details{
  The algorithm has a the same objective function as \code{covMcd} from
  the robustbase package as described in \cite{Rousseeuw and Van
    Driessen (1999)}, except it uses a BIRCH object instead. The
  advantage of this approach is that it does not require the full
  data set to be held in memory and the solution space is
  smaller. Further details can be found in \cite{Harrington and
    Salibian-Barrera (2007)} and \cite{Harrington and
    Salibian-Barrera (2008)}.

  If further accuracy is desired, then an additional \dQuote{refinement}
  step can be done, which involves using the birch solution as an
  initial estimate for one set of concentration steps, this time using
  the whole data set (rather than the birch object). However, if birch
  has been used because the whole data set cannot fit in memory, then
  this extra step is not an option.

  A summary method is available for the output of this command.
}
\value{
  For \code{covMcd.birch}, returns a list containing:
  \item{zbar}{estimate of location}
  \item{Sz}{estimate of covariance}
  \item{Det}{the MCD}
  \item{best}{A list containing a vector of which subclusters make up the
    clustering (sub) and a vector with the underlying observations that make up the
    clusters (obs)}
}
\note{
  In order for this algorithm to produce meaningful results, the length
  of the birch  object be in the hundreds, and even better, thousands.
  }
  
\references{
  Harrington, J and Salibian-Barrera, M (2007) \dQuote{Finding
    Approximate Solutions to Combinatorial Problems with Very Large
    Datasets using BIRCH}, submitted to \emph{Statistical Algorithms
    and Software, 2nd Special Issue} Computational Statistics and Data
  Analysis. A draft can be found at \url{http://www.stat.ubc.ca/~harringt/birch/birch.pdf}.
  
  Harrington, J and Salibian-Barrera, M (2008) \dQuote{birch: Working
    with very large data sets}, submitted to \emph{Journal of
    Statistical
    Software}. A draft can be found at \url{http://www.stat.ubc.ca/~harringt/birch/birch-jss.pdf}. 

  Rousseeuw, P.J. and Van Driessen, K. (1999) \dQuote{A Fast Algorithm for
    the Minimum Covariance Determinant Estimator}, \emph{Technometrics}
\bold{41}, 212--223.
}
\author{
Justin Harrington \email{harringt@stat.ubc.ca} and Matias Salibian-Barrera \email{matias@stat.ubc.ca}
}
\seealso{\code{\link{birch}}, \code{\link{lts.birch}},
  \code{\link{rlga.birch}}, and the original algorithm  \code{\link[pkg:robustbase]{covMcd}}}
\examples{
data(birchObj)
covOut <- covMcd.birch(birchObj, 0.5)
summary(covOut)

## If the original data set was available
\dontrun{refOut <- covMcdBirch.refinement(covOut, x, 0.5)}
}
\keyword{robust}
\keyword{multivariate}