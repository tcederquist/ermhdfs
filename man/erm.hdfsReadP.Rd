% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ermhdfs-io.r
\name{erm.hdfsReadP}
\alias{erm.hdfsReadP}
\title{hdfsReadP}
\usage{
erm.hdfsReadP(hdfsFilename)
}
\arguments{
\item{hdfsFilename}{Full path to the hdfs file}
}
\value{
Text used to create a stream from the hdfs file
}
\description{
Creates a string that can be used by any pipe friendly function to stream the contents of the html file.
System must have an environment variable defined for the location of the HADOOP command named HADOOP_CMD
}
\examples{
dat.df3<-fread(erm.hdfsReadP("/user/tcederquist/tim_pop_comm_14_5"),sep=",", header=TRUE, showProgress=F)
}
