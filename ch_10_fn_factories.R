# Title     : Function Factories
# Created by: Josef Ondrej (www.josefondrej.com)
# Created on: 28.12.20

# Whenever you create a function factory, make sure every argument is evaluated, using force()
# as necessary if the argument is only used by the manufactured function.
make_power = function(power) {
  force(power)

  fn = function(x) {
    return(x^power)
  }

  return(fn)
}

make_power(2)(5)

# Stateful functions
new_counter <- function() {
  i <- 0

  function() {
    i <<- i + 1
    i
  }
}

counter_one <- new_counter()
counter_two <- new_counter()

# The created function keeps track of the environment it was created in -- which means gc
# wont take care of it, this it is good idea to remove any temporary objects created by the
# function factory

# Good use case in statistics in Maximum Likelihood estimation (there the likelihood L(x, theta) is
# a function of x & theta, but each time we observe x as fixed, so we only want to get the
# marginal function L(x, .)