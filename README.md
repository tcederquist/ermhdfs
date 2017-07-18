# ermhdfs
R based HDFS functions for directing the output of any standard print based functions into and out of an HDFS file. These functions do not need extra memory for caching, staging, or otherwise converting values. These functions are simple, fast, and memory efficient.

Pre-requisites
* Environment variable
  * HADOOP_CMD = location of the hadoop command line executable such as when running 'hadoop fs -ls /anHdfsFolder'
* Installation
  * library(devtools)
  * install_github('tcederquist/ermhdfs')

**erm.hdfsWrite(output, hdfsFilename, append=FALSE)**

* output = any command that outputs to the console or string
  * fwrite(mydatatable)
  * noquote(mystring)
* hdfsFilename = complete filename including the hdfs path
* append = default of false
  * False = delete the hdfs file before writing
  * True = append to the existing file
* Example

     erm.hdfsWrite(fwrite(mydatatable), "/user/tcederquist/mysample.csv")

**erm.hdfsReadP(hdfsFilename)**
Creates a string that can be used by any pipe friendly function to stream the contents of the html file.

* hdfsFilename = path the file to read
* Example

     dat.df3<-fread(erm.hdfsReadP("/user/tcederquist/tim_pop_comm_14_5"),sep=",", header=TRUE, showProgress=F)
     
**erm.hdfsDelete(hdfsFilename)**
Delete removes the specified file from the supplied HDFS folder

* hdfsFilename = Full path to the hdfs file to remove
* Example

     erm.hdfsDelete('/user/tcederquist/mysample.csv')
