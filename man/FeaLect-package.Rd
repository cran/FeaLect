\name{FeaLect-package}
\Rdversion{1.1}
\alias{FeaLect-package}
%\alias{FeaLect}
\docType{package}
\title{Scores features for Feature seLection}

\description{Description: For each feature, a score is computed that can be useful for feature selection. Several random subsets are sampled from the input data and for each random subset, various linear models are fitted using lars method. A score is assigned to each feature based on the tendency of LASSO in including that feature in the models.Finally, the average score and the models are returned as the output. The features with relatively low scores are recommended  to be ignored because they can lead to overfitting of the model to the training data.Moreover, for each random subset, the best set of features in terms of global error is returned. They are useful for applying Bolasso, the alternative feature selection method that recommends the intersection of features subsets.}

\details{
\tabular{ll}{
Package: \tab FeaLect\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2010-10-27\cr
License: \tab GPL version 2 or newer \cr
LazyLoad: \tab yes\cr
}
Suppose you have a feature matrix with 200 features fr only 20 samples and your goal is to build a classifier. 
You can run the FeLeact() function to compute the scores for your features. Only the relatively high score 
features (say the top 20) are recommended for further analysis. In this way, one can prevent overfitting by
reducing the number of features significantly. 
}

\author{ Habil Zare
Maintainer: Habil Zare <zare@cs.ubc.ca>}


\references{"Statistical Analysis of Overfitting Features", manuscript in preparation.}
\keyword{ package }
\keyword{regression}
\keyword{multivariate}
\keyword{classif}
\keyword{models}


%%\seealso{
%%~~ Optional links to other man pages, e.g. ~~
%%~~ \code{\link[<pkg>:<pkg>-package]{<pkg>}} ~~
%%}

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




















