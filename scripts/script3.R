# Exercise 1

# Look at the data
head(adoptsurvey)

# Build the model
adopt.model <- 'goodstory =~ pictures + background + loveskids
inperson =~ energy + wagstail + playful'

# Analyze the model
adopt.fit <- cfa(model = adopt.model, data = adoptsurvey)

# Exercise 2

# Look at the data
head(adoptsurvey)

# Edit the original model 
adopt.model <- 'goodstory =~ pictures + background + loveskids + energy + wagstail + playful'

# Analyze the model
adopt.fit <- cfa(model = adopt.model, data = adoptsurvey)

# Look for Heywood cases
summary(adopt.fit, standardized = TRUE, fit.measures = TRUE)

# Exercise 3

# Build the model
adopt.model <- 'goodstory =~ pictures + background + loveskids
inperson =~ energy + wagstail + playful'

# Analyze the model and include the data argument
adopt.fit <- cfa(
  model = adopt.model,
  data = adoptsurvey
)

# Summarize the model to view the negative variances
summary(adopt.fit, standardized = TRUE,
        fit.measures = TRUE, rsquare = TRUE)

# Exercise 4.1

# Summarize the model to view the negative variances
summary(
  adopt.fit, standardized = TRUE,
  fit.measures = TRUE,
  rsquare = TRUE
)

# Exercise 4.2

# View the variance of the problem manifest variable
var(adoptsurvey$wagstail)

# Exercise 4.3

# Update the model using 5 decimal places
adopt.model2 <- 'goodstory =~ pictures + background + loveskids
inperson =~ energy + wagstail + playful
wagstail ~~ 23.07446*wagstail'

# Exercise 4.4

# Analyze and summarize the updated model
adopt.fit2 <- cfa(model = adopt.model2, data = adoptsurvey)

# Summarize the model to view the negative variances
summary(
  adopt.fit2,
  standardized = TRUE,
  fit.measures = TRUE,
  rsquare = TRUE
)

# Exercise 5

# Load the semPlot library
library(semPlot)

# Create a default picture
semPaths(object = adopt.fit)

# Exercise 6

# Update the default picture
semPaths(
  object = adopt.fit,
  layout = "tree",
  rotation = 2,
)

# Exercise 7

# Update the default picture
semPaths(
  object = adopt.fit,
  layout = "tree",
  rotation = 2,
  whatLabels = "std",
  edge.label.cex = 1,
  what = "std",
  edge.color = "blue"
)