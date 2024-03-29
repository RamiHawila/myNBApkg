% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/functions.R
\name{position_stats}
\alias{position_stats}
\title{This function produces a table of the means of each basic statistic according to the position.}
\usage{
position_stats(position = "Point Guard", data = DATASET)
}
\arguments{
\item{position}{Name of position ("Center","Point Guard","Shooting Guard","Power Forward","Small Forward")}

\item{data}{Dataframe of NBA statistics With the default being DATASET the 2022-2023 season NBA dataset}
}
\value{
Table that produces the means of the basic statistics for chosen position.
}
\description{
This function produces a table of the means of each basic statistic according to the position.
}
\examples{
position_stats(position = "Point Guard",data=DATASET)
}
