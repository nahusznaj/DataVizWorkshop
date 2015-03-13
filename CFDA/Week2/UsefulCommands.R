# 1. list.files()
# 2. nhcar()
# 3. complete.cases()
# 4. sprintf()
##########################################
# Part 1

getwd() 
list.files(getwd())


##########################################
# Part 2
# nchar()   #number of characters

string <- c("Kevin")
nchar(string)

nchar(14596)

nchar(5:14)

#########################################
# Part 3
# complete.cases()
# Return a logical vector indicating which cases are complete, i.e., have no missing values

complete.cases(airquality)

#########################################
# Part 4
# sprintf()
# returns a character vector containing a formatted combination of text and variable values
# Jonathan Rougier (Bristol)

sprintf("%f", pi)
sprintf("%.3f", pi)
sprintf("%1.0f", pi)
sprintf("%5.1f", pi)
sprintf("%05.1f", pi)
sprintf("%05.0f", pi)
