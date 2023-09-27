## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
library(adestr)
get_example_design(two_armed = TRUE)

## -----------------------------------------------------------------------------
evaluate_estimator(
 score = MSE(),
 estimator = SampleMean(),
 data_distribution = Normal(two_armed = TRUE),
 design = get_example_design(two_armed = TRUE),
 mu = 0.3,
 sigma = 1
)

## -----------------------------------------------------------------------------
mse_mle <- evaluate_estimator(
  score = MSE(),
  estimator = SampleMean(),
  data_distribution = Normal(two_armed = TRUE),
  design = get_example_design(two_armed = TRUE),
  mu = seq(-0.75, 1.32, .03),
  sigma = 1
)
mse_weighted_sample_means <- evaluate_estimator(
  score = MSE(),
  estimator = WeightedSampleMean(w1 = .8),
  data_distribution = Normal(two_armed = TRUE),
  design = get_example_design(two_armed = TRUE),
  mu = seq(-0.75, 1.32, .03),
  sigma = 1
)
plot(c(mse_mle, mse_weighted_sample_means))

## -----------------------------------------------------------------------------
set.seed(321)
dat <- data.frame(
 endpoint = c(rnorm(56, .3, 1), rnorm(56, 0, 1)),
 group = factor(rep(c("trt", "ctl"),
                    c(56,56)), levels = c("trt", "ctl")),
 stage = rep(1, 112)
)
head(dat)

## -----------------------------------------------------------------------------
analyze(data = dat,
        statistics = list(),
        data_distribution = Normal(two_armed = TRUE),
        design = get_example_design(two_armed = TRUE),
        sigma = 1)

## -----------------------------------------------------------------------------
dat <- rbind(dat,
             data.frame(
               endpoint = c(rnorm(47, .3, 1), rnorm(47, 0, 1)),
               group = factor(rep(c("trt", "ctl"),
                                  c(47, 47)), levels = c("trt", "ctl")),
               stage = rep(2, 94)
             ))

## -----------------------------------------------------------------------------
analyze(
 data = dat,
 statistics = c(
   SampleMean(),
   BiasReduced(),
   PseudoRaoBlackwell(),
   MedianUnbiasedStagewiseCombinationFunctionOrdering(),
   StagewiseCombinationFunctionOrderingCI(),
   StagewiseCombinationFunctionOrderingPValue()
   ),
 data_distribution = Normal(two_armed = TRUE),
 sigma = 1,
 design = get_example_design(two_armed = TRUE)
)

