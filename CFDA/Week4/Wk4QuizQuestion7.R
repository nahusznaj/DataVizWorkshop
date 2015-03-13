grep("^s(.*?)r", c("she likes rum raisin after running hard"),  value=FALSE)
grep("^s(.*?)r", c("she likes rum raisin after running hard"),  value=TRUE)

grep("^s(.*?)r", c("she likes r"),  value=TRUE)
#[1] "she likes r"
#############################################################
grep("^s(.*?)r", c("she likes r"),  value=FALSE)
#[1] 1 #Match
nchar("she likes r")

grep("^s(.*?)r", c("she likes "),  value=FALSE)
#integer(0)

#############################################################
gregexpr("^s(.*?)r", c("she likes rum raisin after running hard"))

