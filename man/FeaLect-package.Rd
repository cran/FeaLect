\name{FeaLect-package}
\alias{FeaLect-package}
%%\alias{FeaLect}
\docType{package}
\title{
\packageTitle{FeaLect}
}
\description{
%%\packageDescription{FeaLect}
Suppose you have a feature matrix with 200 features and only 20 samples and your goal is to build a classifier. 
You can run the FeLeact() function to compute the scores for your features. Only the relatively high score 
features (say the top 20) are recommended for further analysis. In this way, one can prevent overfitting by
reducing the number of features significantly. 
}

\details{
The DESCRIPTION file:
\packageDESCRIPTION{FeaLect}
\packageIndices{FeaLect}
}

\author{
\packageAuthor{FeaLect}

Maintainer: \packageMaintainer{FeaLect}
}

\references{Zare, Habil, et al. "Scoring relevancy of features based on combinatorial analysis of Lasso with application to lymphoma diagnosis." \emph{BMC genomics}. Vol. 14. No. 1. BioMed Central, 2013.}
\keyword{ package }
\keyword{ regression }
\keyword{ multivariate }
\keyword{ classif }
\keyword{ models }

\seealso{
  \code{\link{FeaLect}}, \code{\link{train.doctor}}, \code{\link{doctor.validate}}, 
  \code{\link{random.subset}}, \code{\link{compute.balanced}},\code{\link{compute.logistic.score}}, 
  \code{\link{ignore.redundant}}, \code{\link{input.check.FeaLect}},
  \code{\link[lars:lars]{lars}-package}, and \code{SparseLearner-package}
  %%~~ \code{\link[<pkg>:<pkg>-package]{<pkg>}} ~~
}

\examples{
library(FeaLect)
data(mcl_sll)
F <- as.matrix(mcl_sll[ ,-1])	# The Feature matrix
L <- as.numeric(mcl_sll[ ,1])	# The labels
names(L) <- rownames(F)
message(dim(F)[1], " samples and ",dim(F)[2], " features.")

## For this data, total.num.of.models is suggested to be at least 100.
FeaLect.result.1 <-FeaLect(F=F,L=L,maximum.features.num=10,total.num.of.models=20,talk=TRUE)
}
