
rankall <- function(outcome, num = "best") {
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


  # construct a set of valid outcome names

  ValidOutcomes <- c("heart attack","heart failure","pneumonia")

  ## Check that outcome is valid
  if(!is.element(outcome,ValidOutcomes)){
    stop("invalid outcome")
  }


#####################################
#Part 3 : Convert data to numeric
# Suppress Warnings
suppressWarnings(Hosp[,3] <- as.numeric(Hosp[,3]))
suppressWarnings(Hosp[,4] <- as.numeric(Hosp[,4]))
suppressWarnings(Hosp[,5] <- as.numeric(Hosp[,5]))

#####################################
#####################################
#Part 4 : Generate a list of states
StatesList <- as.character(unique(Hosp[,2]))

StateList = sort(StateList)


#####################################
#Part 5 : Built a temporary data frame called outcome.df

# Function is a simple "look-up table"
# For specified input, can find required column number

outcome.df <- data.frame(
   InputtedOutcome=c("heart attack","heart failure","pneumonia"),
   UseCol=c(3,4,5))


VarCol <- outcome.df[outcome.df$InputtedOutcome==outcome,]$UseCol

#####################################
#Part 6 : Subset data set by outcome

# We will use the column selected by VarCol, and also column 2
# Column 1 is the name of the hospital
# Column 2 is the name of the state

UseCols <- c(1,2,VarCol)

Hosp <- Hosp[,UseCols]

####################################
# Part 7
# Set up two empty character vectors
RankHosp=character()

####################################
# Part 8
#Populate the character vectors from Part 7
for (state in StateList)
   {
   Hosp2 <- Hosp[Hosp$State==state,]
   Hosp2 <- Hosp2[complete.cases(Hosp2),]
   
   num.temp=num
   if (num == "best") {num.temp = 1}
   if (num == "worst") {num.temp = nrow(Hosp2)}

   OrderedHosp <- Hosp2[order(Hosp2[,3],Hosp2[,1]), ]
        
   RankHosp=c(RankHosp,OrderedHosp[num.temp,]$Hosp.Name)
  
    
   }


####################################
# Part 9
# Construct a data frame from character vectors
RankFrame=data.frame(hospital=RankHosp,state=StateList)
return(RankFrame)
}
