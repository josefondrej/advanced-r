# Title     : R6
# Created by: Josef Ondrej (www.josefondrej.com)
# Created on: 28.12.20

library(R6)

Accumulator = R6::R6Class(
  classname = "Accumulator",
  public = list(
    sum = 0,
    add = function(x = 1) {
      self$sum = self$sum + x
      return(invisible(self)) # Side-effect R6 methods should always return self invisibly. This returns the “current” object and makes it possible to chain together multiple method calls:
    }
  ),
  private = list(
    .age = NA
  )
)
# Fields and methods defined in private are available within the methods using private$ instead
# of self$. You cannot access private fields or methods outside of the class.

x = Accumulator$new()
x$add(4)
x$sum

# $initialize -- overrides the default behaviour of $new (if we want some checks for examle)
# $print should be defined

# Creating
Accumulator <- R6Class("Accumulator")
Accumulator$set("public", "sum", 0)
Accumulator$set("public", "add", function(x = 1) {
  self$sum <- self$sum + x
  invisible(self)
})

# you need to use $clone
# If one of the fields is an R6 object, you must create it inside $initialize(), not R6Class()


# Super
AccumulatorChatty <- R6Class(
  classname = "AccumulatorChatty",
  inherit = Accumulator,
  public = list(
    add = function(x = 1) {
      cat("Adding ", x, "\n", sep = "")
      super$add(x = x)
    }
  )
)

