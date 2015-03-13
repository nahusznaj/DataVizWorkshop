count <- function(cause = NULL) {
## Step 1
## Check that "cause" is non-NULL; 
## else give error message
if (length(cause) == 0) {
	stop("NULL cause");
 }
 
## Step 2
## Check that specific "cause" is allowed; else throw error
CauseList <- c("asphyxiation","blunt force","other" ,"shooting","stabbing", "unknown")


if (!is.element(cause, CauseList)){stop("cause is not allowed");}
 
## Step 3
## Read "homicides.txt" data file
homicides <- readLines("homicides.txt");


## Step 4
regQuery <- sprintf("Cause: [%s|%s]%s", substr(cause,1,1), toupper(substr(cause,1,1)), substr(cause,2,nchar(cause)));

## Step 5
## Return causes of death

Deaths <- grep(regQuery, homicides);

## Finally
## Return integer containing count of homicides for that cause

return (length(Deaths));
}
