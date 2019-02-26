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

# ----------- data transformation Dplyr
library(tidyverse)
star <- starwars

view(star)

filter(star, species == "Droid")
filter(star, species == "Droid", homeworld == "Tatooine")
filter(star, eye_color == "red"| eye_color == "yellow" | eye_color == "orange", species == "Human")

select(star, name, birth_year, homeworld, species, starships)
select(star, name, homeworld: starships)
select(star, ends_with("color"))
select(star, name, vehicles, starships, everything())

# adds a new variable preserves the rest
star <- mutate(star, bmi = mass/((height/100)^2))
select(star, name:bmi)

# adds a new variable and drop the rest
star.trans <- transmute(star, bmi = mass/((height/100)^2))
star.trans

arrange(star, mass)
arrange(star, desc(mass)) # order by desc

summarise(star, avg.height = mean(height, na.rm = T))

star.species <- group_by(star, species) # group by
summarise(star.species, avg.height = mean(height, na.rm = T))

sample_n(star, 10, replace = TRUE) # random 10 rows
sample_frac(star, 0.1)
