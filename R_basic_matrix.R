# --------------- R exercises ------------

# ----------- building a function --------------

deck <- c("Duke","Assassin","Captain","Ambassador","Contessa") # Q game
print(deck)

hand <- sample(deck, size = 3, replace = T)
print(hand)

draw <- function(){
  deck <- c("Duke","Assassin","Captain","Ambassador","Contessa")
  hand <- sample(deck, size = 3, replace = T)
  print(hand)
}

draw()

# ---------- vector attributes -------------
age <- c(23,26,24,26)
attributes(age)
names(age)

names(age) <- c("George","John","Paul","Ringo")
age

names(age) <- NULL # remove names

# ------- indexing and slicing
n.deck <- c(6,7,8,9,10)
deck <- c("Duke","Assassin","Captain","Ambassador","Contessa")
deck[4]
deck[-4]
deck[c(1,3,5)]

names(n.deck) <- deck
n.deck

n.deck["Contessa"]
n.deck[c("Contessa","Duke","Assassin")]

n.deck[3:5]

lv <- seq(10,100, by = 10)
lv
lv[-(4:7)]
lv[lv > 30]

# ---------- dimension
a <- seq(10,120, by = 10)
a
dim(a) <- c(3,4)
a

typeof(a)
class(a)

# -----------  matrix
mtrx <- matrix(1:12, nrow = 3)
mtrx <- matrix(1:12, ncol = 4)
mtrx <- matrix(1:12, ncol = 4, byrow = TRUE)
mtrx

usa <- c(1.3, 1.5, 1.2, 1.4, 1.5)
de <- c(0.2, 0,4, 0.7, 0.8, 0.8)
ngo <- cbind(usa,de) # compile
ngo

rownames(ngo) <- c("2013","2014","2015","2016","2017")
ngo <- t(ngo)
ngo

ind <- c(2, 2.2, 2.4, 2.5, 2.6) # add new data
ngo <- rbind(ngo, ind)
ngo


gdp <- matrix(c(47.9, 41.2, 41.9, 54.6, 56.2, 57.5, 1.6, 1.6, 1.7), 
              nrow = 3, byrow = TRUE,
              dimnames = list(c("de","usa","ind"), c("2014","2015","2016")))
gdp

# ---------- matrices recycle
exmpl <- matrix(1:10, nrow = 4, ncol = 4)
exmpl

# ----------- matrix subsetting
gross <- c(123,456,741,456,124,365,456,785,124,963,452,145,753,695,256,222)
hp.mat <- matrix(gross, nrow = 8, byrow = T)
hp.mat
hp.mat[6,2]
hp.mat[6]
hp.mat[6,] # calling entire row
hp.mat[,2] # entire col

hp.snip <- hp.mat[c(1,3,7), ]
hp.snip
colnames(hp.mat) <- c("USA","Worldwide")
rownames(hp.mat) <- c("Movie 1","Movie 2","Movie 3","Movie 4","Movie 5","Movie 6","Movie 7","Movie 8","Movie 9","Movie 10")
hp.mat


# ----------- matrix arithmetic
b.office <- c(171.5,292,281.6,460.6,139.3,288)
matrix.mat <- matrix(b.office, nrow = 3, byrow = TRUE,
                     dimnames = list(c("The Matrix","Reloaded","Revolutions"),
                                     c("US","Worldwide"))) 
matrix.mat

matrix.scaled <- matrix.mat/1000
matrix.scaled

avg.margin <- matrix.mat - 121 # average margin
avg.margin

budget <- matrix(c(63,150,150), nrow = 3, ncol = 2)
margin <- matrix.mat -budget
margin

v <- matrix(1:6, nrow = 3)
matrix.multiplied <- matrix.mat*v
matrix.multiplied

# --------- matrix operations in R
total <- colSums(matrix.mat) # sum all cols
rowSums(matrix.mat) # sum all rows

average <- colMeans(matrix.mat) # means (average)
rowMeans(matrix.mat)

matrix.prelim <- rbind(matrix.mat, average, total)
matrix.prelim


# ------- factor --- ordinal data ordering
marital.status <- c("Married","Married","Single","Married","Divorced","Widowed","Divorced")
str(marital.status)

marital.factor <- factor(marital.status)
marital.factor # alphabetical order

typeof(marital.factor)
str(marital.factor)

new.factor <- factor(marital.status, levels = c("Single","Married","Divorced","Widowed"))
str(new.factor)

ordered.factor <- factor(marital.status, ordered = TRUE,
                         levels = c("Single","Married","Divorced","Widowed"))
ordered.factor # relative ranking

# ------------- for loop
title <- c("catch","me","if","you","can")
for(i in title){
  print(i)
}

new.title <- vector(length = 5)
new.title

for(i in 1:5){
  new.title[i] <- title[i]
}
new.title

# ---------- repeat loops
n <- - 12
repeat{
  print(paste("Your value equals", n))
  n <- n + 1
  if(n >= 0){
    print("N is now either 0 or a positive number")
    print("THe loop will be broken")
    break
  }
}

# ---------- function
mult12 <- function(x){
  y <- (x*12)
  print(y)
}

mult12(3)
