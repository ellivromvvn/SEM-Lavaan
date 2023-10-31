# Exercise 1

# Create your text model specification
text.model <- 'text =~ x4 + x5 + x6'

# Analyze the model and include data argument
text.fit <- cfa(
  model = text.model,
  data = HolzingerSwineford1939
)

# Summarize the model
summary(text.fit, standardized = TRUE, fit.measures = TRUE)

# Exercise 2

# Update the model specification by setting two paths to the label a
text.model <- 'text =~ x4 + a*x5 + a*x6'

# Analyze the model
text.fit <- cfa(model = text.model, data = HolzingerSwineford1939)

# Summarize the model
summary(text.fit, standardized = TRUE, fit.measures = TRUE)

# Exercise 3

# Create a two-factor model of text and speed variables
twofactor.model <- '
    text =~ x4 + x5 + x6
    speed =~ x7 + x8 + x9
'

# Exercise 4

# Previous one-factor model output
summary(text.fit, standardized = TRUE, fit.measures = TRUE)

# Two-factor model specification
twofactor.model <- 'text =~ x4 + x5 + x6
speed =~ x7 + x8 + x9'

# Use cfa() to analyze the model and include data argument
twofactor.fit <- cfa(
  model = twofactor.model,
  data = HolzingerSwineford1939
)

# Use summary() to view the fitted model
summary(twofactor.fit, standardized = TRUE, fit.measures = TRUE)

# Exercise 5.1

# Load the library and data
library(psych)
data(epi)

# Specify a three-factor model with one correlation set to zero
epi.model <- 'extraversion =~ V1 + V3 + V5 + V8
neuroticism =~ V2 + V4 + V7 + V9
lying =~ V6 + V12 + V18 + V24
extraversion ~~ 0*neuroticism'

# Exercise 5.2

# Run the model
epi.fit <- cfa(model = epi.model, data = epi)

# Exercise 5.3

# Examine the output 
summary(epi.fit, standardized = TRUE, fit.measures = TRUE)

# Exercise 6.1

# Load the library and data
library(psych)
data(epi)

# Specify a three-factor model where lying is predicted by neuroticism
epi.model <- 'extraversion =~ V1 + V3 + V5 + V8
neuroticism =~ V2 + V4 + V7 + V9
lying =~ V6 + V12 + V18 + V24
lying ~ neuroticism'

# Exercise 6.2

# Run the model
epi.fit <- cfa(model = epi.model, data = epi)

# Exercise 6.3

# Examine the output 
summary(epi.fit, standardized = TRUE, fit.measures = TRUE)

# Exercise 7

# Run the model
epi.fit <- cfa(model = epi.model, data = epi)

# Examine the output 
summary(epi.fit, standardized = TRUE, fit.measures = TRUE)

# Calculate the variance of V1 in the epi data
var(epi$V1)

# Exercise 8.1

# Original model summary
summary(epi.fit, standardized = TRUE, fit.measures = TRUE)

# Examine the modification indices
modificationIndices(epi.fit, sort = T)

# Exercise 8.2

# Edit the model specification
epi.model2 <- 'extraversion =~ V1 + V3 + V5 + V8
neuroticism =~ V2 + V4 + V7 + V9
lying =~ V6 + V12 + V18 + V24
neuroticism =~  V3'

# Exercise 8.3

# Reanalyze the model
epi.fit <- cfa(model = epi.model2, data = epi)

# Summarize the updated model
summary(epi.fit, standardized = TRUE, fit.measures = TRUE)

# Exercise 9

# Analyze the original model
epi.fit <- cfa(model = epi.model, data = epi)

# Analyze the updated model
epi.fit1 <- cfa(model = epi.model1, data = epi)

# Compare those models
anova(epi.fit, epi.fit1)

# Exercise 10

# Analyze the original model
epi.fit <- cfa(model = epi.model, data = epi)

# Find the fit indices for the original model
fitmeasures(epi.fit, c("aic", "ecvi"))

# Analyze the updated model
epi.fit1 <- cfa(model = epi.model1, data = epi)

# Find the fit indices for the updated model
fitmeasures(epi.fit1, c("aic", "ecvi"))