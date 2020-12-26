# Title     : Functions
# Created by: Josef Ondrej (www.josefondrej.com)
# Created on: 26.12.20

library(magrittr)

f = function(x) {
  return(x^2)
}

formals(f)
body(f)
environment(f)

# For builtin functions formals, body and environmet does not work
typeof(sum)
typeof(`[`)
formals(sum)

# Lambdas
function(x) { return(x * x) }

args = list(1:10, na.rm = TRUE)
do.call(sum, args)

# Composition
g = function(x) { return(x + 1) }

g(f(2))
2 %>% f %>% g

# Scoping
# ----------------------------------------------------------------------------
# Variables in function are local first, then it looks up in global
# g(g) is interpreted as function of variable
g = function(x) { return(x + 1) }

a = 10

foo = function() {
  a
  g = 10
  return(g(g))
}

foo()

codetools::findGlobals(foo) # can help find global vars function uses

# Lazy evaluation
# ----------------------------------------------------------------------------
h = function(x) { return(4) }
h(stop("ERROR")) # x is not evaluated because it is not used
# it is powered by promises = (expression = x+y, environment, value - calculated when 1st evaluated)

# Thanks to lazy evaluation, default values can be defined in terms of other arguments, or even in terms of variables
# defined later in the function -- OH LORD ...
f = function(arg_1, arg_2 = arg_3) {
  arg_3 = 10
  return(arg_2)
}

f(1)

# Var args
# ----------------------------------------------------------------------------
f = function(...) {
  a = list(...)
  return(a)
}

f(a = 3, b = 3)

# Invisible return -- use for functions whose primary purpose is side effect
j04 <- function() invisible(1)
j04()

a = b = 2

# Errors
stop("ERROR message")

# Exit handlers
j06 <- function(x) {
  cat("Hello\n")
  on.exit(cat("Goodbye!\n"), add = TRUE) # add = add to other exit handlers

  if (x) {
    return(10)
  } else {
    stop("Error")
  }
}

# Prefix, infix, replacement, special
2 + 3 == `+`(2, 3)