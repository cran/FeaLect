\name{doctor.validate}
\Rdversion{1.1}
\alias{doctor.validate}

\title{	Validates a model using validaing samples.}

\description{
	A model fitted on the training samples, can be validated on a separate validating set. The recall, precision, and accuracy of the model are computed. 
}

\usage{
doctor.validate(true.labels, predictions)
}

\arguments{
  \item{true.labels}{
	A vector of 0 and 1.
}

  \item{predictions}{
	A vector of 0 and 1.
}

}
\details{
	F-measure is equal to:  2 times precision times recall / (precision+recall).
}
\value{
	F-measure, precision, and recall are calculated. Also, the mis-labelled cases are reported.
}


\references{"Statistical Analysis of Overfitting Features", manuscript in preparation.}

\author{Habil Zare}

\seealso{
\code{\link{FeaLect}}, \code{\link{train.doctor}}, \code{\link{doctor.validate}}, 
\code{\link{random.subset}}, \code{\link{compute.balanced}},\code{\link{compute.logistic.score}}, 
\code{\link{ignore.redundant}}, \code{\link{input.check.FeaLect}}}



\examples{
tls <- c(1,1,1,0,0)
ps <- c(1,1,0,1,0)
names(tls) <- 1:5; names(ps) <- 1:5

doctor.validate(true.labels=tls, predictions=ps)

}


% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{regression}
\keyword{multivariate}
\keyword{classif}
\keyword{models}












