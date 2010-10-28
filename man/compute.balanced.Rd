\name{compute.balanced}
\Rdversion{1.1}
\alias{compute.balanced}

\title{Balances between negative and positive samples by oversampling.}

\description{If negative samples are less than positive ones, more copies of the negative cases are added and vice versa.}


\usage{
compute.balanced(F_, L_)
}

\arguments{
  \item{F_}{
	The feature matrix, each column is a feature.}
  \item{L_}{
	The vector of labels named according to the rows of F.}
}


\details{	Considerably unbalanced classes may be probabilistic for fitting some models.}

\value{
	Returns a list of: 
	  \item{F_}{
		The feature matrix, each column is a feature.}
		
	  \item{L_}{
		The vector of labels named according to the rows of F.}	
}		


\references{"Statistical Analysis of Overfitting Features", manuscript in preparation.}

\author{Habil Zare}



\seealso{
\code{\link{FeaLect}}, \code{\link{train.doctor}}, \code{\link{doctor.validate}}, 
\code{\link{random.subset}}, \code{\link{compute.balanced}},\code{\link{compute.logistic.score}}, 
\code{\link{ignore.redundant}}, \code{\link{input.check.FeaLect}}}


\examples{
library(FeaLect)
data(mcl_sll)
F <- as.matrix(mcl_sll[ ,-1])	# The Feature matrix
L <- as.numeric(mcl_sll[ ,1])	# The labels
names(L) <- rownames(F)
message(L)

balanced <- compute.balanced(F_=F, L_=L)
message(balanced$L_)

}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{regression}
\keyword{multivariate}
\keyword{classif}
\keyword{models}





