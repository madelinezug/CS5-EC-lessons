#
# Autograder for the San Andreas R extra credit project
# Maddie Zug
# Harvey Mudd College
# May 2017
#

source('~/san_andreas_project/san_andreas_solution.R')

# What % of respondents think "The Big One" will happen in their lifetime?
correct_percent_big_in_lifetime <- identical(sum(big_in_lifetime == "Yes")/length(big_in_lifetime), percent_big_in_lifetime) 

# What % of respondents in the Pacific Region are at least somewhat worried about earthquakes in general?
# Hint: you can use the & operator to check if two vectors are both TRUE
correct_percent_worried_general_pacific <- identical(sum((how_worried_general>="Somewhat worried")&(region == "Pacific"))/sum(region=="Pacific"),
                                                     percent_worried_general_pacific)

# What % of respondents in the Pacific Region are at least somewhat worried about "The Big One"?
correct_percent_worried_big_pacific <- identical(sum((how_worried_big>="Somewhat worried")&(region == "Pacific"))/sum(region=="Pacific"), 
                                         percent_worried_big_pacific)

# What % of respondents in the Pacific Region think "The Big One" will occur in their lifetime?
correct_percent_big_in_lifetime_pacific <- identical(sum((big_in_lifetime == "Yes")&(region == "Pacific"))/sum(region == "Pacific"), 
                                                     percent_big_in_lifetime_pacific)

# Ask and answer your own question about the data below: 
correct_my_answer <- !identical(NA, my_answer)

total_score <- sum(c(correct_percent_big_in_lifetime, correct_percent_worried_general_pacific, correct_percent_worried_big_pacific,
                     correct_percent_big_in_lifetime_pacific, correct_my_answer))

print(total_score)
