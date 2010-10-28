\name{compute.logistic.score}
\Rdversion{1.1}
\alias{compute.logistic.score}

\title{Fits a logistic regression model using the linear scores}

\description{ A logistic regression model is fitted to the linear scores using lrm() function 
	and the logistic scores are computed using the formula: 1/(1+exp(-(a+bX))) where a and b are the logistic coefficients.}

\usage{
compute.logistic.score(F_, L_, considered.features, training.samples, validating.samples, linear.scores, report.fitting.failure = TRUE)}

\arguments{
  
  \item{F_}{
	The feature matrix, each column is a feature.}
  \item{L_}{
	The vector of labels named according to the rows of F.}
	
  \item{training.samples}{
  	The names of rows of F that should be considered as training samples.}
  	
  \item{validating.samples}{
  	The names of rows of F that should be considered as validating samples.}
  	
  \item{considered.features}{
  	The names of columns of F that determine the features of interest.}


  \item{linear.scores}{
	A vector that contains for each training or validating sample, a linear score predicted by the linear method.}
	
  \item{report.fitting.failure}{
	If TRUE, any failure in fitting the linear of logistic models will be printed.}
}

\details{The logistic regression will be fitted to all training and validating samples.}

\value{
	Returns a list of: 
	\item{logistic.scores}{A vector of predicted logistic values for all samples.}
	\item{logistic.cofs}{The coefficients that are computed by logistic regression.}
}

\references{"Statistical Analysis of Overfitting Features", manuscript in preparation.}

\author{Habil Zare}

\note{Logistic regression is also done on top of fitting the linear models.}


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
all.samples <- rownames(F); ts <- all.samples[5:10]; vs <- all.samples[c(1,22)]
L <- L[c(ts,vs)]
L

asymptotic.scores <- c(1,0.9,0.8,0.2,0.1,0.1,0.7,0.2)

compute.logistic.score(F_=F, L_=L, training.samples=ts, validating.samples=vs, considered.features=colnames(F),linear.scores= asymptotic.scores)

}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{regression}
\keyword{multivariate}
\keyword{classif}
\keyword{models}











