#
# Extra Credit R Project 
# *****YOUR NAME GOES HERE*****
# *****DATE GOES HERE*****
#

# Set up libraries
library(RCurl)

# Get the raw survey data from fivethirtyeight
csv <- getURL("https://raw.githubusercontent.com/fivethirtyeight/data/master/san-andreas/earthquake_data.csv")

# Read the data into a dataframe
survey_data <- read.csv(text = csv)

# Examine the structure of our dataframe
str(survey_data)

#Extract our factors into nicely-named variables
how_worried_general <- survey_data$In.general..how.worried.are.you.about.earthquakes.
how_worried_big <- survey_data$How.worried.are.you.about.the.Big.One..a.massive..catastrophic.earthquake.
big_in_lifetime <- survey_data$Do.you.think.the..Big.One..will.occur.in.your.lifetime.
experienced_earthquake <- survey_data$Have.you.ever.experienced.an.earthquake.
earthquake_prep <- survey_data$Have.you.or.anyone.in.your.household.taken.any.precautions.for.an.earthquake..packed.an.earthquake.survival.kit..prepared.an.evacuation.plan..etc...
familiar_san_andreas <- survey_data$How.familiar.are.you.with.the.San.Andreas.Fault.line.
familiar_yellowstone <- survey_data$How.familiar.are.you.with.the.Yellowstone.Supervolcano.
age <- survey_data$Age
gender <-survey_data$What.is.your.gender.
income <- survey_data$How.much.total.combined.money.did.all.members.of.your.HOUSEHOLD.earn.last.year.
region <- survey_data$US.Region

# Specify the order of the levels of our factors
# This is important because many of the categories in our survey have a natural order: 
# "Extremely worried" is more worried than "Very worried" etc.
worry_levels <- c("Not at all worried", "Not so worried", "Somewhat worried", "Very worried", "Extremely worried")
experience_levels <- c("No", "Yes, one or more minor ones", "Yes, one or more major ones")
familiar_levels <- c("Not at all familiar", "Not so familiar","Somewhat familiar", "Very familiar", "Extremely familiar")
age_levels <- c("18 - 29", "30 - 44", "45 - 59", "60+")
income_levels <- c("$0 to $9,999", "$10,000 to $24,999", "$25,000 to $49,999", "$50,000 to $74,999", "$75,000 to $99,999",
                   "$100,000 to $124,999", "$125,000 to $149,999", "$150,000 to $174,999", "$175,000 to $199,999", "$200,000 and up")

# Make the factors ordered based on our specifications above ^
how_worried_general <- factor(how_worried_general ,ordered = TRUE, levels = worry_levels)
how_worried_big <- factor(how_worried_big, ordered = TRUE, levels = worry_levels)
experienced_earthquake <- factor(experienced_earthquake, ordered = TRUE, levels = experience_levels)
familiar_san_andreas <- factor(familiar_san_andreas, ordered = TRUE, levels = familiar_levels)
familiar_yellowstone <- factor(familiar_yellowstone, ordered = TRUE, levels = familiar_levels)
age <- factor(age, ordered = TRUE, levels = age_levels)
income <- factor(income, ordered = TRUE, levels = income_levels)

#
# Here's where you come in! 
# Your job is to answer the following questions to fact-check the fivethirtyeight artitle you read.
# The variable names are given to you. Fill in the variable assignments (delete the NA) to answer each question.
# The first one is done for you as an example. Note that in R, TRUE = 1 and FALSE = 0, which is why "sum" works in the example.
# Feel free to check your answers against the numbers reported in the article!
#

# What % of respondents are at least somewhat worried about "The Big One"?
percent_worried_big <- sum(how_worried_big>="Somewhat worried")/length(how_worried_big)

# What % of respondents think "The Big One" will happen in their lifetime?
percent_big_in_lifetime <- NA

# What % of respondents in the Pacific Region are at least somewhat worried about earthquakes in general?
# Hint: you can use the & operator to check if two vectors are both TRUE
percent_worried_general_pacific <- NA

# What % of respondents in the Pacific Region are at least somewhat worried about "The Big One"?
percent_worried_big_pacific <- NA

# What % of respondents in the Pacific Region think "The Big One" will occur in their lifetime?
percent_big_in_lifetime_pacific <- NA

# Ask and answer your own question about the data below: 
#
my_answer <- NA