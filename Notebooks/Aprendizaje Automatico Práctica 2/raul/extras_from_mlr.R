# extras

#' @title Generate dummy variables for factor features.
#'
#' @description
#' Replace all factor features with their dummy variables. Internally [model.matrix] is used.
#' Non factor features will be left untouched and passed to the result.
#'
#' @template arg_taskdf
#' @template arg_taskdf_target
#' @param method (`character(1)`)\cr
#'   Available are:
#'   \describe{
#'     \item{"1-of-n":}{For n factor levels there will be n dummy variables.}
#'     \item{"reference":}{There will be n-1 dummy variables leaving out the first factor level of each variable.}
#'   }
#'   Default is \dQuote{1-of-n}.
#' @param cols ([character])\cr
#'   Columns to create dummy features for. Default is to use all columns.
#' @template ret_taskdf
#' @export
#' @family eda_and_preprocess
createDummyFeatures = function(obj, target = character(0L), method = "1-of-n", cols = NULL) {
  # assertChoice(method, choices = c("1-of-n", "reference"))
  if (!is.factor(obj) && !is.character(obj)) {
    #checkTargetPreproc(obj, target, cols)
  }
  UseMethod("createDummyFeatures")
}

#' @export
createDummyFeatures.data.frame = function(obj, target = character(0L), method = "1-of-n", cols = NULL) {
  
  # get all factor feature names present in data
  work.cols = colnames(obj)[BBmisc::vlapply(obj, is.factor)]
  work.cols = setdiff(work.cols, target)
  
  # check that user requested cols are only factor cols
  if (!is.null(cols)) {
    assertSubset(cols, work.cols)
    work.cols = cols
  }
  
  # prevent function model.matrix from dropping rows with missing values
  old.na.action = options()$na.action
  on.exit(options(na.action = old.na.action))
  options(na.action = "na.pass")
  
  prefix = colnames(obj[work.cols])
  dfcol = obj[, work.cols]
  
  dummies = as.data.frame(lapply(obj[work.cols], createDummyFeatures, method = method))
  
  if (method == "reference" && length(work.cols) == length(dummies)) {
    colnames(dummies) = Map(function(col, pre) {
      stringi::stri_paste(pre, tail(levels(col), -1), sep = ".")
    }, obj[work.cols], prefix)
  }
  
  if (length(dummies) != 0) {
    if (ncol(dummies) == 1L) {
      colnames(dummies) = stringi::stri_paste(prefix, tail(levels(dfcol), -1), sep = ".")
    }
    cbind(BBmisc::dropNamed(obj, work.cols), dummies)
  } else {
    obj
  }
}

#' @export
createDummyFeatures.Task = function(obj, target = character(0L), method = "1-of-n", cols = NULL) {
  target = getTaskTargetNames(obj)
  d = createDummyFeatures(obj = getTaskData(obj), target = target, method = method, cols = cols)
  changeData(obj, d)
}


#' @export
createDummyFeatures.factor = function(obj, target = character(0L), method = "1-of-n", cols = NULL) {
  dcol = as.data.frame(obj)
  colname = colnames(dcol)
  if (method == "1-of-n") {
    form = stringi::stri_paste("~", colname, "-1")
    res = model.matrix(as.formula(form), data = dcol)
    colnames(res) = levels(as.factor(obj))
  } else {
    form = stringi::stri_paste("~", colname, "-1")
    res = model.matrix(as.formula(form), data = dcol)[, -1, drop = FALSE]
    colnames(res) = tail(levels(as.factor(obj)), -1)
  }
  as.data.frame(res)
}

#' @export
createDummyFeatures.character = function(obj, target = character(0L), method = "1-of-n", cols = NULL) {
  createDummyFeatures(as.factor(obj), method = method)
}

# Normalize features

#' @title Normalize features.
#'
#' @description
#' Normalize features by different methods.
#' Internally [BBmisc::normalize] is used for every feature column.
#' Non numerical features will be left untouched and passed to the result.
#' For constant features most methods fail, special behaviour for this case is implemented.
#'
#' @template arg_taskdf
#' @template arg_taskdf_target
#' @param method (`character(1)`)\cr
#'   Normalizing method. Available are:\cr
#'   \dQuote{center}: Subtract mean.\cr
#'   \dQuote{scale}: Divide by standard deviation.\cr
#'   \dQuote{standardize}: Center and scale.\cr
#'   \dQuote{range}: Scale to a given range.\cr
#' @param cols ([character])\cr
#'   Columns to normalize. Default is to use all numeric columns.
#' @param range (`numeric(2)`)\cr
#'   Range for method \dQuote{range}.
#'   Default is `c(0,1)`.
#' @param on.constant (`character(1)`)\cr
#'   How should constant vectors be treated? Only used, of \dQuote{method != center},
#'   since this methods does not fail for constant vectors. Possible actions are:\cr
#'   \dQuote{quiet}: Depending on the method, treat them quietly:\cr
#'     \dQuote{scale}: No division by standard deviation is done, input values.
#'        will be returned untouched.\cr
#'     \dQuote{standardize}: Only the mean is subtracted, no division is done.\cr
#'     \dQuote{range}: All values are mapped to the mean of the given range.\cr
#'   \dQuote{warn}: Same behaviour as \dQuote{quiet}, but print a warning message.\cr
#'   \dQuote{stop}: Stop with an error.\cr
#' @template ret_taskdf
#' @seealso [BBmisc::normalize]
#' @export
#' @family eda_and_preprocess
normalizeFeatures = function(obj, target = character(0L), method = "standardize", cols = NULL,
                             range = c(0, 1), on.constant = "quiet") {
  #checkTargetPreproc(obj, target, cols)
  # assertChoice(method, choices = c("range", "standardize", "center", "scale"))
  #assertNumeric(range, len = 2L, any.missing = FALSE)
  
  UseMethod("normalizeFeatures")
}

#' @export
normalizeFeatures.data.frame = function(obj, target = character(0L), method = "standardize",
                                        cols = NULL, range = c(0, 1), on.constant = "quiet") {
  
  df = obj
  # get all numeric feature names present in data
  work.cols = colnames(df)[BBmisc::vlapply(df, is.numeric)]
  work.cols = setdiff(work.cols, target)
  
  # check that user requested cols are only numeric cols
  if (!is.null(cols)) {
    assertSubset(cols, work.cols)
  } else {
    cols = work.cols
  }
  
  df[, cols] = BBmisc::normalize(x = df[, cols, drop = FALSE], method = method,
                         range = range, on.constant = on.constant)
  df
}

#' @export
normalizeFeatures.Task = function(obj, target = character(0L), method = "standardize",
                                  cols = NULL, range = c(0, 1), on.constant = "quiet") {
  target = getTaskTargetNames(obj)
  df = getTaskData(obj)
  normalized.df = normalizeFeatures(obj = df, target = target, method = method,
                                    cols = cols, range = range, on.constant = on.constant)
  changeData(obj, data = normalized.df)
}