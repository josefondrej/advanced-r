# Title     : S3 Objects
# Created by: Josef Ondrej (www.josefondrej.com)
# Created on: 28.12.20

# functions are typically generic
# WARNING str is also generic
time = strptime(c("2017-01-01", "2020-05-04 03:21"), "%Y-%m-%d")
str(time)

str(unclass(time))

s3_dispatch(str(time))

# Methods have dot in name or use ftype to check
sloop::ftype(strptime)

x = list(1, 2, 3)
attr(x, "class") = "foo"
class(x) = "foo"
inherits(x, "foo")

new_myclass = function(x) {
  obj = structure(
    x,
    class = "myclass"
  )
  return(obj)
}

new_myclass(list(1, 3, 4))

validate_myclass = function(object) {
  is_valid = class(object) == "myclass"
  return(is_valid)
}

myclass = function(x) {
  return(new_myclass(x))
}

# Generics
# s3_methods_generic("mean") -- list them all

# Bound by naming convention to class generic_name.method_name
# sometimes the dot is used even if the function is not method
print.myclass = function(x) {
  print(paste0("[MyClass] ", x))
}

print_generics_methods = s3_methods_generic("print") # there should be row print.myclass somewhere

# if we want to define own generic
my_new_generic <- function(x) {
  UseMethod("my_new_generic") # -- this basically just finds function called my_new_generic.class
}

# find out if function is generic
body(t)
body(t.test)

data.frame(a = c(1, 2, 3, 4), b = c(1, 2))
data.frame(a = c(1, 2, 3, 4), b = c(1, 2, 3))

# Inheritance

print.foo = function(x) {
  print(paste0("[foo] ", toString(x)))
}

print.bar = function(x) {
  print(paste0("[bar] ", toString(x)))
}

obj = structure(list(1, 2, "a"), class = c("foo", "bar"))
print(obj) # calls print.foo

# We’ll say that ordered is a subclass of factor because it always appears before it in the class vector, and,
# conversely, we’ll say factor is a superclass of ordered.

# The base type of the subclass should be that same as the superclass.
# The attributes of the subclass should be a superset of the attributes of the superclass.

print.bar = function(x) {
  print(paste0("[bar] ", toString(x)))
  NextMethod(print, x)
}

obj = structure(list(1, 2, "a"), class = c("bar", "foo"))
print(obj) # calls print.foo

# When you create a class, you need to decide if you want to allow subclasses,
# because it requires some changes to the constructor and careful thought in your methods.

# To allow subclasses, the parent constructor needs to have ... and class arguments:
new_secret = function(x, ..., class = character()) {
  stopifnot(is.double(x))

  secret = structure(
    x,
    ...,
    class = c(class, "secret")
  )
  return(secret)
}

new_secret(1.0)

# Resolving based on subclass type
# in python we would do classmethod and use cls
new_supersecret = function(x) {
  new_secret(x, class = "supersecret")
}

`[.secret` <- function(x, ...) {
  new_secret(NextMethod())
}

# we would like the `[.secret` to return not secret class but supersecret class
# somehow magically by default
vec_restore.secret <- function(x, to, ...) new_secret(x)
vec_restore.supersecret <- function(x, to, ...) new_supersecret(x)

`[.secret` <- function(x, ...) {
  vctrs::vec_restore(NextMethod(), x)
}

# this ^^ is the solution


