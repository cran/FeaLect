\name{mcl_sll}
\Rdversion{1.1}
\alias{mcl_sll}
\docType{data}
\title{MCL and SLL lymphoma subtypes}

\description{A total of 237 features are identified for 22 lymphoma patients.}

\usage{data(mcl_sll)}

\format{ A matrix. Each of the 237 columns represents a features except the first column which contains the label vector.
	Each of the 22 rows represents a patients.}

\details{7 cases diagnosed with Mantel Cell Lymphoma (MCL)  and 15 cases with Small Lymphocytic Lymphoma (SLL).
	The presented features are computed based on flow cytometry data
	The fist column contains the label vector which has value 1 for MCL cases and 0 for SLL cases.}

\source{British Columbia Cancer Agency}

\references{"Statistical Analysis of Overfitting Features", manuscript in preparation.}

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
L

}

\keyword{datasets}
