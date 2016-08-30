# It would be preferable not to modify the original in place but to 
# clone it as a vector of the same length then bind later. This works by simple 
# vector indices.

# Toy example - compare state fruit list to true lookup table and replace 
# incorrect entries. If there is not a match I will maintain the existing record
# but it would be simple to initiate 'to' as an  NA vector or some other code to indicate
# a non-match (e.g. -99)
dat <- data.frame(state = c("Washington", "Idaho", "Montana", "Georgia",
                        "Florida", "Missouri", "Washington", "New Jersey",
                        "North Dakota"),
                  fruit = c("apple", "banana", "kiwi"))

lookup.tab <- data.frame(state = c("Georgia", "Wyoming", "New York", "Florida",
                                   "Washington", "Idaho"),
                         fruit = c("peach", "strawberry", "apple", "orange",
                                   "cherry", "potato"))

to <- dat$fruit
from <- lookup.tab$fruit
from.id <- dat$state
lookup.id <- lookup.tab$state

for(i in seq_len(nrow(dat))) {
  rows <- from.id == lookup.id[i]             # dat[["state"]] == lookup.tab$state[i]
  to[rows] <- from[i]                         # this could be lookup.tab$fruit[i] but 
}                                             # I prefer the readability of calling out 'from' and 'to' atm 
                                              # but this should be streamlined

# Compare original<>result
cbind(dat, to)

# Steps:
# Read in data and lookup table ('from')
# Clone data$original.values ('to')
# Compare ('truth') name or ID field
# Where ID's match, replace clone with from value, if rows only evaluates to F, nothing will happen

# Spreading might be more computationally efficient than comparing although these lookup tables will only be on the order of ~100 rows

# Future idea/plan: efficient wrapper that takes column names as inputs
