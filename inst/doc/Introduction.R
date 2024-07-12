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

## ----fig.width=7.2, fig.height=4, dev="svg"-----------------------------------
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
evaluate_estimator(
 score = OverestimationProbability(),
 estimator = MedianUnbiasedMLEOrdering(),
 data_distribution = Normal(two_armed = TRUE),
 design = get_example_design(two_armed = TRUE),
 mu = 0.4,
 sigma = 1
)

evaluate_estimator(
 score = OverestimationProbability(),
 estimator = MedianUnbiasedLikelihoodRatioOrdering(),
 data_distribution = Normal(two_armed = TRUE),
 design = get_example_design(two_armed = TRUE),
 mu = 0.4,
 sigma = 1
)

evaluate_estimator(
 score = OverestimationProbability(),
 estimator = MedianUnbiasedScoreTestOrdering(),
 data_distribution = Normal(two_armed = TRUE),
 design = get_example_design(two_armed = TRUE),
 mu = 0.4,
 sigma = 1
)

evaluate_estimator(
 score = OverestimationProbability(),
 estimator = MedianUnbiasedStagewiseCombinationFunctionOrdering(),
 data_distribution = Normal(two_armed = TRUE),
 design = get_example_design(two_armed = TRUE),
 mu = 0.4,
 sigma = 1
)

## -----------------------------------------------------------------------------
evaluate_estimator(
 score = OverestimationProbability(),
 estimator = SampleMean(),
 data_distribution = Normal(two_armed = TRUE),
 design = get_example_design(two_armed = TRUE),
 mu = 0.4,
 sigma = 1
)

## -----------------------------------------------------------------------------
evaluate_estimator(
 score = MSE(),
 estimator = SampleMean(),
 data_distribution = Normal(two_armed = TRUE),
 design = get_example_design(two_armed = TRUE),
 mu = 0.3,
 sigma = 1
)
evaluate_estimator(
 score = MSE(),
 estimator = BiasReduced(),
 data_distribution = Normal(two_armed = TRUE),
 design = get_example_design(two_armed = TRUE),
 mu = 0.3,
 sigma = 1
)
evaluate_estimator(
 score = MSE(),
 estimator = PseudoRaoBlackwell(),
 data_distribution = Normal(two_armed = TRUE),
 design = get_example_design(two_armed = TRUE),
 mu = 0.3,
 sigma = 1
)
evaluate_estimator(
 score = MSE(),
 estimator = RaoBlackwell(),
 data_distribution = Normal(two_armed = TRUE),
 design = get_example_design(two_armed = TRUE),
 mu = 0.3,
 sigma = 1
)
evaluate_estimator(
 score = MSE(),
 estimator = AdaptivelyWeightedSampleMean(),
 data_distribution = Normal(two_armed = TRUE),
 design = get_example_design(two_armed = TRUE),
 mu = 0.3,
 sigma = 1
)

## -----------------------------------------------------------------------------
evaluate_estimator(
 score = Coverage(),
 estimator = NaiveCI(),
 data_distribution = Normal(two_armed = TRUE),
 design = get_example_design(two_armed = TRUE),
 mu = .07,
 sigma = 1
)

## -----------------------------------------------------------------------------
evaluate_estimator(
 score = Coverage(),
 estimator = LikelihoodRatioOrderingCI(),
 data_distribution = Normal(two_armed = TRUE),
 design = get_example_design(two_armed = TRUE),
 mu = .07,
 sigma = 1
)

## ----fig.width=7.2, fig.height=4, dev="svg"-----------------------------------
coverage_naive <- evaluate_estimator(
 score = Coverage(),
 estimator = NaiveCI(),
 data_distribution = Normal(two_armed = TRUE),
 design = get_example_design(two_armed = TRUE),
 mu = seq(-0.75, 1.32, .03),
 sigma = 1
)
plot(coverage_naive)

## -----------------------------------------------------------------------------
evaluate_estimator(
 score = Width(),
 estimator = MLEOrderingCI(),
 data_distribution = Normal(two_armed = TRUE),
 design = get_example_design(two_armed = TRUE),
 mu = .3,
 sigma = 1
)
evaluate_estimator(
 score = Width(),
 estimator = LikelihoodRatioOrderingCI(),
 data_distribution = Normal(two_armed = TRUE),
 design = get_example_design(two_armed = TRUE),
 mu = .3,
 sigma = 1
)
evaluate_estimator(
 score = Width(),
 estimator = ScoreTestOrderingCI(),
 data_distribution = Normal(two_armed = TRUE),
 design = get_example_design(two_armed = TRUE),
 mu = .3,
 sigma = 1
)
evaluate_estimator(
 score = Width(),
 estimator = StagewiseCombinationFunctionOrderingCI(),
 data_distribution = Normal(two_armed = TRUE),
 design = get_example_design(two_armed = TRUE),
 mu = .3,
 sigma = 1
)

