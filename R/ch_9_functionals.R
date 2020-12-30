# Title     : Functionals
# Created by: Josef Ondrej (www.josefondrej.com)
# Created on: 27.12.20

library(purrr)
library(magrittr)

foo = function(x) { return(x * x) }
purrr::map(1:3, foo)

# map_lgl, map_int, map_chr, map_dbl -- return atomic vec instead of list

# Purr allows special syntax `~`
purrr::map(1:5, ~(.x * .x))

# Setting arguments to fixed values
foo = function(a, b) {
  return(a + b)
}

purrr::map(1:10, foo, b = 3)

# Purr style
by_cyl = split(mtcars, mtcars$cyl)
by_cyl %>%
  map(~lm(mpg ~ wt, data = .x)) %>%
  map(coef) %>%
  map_dbl(2)

# There is a ton of different variants of the basic map

# reduce(1:4, f) is equivalent to f(f(f(1, 2), 3), 4)
reduce(1:10, `+`)
accumulate(1:10, `+`)

# Predicate functionals
logical_vector = c(TRUE, FALSE, TRUE, TRUE, TRUE)
some(logical_vector, ~.x)
every(logical_vector, ~.x)
detect(logical_vector, ~.x)
detect_index(logical_vector, ~.x)
keep(logical_vector, ~.x)
discard(logical_vector, ~.x)

# base::functionals
base::map()
base::apply()
#...
stats::integrate()
stats::uniroot()
stats::optimize()

