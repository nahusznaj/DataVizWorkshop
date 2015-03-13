###################################################
Txt1<-c("night night at 8")

Txt2<-c("heading,heading by 9")

Txt3<-c("bye bye from high")

Txt4<-c("going up and up and up")

MatchWith1 <-c("^([a-z]+) +\1 +[a-z]+ [0-9]")
##################################################

grep(MatchWith1,Txt1,  value=TRUE)
grep(MatchWith1,Txt2,  value=TRUE)
grep(MatchWith1,Txt3,  value=TRUE)
grep(MatchWith1,Txt4,  value=TRUE)

# None of them match?
# What is the Problem?
MatchWith1

# Where did these zeroes come from?
###################################################

MatchWith2 <-c("^([a-z]+) +\\1 +[a-z]+ [0-9]")


grep(MatchWith2,Txt1,  value=TRUE)
grep(MatchWith2,Txt2,  value=TRUE)
grep(MatchWith2,Txt3,  value=TRUE)
grep(MatchWith2,Txt4,  value=TRUE)

###################################################


# Solution use \\1 instead






