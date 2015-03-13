rankhospital <- function(state, outcome, num = "best") {                            
     
Hosp<-read.csv("outcome-of-care-measures.csv",colClasses = "character")
 
#####################################
#Part 1 : Inputs

# Data set is imported as a data frame called "Hosp"
# We will immediately discard every column except columns 2,7,11,17 and 23

Hosp <- Hosp[ , c(2,7,11,17,23)]

# [11] "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"                            
# [17] "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"                           
# [23] "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"        

# We will also give the data frame more manageable column names
# Use capital letters for the sake of clarity

names(Hosp) <- c("Hosp.Name", "State", "Heart.At","Heart.Fa","Pneum")

#####################################
#Part 2 : Check that inputed value is OK


  # Generate a list of valid state abbreviations from data.
  ValidStates <- as.character(unique(Hosp[,2]))

  # construct a set of valid outcome names

  ValidOutcomes <- c("heart attack","heart failure","pneumonia")


  ## Check that state is valid
  if(!is.element(state,ValidStates)){
    stop("invalid state")
  }
  ## Check that outcome is valid
  if(!is.element(outcome,ValidOutcomes)){
    stop("invalid outcome")
  }


#####################################
#Part 3a : Subset data set by selected state
Hosp = Hosp[Hosp$State==state,]


#####################################
#Part 3b : Built a temporary data frame called outcome.df

# Function is a simple "look-up table"
# For specified input, can find required column number

outcome.df <- data.frame(
   InputtedOutcome=c("heart attack","heart failure","pneumonia"),
   UseCol=c(3,4,5))


#For given input for "outcome" return the column number 
# > outcome.df
#   InputtedOutcome UseCol

# 1    heart attack      3
# 2   heart failure      4
# 3       pneumonia      5
#
# Pick outcome.df$Cols when outcome.df$InputtedOutcome 
#   is equal to "outcome"
# save the column number as VarCol

VarCol <- outcome.df[outcome.df$InputtedOutcome==outcome,]$UseCol


#####################################
#Part 3c : Subset data set by outcome

# We will use the column selected by VarCol, and also column 2
# Column 1 is the name of the hospital
# N.B. UseCols is different from the variable UseCol, which we used previously

UseCols <- c(1,VarCol)

Hosp <- Hosp[,UseCols]
###################################
# Part 4a Clean up data set

#Turn into integers. Suppress coercion warnings
# get rid of incomplete cases

suppressWarnings(Hosp[,2] <- as.numeric(Hosp[,2]))
Hosp <- Hosp[complete.cases(Hosp),]

###################################
# Part 4b Clean up data set

# mananging best / worst inputs
# worst = last row

if (num == "best") {num = 1}
if (num == "worst") {num = nrow(Hosp)}

####################################
# Part 5

# Order by outcome (col 2), then by name of hospital (col 1)
OrderedHosp <- Hosp[order(Hosp[,2],Hosp[,1]), ]

# Part 6 Return Answer

return (OrderedHosp[num,]$Hosp.Name)
                                     
  }  
