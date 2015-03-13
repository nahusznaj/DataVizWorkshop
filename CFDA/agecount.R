
agecount <- function(age = NULL) {
## Step 1 : Check that "age" is non-NULL; 
## It has to contain characters
## Else return  error message

if (length(age) == 0)
	stop("age is null");

## Step 2 : Read "homicides.txt" data file
homicides <- readLines("homicides.txt");

## Step3 : construct a searchable string
regQuery <- sprintf(" %s years old", age);


## Step4 : Extract ages of victims; ignore records where no age is given

## Return integer containing count of homicides for that age
Deaths <- grep(regQuery, homicides);

## Return integer containing count of homicides for that cause
return (length(Deaths));
}
