# Title     : S4
# Created by: Josef Ondrej (www.josefondrej.com)
# Created on: 28.12.20

library(methods)

methods::setClass(
  Class = "Person",
  slots = c(
    name = "character",
    age = "numeric"
  ),
  prototype = list(
    name = NA_character_,
    age = NA_real_
  )
)

john <- new("Person", name = "John Smith", age = NA_real_)
john@name
slot(john, "name")

setGeneric("age", function(x) standardGeneric("age"))
setGeneric("age<-", function(x, value) standardGeneric("age<-"))

setMethod("age", "Person", function(x) x@age)
setMethod("age<-", "Person", function(x, value) {
  x@age = value
  x
})

age(john) = 50
age(john)

is(john, "Person")
is(john)

new("Person") # do not use as constructor -- that should be provided explicitely if the class is public

# Validator
setValidity("Person", function(object) {
  if (length(object@name) != length(object@age)) {
    "@name and @age must be same length"
  } else {
    TRUE
  }
})

setGeneric("myGeneric", function(x) standardGeneric("myGeneric")) # do not use function(x){ ... } -- curly braces

setMethod("myGeneric", "Person", function(x) {
  # method implementation
})


