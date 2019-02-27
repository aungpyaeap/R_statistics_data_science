# ------ data visualization

# ---- ggplot2
library(tidyverse)
hdi <- read.csv("hdi-cpi.csv", stringsAsFactors =  FALSE)
hdi <- as.tibble(hdi)
hdi

sc <- ggplot(hdi)
sc
sc <- ggplot(hdi, aes(CPI.2015, HDI.2015))
sc
sc + geom_point # overall
sc + geom_point() + facet_grid(Region ~.) # groupping
sc + geom_point(aes(color = Region), size = 3) + facet_grid(Region ~.) + stat_smooth()
sc + geom_point(aes(color = Region), size = 3) + facet_grid(Region ~.) + stat_smooth() + coord_cartesian(xlim = c(0.75,1)) # least recorded corruption

sc + geom_point(aes(color = Region), size = 3) + stat_smooth() + theme_minimal() # theme


# ---- histogram
library(tidyverse)
df <- read.csv("titanic.csv", stringsAsFactors =  FALSE)
df <- as.tibble(df)
df

df$Survived <- as.factor(df$Survived)
df$Pclass <- as.factor(df$Pclass)
df$Sex <- as.factor(df$Sex)
df$Embarked <- as.factor(df$Embarked)
df

hist <- ggplot(data = df, aes(x = Age))
hist + geom_histogram()
hist + geom_histogram(binwidth = 5, color = "darkslategray", fill = "darkslategray4", alpha = 0.5) + ggtitle("Age distribution on Titanic") +
    labs(y = "Number of passengers", x = "Age") + theme_minimal()


# ------- bar chart
library(tidyverse)
bar <- ggplot(df, aes(x = Sex, fill = Survived)) # color fill
bar + geom_bar() + theme_light() + labs(y = "Passenger count",x = "Gender", title = "Survival rate by gender")
bar + geom_bar() + theme_light() + labs(y = "Passenger count",x = "Gender", title = "Survival rate by gender") +
  facet_wrap(~ Pclass) # groupping
bar + geom_bar() + theme_light() + labs(y = "Passenger count",x = "Gender", title = "Survival rate by gender") +
  facet_wrap(Sex ~ Pclass)

hist2 <- ggplot(df, aes(x = Age, fill = Survived))
hist2 + geom_histogram(binwidth = 5, color = "white") +
  labs(y = "Number of passengers", x = "Age", title = "Age distribution") + theme_light()


# ------- box plots
library(tidyverse)
my.box <- ggplot(df, aes(x = Survived, y = Age))
my.box + geom_boxplot() + labs(title = "Survival rate based on age") + theme_light()

my.box + geom_boxplot(outlier.color = "red", outlier.shape = 4) +
  labs(title = "Survival rate based on age and gender") + theme_light() + geom_jitter(width = 0.2, aes(color = Sex)) # show plots
my.box + geom_boxplot(outlier.color = "red", outlier.shape = 4) +
  labs(title = "Survival rate based on age and gender") + theme_light() + geom_jitter(width = 0.2, aes(color = Sex)) + coord_flip() # horizontal display


# ------- scatterplot
library(tidyverse)
sp <- ggplot(hdi, aes(CPI.2015, HDI.2015))
sp + geom_point(aes(color = Region)) + theme_light() +
  labs(x = "Corruption Perception Index, 2015", y = "Human Development Index, 2015", title = "Corruption and Human Development")

sp + geom_point(aes(color = Region), shape = 21, fill = "white", size = 3, stroke = 2) + theme_light() +
  labs(x = "Corruption Perception Index, 2015", y = "Human Development Index, 2015", title = "Corruption and Human Development") +
    stat_smooth(se = FALSE) # bigger size

sp + geom_point(aes(color = Region), shape = 21, fill = "white", size = 3, stroke = 2) + theme_light() +
  labs(x = "Corruption Perception Index, 2015", y = "Human Development Index, 2015", title = "Corruption and Human Development") +
  stat_density2d() # relative density
