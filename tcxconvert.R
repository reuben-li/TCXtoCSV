tcx2csv <- function(x){
  library('XML')
  data = xmlParse(x)
  nodes <- getNodeSet(data, "//ns:Trackpoint", "ns")
  mydf  <- plyr::ldply(nodes, as.data.frame(xmlToList))
  outf <- paste("tcx2csv_",x,sep='')
  write.csv(mydf,file=outf)
}