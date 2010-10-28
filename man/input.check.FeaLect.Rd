\name{input.check.FeaLect}
\Rdversion{1.1}
\alias{input.check.FeaLect}

\title{	Checks the inputs to Fealect() function.}

\description{We should have: F as a matrix, L as a vector, and length of L be equal to number of rows of F.
	They should have names accordingly. }

\usage{
input.check.FeaLect(F_, L_, maximum.features.num, gamma)
}

\arguments{
  \item{F_}{
	The feature matrix, each column is a feature.}
	
  \item{L_}{
	The vector of labels named according to the rows of F.}	
	
  \item{maximum.features.num}{ 
	Upto this number of features are allowed to contribute to each linear model.}

  \item{gamma}{
	A value in range 0-1 that determines the relative size of sample subsets.}
}

\details{
	If the input is not appropriate, error or warning message will be produced.
}

\value{
	Returns a list of: 
	  \item{F_}{
		The feature matrix, each column is a feature.}
	
	  \item{L_}{
		The vector of labels named according to the rows of F.}	
	
	  \item{maximum.features.num}{ 
		Upto this number of features are allowed to contribute to each linear model.}

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

checked <- input.check.FeaLect(F_=F, L_=L, maximum.features.num=10, gamma=3/4)

}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{regression}
\keyword{multivariate}
\keyword{classif}
\keyword{models}
\keyword{error}
\keyword{misc}
\keyword{debugging}







