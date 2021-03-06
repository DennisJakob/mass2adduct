% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/analyzeIntensityCutoffsDistr.R
\name{analyzeIntensityCutoffsDistr}
\alias{analyzeIntensityCutoffsDistr}
\title{Calculate effects of applying intensity-level cutoffs on mass spectrum}
\usage{
analyzeIntensityCutoffsDistr(df, by = c("intensities", "counts"),
  value = NULL, pc = 1, plot = TRUE, report.peaks = FALSE)
}
\arguments{
\item{df}{data.frame of three columns: peaks, counts, intensities, produced
by function \code{\link{sumPeakIntensities}} or by external script
msicsvprofiler.pl}

\item{by}{string; Apply cutoff by intensities or counts (default: intensities)}

\item{value}{numeric; Minimum intensity/counts cutoff to apply}

\item{pc}{numeric; Percent intensity/counts cutoff to apply (ignored if value
supplied) (Default: 1)}

\item{plot}{logical; Plot empirical CDF?}

\item{report.peaks}{logical; Return peaks that are above cutoff? (default: no)}
}
\value{
data.frame summarizing the number of peaks above the specified cutoff
        and a plot of the distribution with cutoff overlaid as a vertical
        line. If option \code{report.peaks} is used, then the a vector of
        peaks above the cutoff is returned instead.
}
\description{
Given a table of total intensities per mass peak, produced by function
\code{\link{sumPeakIntensities}}, calculate the number of peaks retained
if a minimum intensity cutoff is applied (either as absolute value or as
percentage of the maximum intensity value observed). To do the inverse, i.e.
find the corresponding intensity value for a desired number of peaks, use
the \code{\link{quantile}} function.
}
\seealso{
\code{\link{analyzeIntensityCutoffsCumul}} does a similar analysis,
         but orders the peaks by intensity and takes the cumulative sum.

\code{\link{sumPeakIntensities}} function to generate the data.frame
         of total intensities and pixel counts per peak from a msimat object.
}
