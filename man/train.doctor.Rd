\name{train.doctor}
\Rdversion{1.1}
\alias{train.doctor}

\title{
	Fittes various models based on a combination on penalized linear models and logistic regression.}
	
\description{
	 Various linear models are fitted to the training samples using lars method. 
	 The models differ in the number of features and each is validated by validating samples. 
	 A score is also assigned to each feature based on the tendency of LASSO in including that feature in the models.}

\usage{
train.doctor(F_, L_, training.samples, validating.samples, considered.features, maximum.features.num, balance = TRUE, return_linear.models = TRUE, report.fitting.failure = FALSE)
}
%- maybe also 'usage' for other objects documented here.
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

  \item{maximum.features.num}{
	Upto this number of features are allowed to contribute to each linear model.}

  \item{balance}{
	If TRUE, the cases will be balanced for the same number of positive vs. negatives by oversampling before fitting the linear model.}

  \item{return_linear.models}{
	The models are memory intensive, so for if they more than 1000, we may decide to ignore them to prevent memory outage.}

  \item{report.fitting.failure}{
	If TRUE, any failure in fitting the linear of logistic models will be printed.}
}


\details{See the reference for more details.}

\value{
	Returns a list of: 
		\item{linear.models}{The result of model fitting computed by lars().}
		\item{best.number.of.features}{According to best accuracy.}
		\item{probabilities}{The best computed logistic score.}
		\item{accuracy}{The best F-measure.}
		\item{best.logistic.cof}{According to best accuracy.}
		\item{contribution.to.feature.scores}{This vector should be added to the total feature scores.}
		\item{contribution.to.feature.scores.frequency }{ This vector should be added to the total frequency of features.}
		\item{training.samples}{Input, the names of rows of F that should be considered as training samples.}
		\item{validating.samples}{Input, the names of rows of F that should be considered as validating samples.}
		\item{precision}{Ratio of number of true positives to predicted positives.}
		\item{recall}{Ratio of number of true positives to real positives.}	
		\item{selected.features.sequence}{A list of sets of features which are selected in different models.}
		\item{global.errors}{A vector of global error of the linear fits.}
		\item{features.with.best.global.error}{A vector of names of good features in terms of global error of linear fits.}
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

all.samples <- rownames(F); ts <- all.samples[5:10]; vs <- all.samples[c(1,22)]

doctor <- train.doctor(F_=F, L_=L, training.samples=ts, validating.samples=vs, considered.features=colnames(F), maximum.features.num=10)

}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{regression}
\keyword{multivariate}
\keyword{classif}
\keyword{models}







