test_that("density of MLE sums up to one (normal distribution, one-armed)",
          {
            expect_equal(
              dsmean(
                Normal(two_armed = FALSE),
                designad,
                .x <- seq(-2, 2, .h <- .01),
                0,
                1,
                exact = FALSE,
                combine_components = TRUE
              ) |> sum() * .h,
              1,
              tolerance=1e-2
            )
          })


test_that("density of MLE sums up to one (t distribution, one-armed)",
          {
            expect_equal(
              dsmean(
                Student(two_armed = FALSE),
                designad,
                .x <- seq(-2, 2, .h <- .001),
                0,
                1,
                exact = FALSE,
                combine_components = TRUE
              ) |> sum() * .h,
              1,
              tolerance = 1e-2
            )
          })


test_that("density of MLE sums up to one (normal distribution, two-armed, treatment group)",
          {
            expect_equal(dsmeanT(Normal(),
                                 designad,
                                 .x <- seq(-2, 2, .h <- .01),
                                 0,
                                 1,
                                 exact = FALSE) |> sum() * .h,
                         1,
                         tolerance = 1e-2)
          })

test_that("density of MLE sums up to one (t distribution, two-armed, treatment group)",
          {
            expect_equal(dsmeanT(Student(),
                                 designad,
                                 .x <- seq(-2, 2, .h <- .01),
                                 0,
                                 1,
                                 exact = FALSE) |> sum()*.h,
                         1,
                         tolerance = 1e-2)
          })






