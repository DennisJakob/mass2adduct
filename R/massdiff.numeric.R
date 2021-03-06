#' @export

massdiff.numeric <- function(d) {
  # Check that d is numeric
  if (!is.numeric(d)) {
    stop ("Input should be numeric\n")
  }
  len <- length(d)
  message("Input is numeric vector of length ", len, " with ", choose(len,2), " possible pairs")
  if (len > 65536) { # Vector is too long
    stop ("Input is longer than 65536 elements... perhaps you should filter your peak list")
  }
  y <- comb2M(d) # Alternative to R built-in combn function
  # Format results as data frame with column labels
  y <- as.data.frame (t(y))
  names(y) <- c("A","B","diff")
  class(y) <- c("massdiff","data.frame")
  row.names(y) <- NULL
  return(y)
}
