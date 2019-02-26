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


# -------- using pipe operator
star.species <- group_by(star, species)
star.smr <- summarise(star.species, count = n(), avg.mass = mean(mass, na.rm=T))
filter(star.smr, count > 1)
filter(summarise(group_by(star, species), count = n(), avg.mass = mean(mass, na.rm = T)), count > 1)

star %>%
  group_by(species) %>%
  summarise(count = n(), mass = mean(mass, na.rm = T)) %>%
  filter(count > 1)

# ------- tidy data
library(tidyverse)
billboard <- read.csv("billboard.csv")
billboard <- as.tibble(billboard)
billboard

billboard %>% gather(x1st.week:x76th.week, key = "week", value = "rank", na.rm = T) %>%
  arrange(artist.inverted)

tb <- read.csv("tb.csv")
tb <- as.tibble(tb)
tb

tb.gathered <- tb %>% gather(m.014:f.65, key = "column", value = "cases", na.rm = T) %>%
  arrange(country)
tb.gathered

tb.separated <- tb.gathered %>% separate(column, into = c("sex", "age"), sep = ".")
tb.separated

# -- separate
tb.separated <- tb.separated %>% separate(age, into = c("age.low", "age.high"))
tb.separated

# -- unite function
tb.united <- tb.separated %>% unite("age.new", c("age.low", "age.high"))
tb.united


# --- spread
weather <- read.csv("weather.csv")
weather <- as.tibble(weather)
weather

weather.spread <- spread(weather, key = element, value = value)
weather.spread
