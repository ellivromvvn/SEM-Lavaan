# Exercise 1

# Build a four-factor model
wais.model <- 'verbalcomp =~ vocab + simil + inform + compreh 
workingmemory =~ arith + digspan + lnseq
perceptorg =~ piccomp + block + matrixreason
processing =~ digsym + symbolsearch'

# Analyze the model and include the data argument
wais.fit <- cfa(
  model = wais.model,
  data = IQdata
)

# Summarize the model with fit.measures and standardized loadings
summary(
  wais.fit,
  standardized = T,
  fit.measures = T,
  rsquare = T
)

# Exercise 2

# Edit the original model
wais.model <- 'verbalcomp =~ vocab + simil + inform + compreh 
workingmemory =~ arith + digspan + lnseq
performance =~ piccomp + block + matrixreason + digsym + symbolsearch'

# Analyze the model and include the model and data argument
wais.fit <- cfa(
  model = wais.model,
  data = IQdata
)

# Summarize the model
summary(
  wais.fit,
  standardized = T,
  fit.measures = T,
  rsquare = T
)

# Exercise 3

# Load the library
library(semPlot)

# Update the default picture
semPaths(
  object = wais.fit,
  layout = "tree",
  rotation = 1,
  whatLabels = "std",
  edge.label.cex = 1,
  what = "std",
  edge.color = "black"
)

# Exercise 4

# Examine modification indices 
modificationindices(wais.fit, sort = TRUE)

# Update the three-factor model
wais.model2 <- 'verbalcomp =~ vocab + simil + inform + compreh 
workingmemory =~ arith + digspan + lnseq
perceptorg =~ piccomp + block + matrixreason + digsym + symbolsearch
simil ~~ inform'

# Analyze the three-factor model where data is IQdata
wais.fit2 <- cfa(
  model = wais.model2,
  data = IQdata
)

# Summarize the three-factor model
summary(
  wais.fit2,
  standardized = T,
  fit.measures = T,
  rsquare = T
)

# Exercise 5

# Compare the models
anova(wais.fit, wais.fit2)

# View the fit indices for the original model
fitmeasures(wais.fit, c("aic", "ecvi"))

# View the fit indices for the updated model
fitmeasures(wais.fit2, c("aic", "ecvi"))

# Exercise 6

# Update the three-factor model to a hierarchical model
wais.model3 <- 'verbalcomp =~ vocab + simil + inform + compreh 
workingmemory =~ arith + digspan + lnseq
perceptorg =~ piccomp + block + matrixreason + digsym + symbolsearch
simil ~~ inform
general =~ verbalcomp + workingmemory + perceptorg'

# Analyze the hierarchical model where data is IQdata
wais.fit3 <- cfa(
  model = wais.model3,
  data = IQdata
)

# Examine the fit indices for the old model
fitmeasures(wais.fit2, c("rmsea", "srmr"))

# Examine the fit indices for the new model
fitmeasures(wais.fit3, c("rmsea", "srmr"))

# Exercise 7

# Load the library
library(semPlot)

# Update the default picture
semPaths(
  object = wais.fit3,
  layout = "tree",
  rotation = 1,
  whatLabels = "std",
  edge.label.cex = 1,
  what = "std",
  edge.color = "navy"
)