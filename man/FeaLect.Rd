\name{FeaLect}
\Rdversion{1.1}
\alias{FeaLect}

\title{
	Computes the scores of the features. 
}

\description{
Several random subsets are sampled from the input data and for each random subset, various linear models are fitted using lars method. 
A score is assigned to each feature based on the tendency of LASSO in including that feature in the models.
Finally, the average score and the models are returned as the output.
}

\usage{
FeaLect(F, L, maximum.features.num = dim(F)[2], total.num.of.models, gamma = 3/4, persistence = 1000, talk = FALSE, minimum.class.size = 2, report.fitting.failure = FALSE, return_linear.models = TRUE, balance = TRUE, replace = TRUE, plot.scores = TRUE)
}

\arguments{
  \item{F}{
	The feature matrix, each column is a feature.}

  \item{L}{
	The vector of labels named according to the rows of F.}
	
  \item{maximum.features.num}{ 
	Upto this number of features are allowed to contribute to each linear model.}
	
  \item{total.num.of.models}{
	The total number of models that are fitted.}

  \item{gamma}{
	A value in range 0-1 that determines the relative size of sample subsets.}
	
  \item{persistence}{
	Maximum number of tries for randomly choosing.samples,
	If we try this many times and the obtained labels are all the same,
	we give up (maybe the whole labels are the same) with the error message: " Not enough variation in the labels...".}
	
  \item{talk}{
  If TRUE, some messages are printed during the computations.}
  
  \item{minimum.class.size}{
	The size of both positive and negative classes should be greater than this threshold after sampling.}

  \item{report.fitting.failure}{
	If TRUE, any failure in fitting the linear of logistic models will be printed.}
	
  \item{return_linear.models}{
	The models are memory intensive, so for if they more than 1000, we may decide to ignore them to prevent memory outage.}

  \item{balance}{
	If TRUE, the cases will be balanced for the same number of positive vs. negatives by oversampling before fitting the linear model.}
	
  \item{replace}{
	If TRUE, the subsets are sampled with replacement.}
	
  \item{plot.scores}{
	If TRUE, the scores are plotted in logarithmic scale after each iteration.}
}
	
\details{See the reference for more details.}

\value{
	Returns a list of: 
		\item{log.scores}{A vector containing the logarithm of final scores.}
		\item{feature.matrix}{The input feature matrix.}
		\item{labels}{The input labels}
		\item{total.num.of.models}{The total number of models that are fitted.}
		\item{maximum.features.num}{Upto this number of features are allowed to contribute to each linear model.}
		\item{feature.scores.history}{The matrix of history of feature scores where column i contains the scores after i runs.}
		\item{num.of.features.score}{A vector, entry i contains the number of times that i has been the best number of features.}
		\item{best.feature.num}{ The i'th value of this vector is the best number of features for the i'th model.}
		\item{mislabeling.record}{ A vector that keeps track of the frequency of mislabelling for each cases.}
		\item{doctors}{List of all models which are created by train.doctor() function.}
		\item{best.features.intersection}{ Best features are computed for each sampling and their intersection is reported as this vector of features names}
		\item{features.with.best.global.error}{ A list containing the sets of features. The set i was the best for i'th sampling.}
		\item{time.taken}{Total time used for executing this function.}
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
message(dim(F)[1], " samples and ",dim(F)[2], " features.")

FeaLect.result <-FeaLect(F=F,L=L,maximum.features.num=10,total.num.of.models=100,talk=TRUE)	

}


% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{regression}
\keyword{multivariate}
\keyword{classif}
\keyword{models}



%% ~Make other sections like Warning with \section{Warning }{....} ~






