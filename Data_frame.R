# ---------- data frame
name <- c("Aung","John","Mickey","Oggy")
year <- c(1997,2000,1987,2004)
height <- c(157,135,164,138)
weight <- c(50,71,23,16)

my.data <- data.frame(name, year, height, weight)
names(my.data) <- c("Person name","Year of birth","Height","Weight")
my.data
str(my.data)

# ------------- data import
my.pok <- read.table("pokRdex-comma.csv", sep = ',', header = TRUE, stringsAsFactors = FALSE)

my.pok <- read.csv("pokRdex-comma.csv", stringsAsFactors = FALSE, nrows = 10) # read only 10 rows

?read.delim

write.csv(my.pok, file = "MyFirstDataFrame.csv", row.names = FALSE)  # create data file in local storage
