# Exercise 1

# Load the lavaan library
library(lavaan)

# Look at the dataset
data(HolzingerSwineford1939)
head(HolzingerSwineford1939[ , 7:15])

# Define your model specification
text.model <- 'textspeed =~ x4 + x5 + x6 +x7 +x8 +x9'

# Exercise 2

# Load the lavaan library
library(lavaan)

# Look at the dataset
data(PoliticalDemocracy)
head(PoliticalDemocracy)

# Define your model specification
politics.model <- 'poldemo60 =~ y1 + y2 + y3 + y4'

# Exercise 3

# Load the lavaan library
library(lavaan)

# Load the dataset and define model
data(HolzingerSwineford1939)
text.model <- 'textspeed =~ x4 + x5 + x6 + x7 + x8 + x9'

# Analyze the model with cfa()
text.fit <- cfa(
  model = text.model,
  data = HolzingerSwineford1939
)

# Summarize the model
summary(text.fit)

# Exercise 4

# Load the lavaan library
library(lavaan)

# Load the data and define model
data(HolzingerSwineford1939)
text.model <- 'textspeed =~ x4 + x5 + x6 + x7 + x8 + x9'

# Analyze the model with cfa()
text.fit <- cfa(model = text.model, data = HolzingerSwineford1939)

# Summarize the model
summary(text.fit, standardized = TRUE)

# Exercise 5

# Load the lavaan library
library(lavaan)

# Load the data and define model
data(HolzingerSwineford1939)
text.model <- 'textspeed =~ x4 + x5 + x6 + x7 + x8 + x9'

# Analyze the model with cfa()
text.fit <- cfa(model = text.model, data = HolzingerSwineford1939)

# Summarize the model
summary(text.fit, fit.measures = T)

# Exercise 6

# Load the lavaan library
library(lavaan)

# Load the data and define model
data(PoliticalDemocracy)
politics.model <- 'poldemo60 =~ y1 + y2 + y3 + y4'

# Analyze the model with cfa()
politics.fit <- cfa(model = politics.model, data = PoliticalDemocracy)

# Summarize the model
summary(politics.fit, standardized = T, fit.measures = T)