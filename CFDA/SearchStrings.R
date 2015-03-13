#Search String 1
#count.R

cause="other"
substr(cause,1,1)
toupper(substr(cause,1,1))
substr(cause,2,nchar(cause))


regQuery <- sprintf("Cause: [%s|%s]%s", substr(cause,1,1), toupper(substr(cause,1,1)), substr(cause,2,nchar(cause)));
regQuery

#######################################################################
#Search String 2
#agecount.R

age=16

regQuery <- sprintf(" %s years old", age);
