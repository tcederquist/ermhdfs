#' hdfsDelete function
#'
#' Delete removes the specified file from the supplied HDFS folder
#' System must have an environment variable defined for the location of the HADOOP command named HADOOP_CMD
#' @param hdfsFilename Full path to the hdfs file to remove.
#' @export
#' @examples
#' erm.hdfsDelete('/user/tcederquist/mysample.csv') 
erm.hdfsDelete <- function(hdfsFilename) {
    hcmd<-Sys.getenv('HADOOP_CMD')
    del <-"fs -rm"
    ret=system2(hcmd, paste(del, hdfsFilename),wait=TRUE, stdout=TRUE)
    ret
}

#' hdfsWrite function
#'
#' Writes the output from the supplied string or function directly to an hdfs file
#' System must have an environment variable defined for the location of the HADOOP command named HADOOP_CMD
#' @param output Any string or a function that outputs text directly to the console. This text will be redirected to the hdfs file
#' @param hdfsFilename Full path to the hdfs file to write the contents
#' @param append Default is FALSE and will delete the file before writing the contents. TRUE will append to the existing file
#' @export
#' @examples
#' erm.hdfsWrite(fwrite(mydatatable), "/user/tcederquist/mysample.csv")
#' erm.hdfsWrite(fwrite(mydatatable[100:200,]), "/user/tcederquist/mysample.csv", append=TRUE)
erm.hdfsWrite <- function(output, hdfsFilename, append=FALSE) {
    hcmd<-Sys.getenv('HADOOP_CMD')
    apnd<-"fs -appendToFile -"
    if (!append) {
        erm.hdfsDelete(hdfsFilename)
    }
    p<-pipe(paste(hcmd, apnd, hdfsFilename), 'w')
    capture.output(output, file=p)
    close(p)
}

#' hdfsReadP
#'
#' Creates a string that can be used by any pipe friendly function to stream the contents of the html file.
#' System must have an environment variable defined for the location of the HADOOP command named HADOOP_CMD
#' @param hdfsFilename Full path to the hdfs file
#' @return Text used to create a stream from the hdfs file
#' @export
#' @examples
#' dat.df3<-fread(erm.hdfsReadP("/user/tcederquist/tim_pop_comm_14_5"),sep=",", header=TRUE, showProgress=F)
erm.hdfsReadP <- function(hdfsFilename) {
    hcmd<-Sys.getenv('HADOOP_CMD')
    hcat<-"-cat"
    paste(Sys.getenv('HADOOP_CMD'), "fs", hcat, hdfsFilename)
}