## -----------------------------------------------------------------------------
evaluate_estimator(
 score = Centrality(interval = StagewiseCombinationFunctionOrderingCI()),
 estimator = SampleMean(),
 data_distribution = Normal(two_armed = TRUE),
 design = get_example_design(two_armed = TRUE),
 mu = .3,
 sigma = 1
)
evaluate_estimator(
 score = Centrality(interval = NaiveCI()),
 estimator = SampleMean(),
 data_distribution = Normal(two_armed = TRUE),
 design = get_example_design(two_armed = TRUE),
 mu = .3,
 sigma = 1
)

## -----------------------------------------------------------------------------
evaluate_estimator(
 score = TestAgreement(),
 estimator = MLEOrderingCI(),
 data_distribution = Normal(two_armed = TRUE),
 design = get_example_design(two_armed = TRUE),
 mu = .3,
 sigma = 1
)
evaluate_estimator(
 score = TestAgreement(),
 estimator = LikelihoodRatioOrderingCI(),
 data_distribution = Normal(two_armed = TRUE),
 design = get_example_design(two_armed = TRUE),
 mu = .3,
 sigma = 1
)
evaluate_estimator(
 score = TestAgreement(),
 estimator = ScoreTestOrderingCI(),
 data_distribution = Normal(two_armed = TRUE),
 design = get_example_design(two_armed = TRUE),
 mu = .3,
 sigma = 1
)
evaluate_estimator(
 score = TestAgreement(),
 estimator = StagewiseCombinationFunctionOrderingCI(),
 data_distribution = Normal(two_armed = TRUE),
 design = get_example_design(two_armed = TRUE),
 mu = .3,
 sigma = 1
)

## -----------------------------------------------------------------------------
evaluate_estimator(
 score = TestAgreement(),
 estimator = MLEOrderingPValue(),
 data_distribution = Normal(two_armed = TRUE),
 design = get_example_design(two_armed = TRUE),
 mu = .3,
 sigma = 1
)
evaluate_estimator(
 score = TestAgreement(),
 estimator = LikelihoodRatioOrderingPValue(),
 data_distribution = Normal(two_armed = TRUE),
 design = get_example_design(two_armed = TRUE),
 mu = .3,
 sigma = 1
)
evaluate_estimator(
 score = TestAgreement(),
 estimator = ScoreTestOrderingPValue(),
 data_distribution = Normal(two_armed = TRUE),
 design = get_example_design(two_armed = TRUE),
 mu = .3,
 sigma = 1
)
evaluate_estimator(
 score = TestAgreement(),
 estimator = StagewiseCombinationFunctionOrderingPValue(),
 data_distribution = Normal(two_armed = TRUE),
 design = get_example_design(two_armed = TRUE),
 mu = .3,
 sigma = 1
)

## -----------------------------------------------------------------------------
library(future.apply)
# Change to e.g. plan(multisession) for parallel computing
plan(sequential)

# Scenario 1:
scores1 <- list(MSE(), OverestimationProbability())
estimators1 <- list(SampleMean(), BiasReduced())
dist1 <- list(Normal(two_armed = TRUE))
designs1 <- list(get_example_design(two_armed = TRUE))
mu1 <- seq(-1,1,.5)
sigma1 <- 1

# Scenario 2:
scores2 <- list(Coverage(), Width())
estimators2 <- list(NaiveCI(), StagewiseCombinationFunctionOrderingCI())
dist2 <- list(Normal(two_armed = TRUE))
designs2 <- list(get_example_design(two_armed = TRUE))
mu2 <- seq(-1,1,.5)
sigma2 <- 1

# Evaluate in parallel
res <- evaluate_scenarios_parallel(
  score_lists = list(scores1, scores2),
  estimator_lists =  list(estimators1, estimators2),
  data_distribution_lists = list(dist1, dist2),
  design_lists =  list(designs1, designs2),
  mu_lists = list(mu1, mu2),
  sigma_lists = list(sigma1, sigma2)
)

res[[1]]
res[[2]]

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

