\name{random.subset}
\Rdversion{1.1}
\alias{random.subset}

\title{Selects a random subset of the  input.}

\description{
	If a subset of samples are selected randomly, the navigate of positive classes might be too sparse or even empty. 
	This function will repeat sampling until the classes are appropriate in this sense.
}

\usage{
random.subset(F_, L_, gamma, persistence = 1000, minimum.class.size=2, replace)
}

\arguments{
  \item{F_}{
	The feature matrix, each column is a feature.}

  \item{L_}{
	The vector of labels named according to the rows of F.}
	
  \item{gamma}{
	A value in range 0-1 that determines the relative size of sample subsets.}
	
  \item{persistence}{
	Maximum number of tries for randomly choosing.samples,
	If we try this many times and the obtained labels are all the same,
	we give up (maybe the whole labels are the same) with the error message: " Not enough variation in the labels...".}
	
  \item{minimum.class.size}{
  	A lower bound on the number of samples in each class.}

  \item{replace}{
	If TRUE, sampling is done by replacement.}
}

\details{
 The function also returns a refined feature matrix by ignoring too sparse features after sampling.}


\value{
	Returns a list of: 
	  \item{X_}{
		The sampled feature matrix, each column is a feature after ignoring the redundant ones.}
	
	  \item{Y_}{
		The vector of labels named according to the rows of X_.}	
	
	  \item{remainder.samples}{ 
		The names of the rows of F_ which do not appear in X_, later on can be used for validation.}
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
message(dim(F)[1], " samples and ",dim(F)[2], " features.")

XY <- random.subset(F_=F, L_=L, gamma=3/4,replace=TRUE)
XY$remainder.samples

}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{regression}
\keyword{multivariate}
\keyword{classif}
\keyword{models}















