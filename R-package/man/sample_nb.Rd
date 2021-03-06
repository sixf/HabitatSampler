% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/inner_procedure.r
\name{sample_nb}
\alias{sample_nb}
\title{Perform Habitat Sampling and Probability Mapping}
\usage{
sample_nb(
  raster,
  nb_samples,
  sample_type,
  nb_mean,
  nb_it,
  buffer,
  reference,
  model,
  area,
  mtry,
  last,
  seed,
  init.seed
)
}
\arguments{
\item{raster}{satellite time series stack (rasterBrickObject) or just any type of image (*rasterObject)}

\item{nb_samples}{number of spatial locations}

\item{sample_type}{distribution of spatial locations c("random","regular")}

\item{nb_mean}{number of iterations for model accuracy}

\item{buffer}{distance (in m) for new sample collection around initial samples (depends on pixel size)}

\item{reference}{reference spectra either SpatialPointsDataFrame (shape file) or data.frame with lines = classes, column = predictors]}

\item{model}{which machine learning classifier to use c("rf", "svm") for random forest or suppurt vector machine implementation}

\item{area}{extent where the the classification is happening}

\item{mtry}{number of predictor used at random forest splitting nodes (mtry << n predictors)}

\item{last}{only true for one class classifier c("FALSE", TRUE")}

\item{seed}{set seed for reproducable results}

\item{init.seed}{"sample" for new or use run1@seeds to reproduce previous steps}

\item{nb_models}{number of models (independent classifiers) to collect}
}
\value{
a list with 3 elements:
\enumerate{
\item An index
\item Accuracy vector
\item A vector with a Habitat objects, each consisting of 7 slots: \cr
run1@models - list of selected classifiers \cr
run1@ref_samples - list of SpatialPointsDataFrames with same length as run1@models holding reference labels \link{1,2} for each selected model \cr
run1@switch - vector of length run1@models indicating if target class equals 2, if not NA the labels need to be switched \cr
run1@layer - raster map of habitat type probability \cr
run1@mod_all - list of all classifiers (equals nb_models) \cr
run1@class_ind - vector of predictive distance measure for all habitats \cr
run1@seeds - vector of seeds for random sampling \cr
all files are saved with step number, the *.tif file is additionally saved with class names
}
}
\description{
This is the function that performs: initiate sampling and model building
}
\keyword{internal}
