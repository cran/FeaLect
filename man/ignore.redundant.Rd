\name{ignore.redundant}
\Rdversion{1.1}
\alias{ignore.redundant}

\title{Refines a feature matrix}


\description{If the value a feature is the same for all points (e.g. =0), it can be ignored.}

\usage{ignore.redundant(F, num.of.values = 1)}

\arguments{
	\item{F}{
		The feature matrix, each column is a feature.}
	\item{num.of.values}{
		A feature should have more than this threshold non-zero values not to be ignored.}
}


\value{The refined feature matrix.}

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
#F <- cbind(F, rep(1, times=dim(F)[1]))
message(dim(F)[1], " samples and ",dim(F)[2], " features.")

G <- ignore.redundant(F)
message("for ",dim(G)[1], " samples, ",dim(G)[2], " features are left.")

}


% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{regression}
\keyword{multivariate}
\keyword{classif}
\keyword{models}







