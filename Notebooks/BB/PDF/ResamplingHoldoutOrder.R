#' @title Holdout Resampling
#'
#' @name mlr_resamplings_holdoutorder
#' @include Resampling.R
#'
#' @description
#' Splits data into a training set and a test set. NO SHUFFLING
#' Parameter `ratio` determines the ratio of observation going into the training set (default: 2/3).
#'
#' @templateVar id holdout
#' @template resampling
#'
#' @section Parameters:
#' * `ratio` (`numeric(1)`)\cr
#'   Ratio of observations to put into the training set.
#'
#' @references
#' `r format_bib("bischl_2012")`
#'
#' @template seealso_resampling
#' @export
#' @examples
#' # Create a task with 10 observations
#' task = tsk("penguins")
#' task$filter(1:10)
#'
#' # Instantiate Resampling
#' holdout = rsmp("holdoutorder", ratio = 0.5)
#' holdout$instantiate(task)
#'
#' # Individual sets:
#' holdout$train_set(1)
#' holdout$test_set(1)
#'
#' # Disjunct sets:
#' intersect(holdout$train_set(1), holdout$test_set(1))
#'
#' # Internal storage:
#' holdout$instance # simple list
ResamplingHoldout = R6::R6Class("ResamplingHoldoutOrder", inherit = Resampling,
                            public = list(
                              #' @description
                              #' Creates a new instance of this [R6][R6::R6Class] class.
                              initialize = function() {
                                ps = ps(
                                  ratio = p_dbl(0, 1, tags = "required")
                                )
                                ps$values = list(ratio = 2 / 3)
                                
                                super$initialize(id = "holdout", param_set = ps, man = "mlr3::mlr_resamplings_holdout")
                              },
                              
                              #' @template field_iters
                              iters = 1L
                            ),
                            
                            private = list(
                              .sample = function(ids, ...) {
                                n = length(ids)
                                in_train = logical(n)
                                # in_train[sample.int(n, round(n * self$param_set$values$ratio))] = TRUE
                                in_train[1:round(n * self$param_set$values$ratio)] = TRUE
                                # in_train[1:(6*365)] = TRUE
                                list(train = ids[in_train], test = ids[!in_train])
                              },
                              
                              .get_train = function(i) {
                                self$instance$train
                              },
                              
                              .get_test = function(i) {
                                self$instance$test
                              },
                              
                              .combine = function(instances) {
                                list(train = do.call(c, map(instances, "train")), test = do.call(c, map(instances, "test")))
                              }
                            )
)

#' @include mlr_resamplings.R
mlr_resamplings$add("holdoutorder", ResamplingHoldout)