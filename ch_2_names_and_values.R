# Title     : Names and Values
# Created by: Josef Ondrej (www.josefondrej.com)
# Created on: 26.12.20

library(lobstr)

# Non-syntactic names :_(
`_foo` = 1
`_foo`

# Assigning value to name & copy on modify
# ----------------------------------------------------------------------------
x = c(1, 2, 3)
y = x
# x, y point to the same object
lobstr::obj_addr(x)
base::tracemem(x)
# If we change y, it now points to different object
y[1] = 2
lobstr::obj_addr(x) != lobstr::obj_addr(y)
lobstr::obj_addr(x[2]) != lobstr::obj_addr(y[2])

# In other words OBJECTS IN R ARE IMMUTABLE
# this has two exceptions
#   1. when the object has only one binding (can have 1 or many; many - 1 = many !)
#   2. environments
environment = rlang::env()

# Special cases
x = list(1, 2, 3) # List is just a container for references to it's items
y = x
y[[1]] = 2
lobstr::obj_addr(x) != lobstr::obj_addr(y)
lobstr::obj_addr(x[[2]]) == lobstr::obj_addr(y[[2]])

# Dataframe is a LIST OF VECTORS (=columns)
# row modification copies entire df, column modification copies just the column

# Global string pool
x = 1
y = 1
lobstr::obj_addr(x) != lobstr::obj_addr(y)
x = "a"
y = "a"
lobstr::obj_addr(x) != lobstr::obj_addr(y)

vec = c("a", "a", "abc", "d")
lobstr::obj_addr(vec[[1]]) != lobstr::obj_addr(vec[[2]])
ref(vec, character = TRUE)

# Function calls
x = list(1, 2, 3, 4)

f = function(y) {
  y[1] = 50
  return(y)
}

z = f(x) # same business as usual -- copy on modify

lobstr::obj_addr(z[[2]]) == lobstr::obj_addr(x[[2]])

# Different way to access object
# ----------------------------------------------------------------------------
mean
base::mean
get("mean")
evalq(mean)
match.fun("mean")

# Object size
# ----------------------------------------------------------------------------
x = c(1L, 2L, 3L)
x = 1L
lobstr::obj_size(x)