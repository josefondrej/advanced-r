# Title     : Vectors
# Created by: Josef Ondrej (www.josefondrej.com)
# Created on: 26.12.20

# Types
# ----------------------------------------------------------------------------
atomic_vector = c(1, 2, 3)
list_vector = list(1, 2, 3)
null = NULL

# Atomic vectors = each element same type
# ----------------------------------------------------------------------------
T = FALSE # Beware
logical_atomic = c(FALSE, TRUE, FALSE)
integer_atomic = c(1L, 2L, 3L, 1e2L)
double_atomic = c(NaN, Inf, -Inf, 4, 1e3, 120.39)
string_atomic = c("a", "a", 'b')

c(atomic_vector, logical_atomic) # Always converts to more general type
c(atomic_vector, logical_atomic, string_atomic)

# Missing values
x = c(1, 2, 3, NA)
is.na(x)
NA
NA_integer_
NA_real_
NA_character_

# Testing type
is.logical(integer_atomic)
is.integer(integer_atomic)

as.logical(c(1, 0, 2, 1))

# Matrices
matrix = c(1, 2, 3, 4)
dim(matrix) = c(2, 2)
matrix

# Attributes
# ----------------------------------------------------------------------------
# class, dim
example_object = 1:3
attr(example_object, "x") = "fofofo"
attr(example_object, "x")

example_object = structure(1:3, x = "foofof", y = "yoyoyo")
attributes(example_object)

# names attribute
example_object = c(a = 1, b = 2, d = 4)
attributes(example_object)

example_object = structure(1:5, comment = "foo")
comment(example_object)
comment

# factor, POSIXct, Date
# ----------------------------------------------------------------------------
# are build on top of doubles/integers using attributes

# List = each element same type, but the elements are REFERENCES!
# ----------------------------------------------------------------------------
# Elements of list are refer
x = list(1, 2, 3)
is.list(x)
as.list(c(1, 2, 3))
unlist(x)

# x[[1]] vs x[1] -- first element vs list containing the first element

# Named lists
named_list = list(a = 1, b = 2)
names(named_list)
identical(named_list[["a"]], named_list$a)

# Array
x = as.list(1:9)
dim(x) = c(3, 3)
x

# Data Frames
# ----------------------------------------------------------------------------
# Are just lists of vectors of the same length
# They recycle inputs
# stringsAsFactors = TRUE is the default ... duh
df = data.frame(x = 1:3, y = c("a", "b", "c"))
colnames(df)
rownames(df)

# Tibble
# ----------------------------------------------------------------------------
# do not coerce inputs
# do not transform non-syntactic names
# recycle only columns of lenght one
# allows variable reference in definition
library(tibble)
tibble_example = tibble::tibble(a = c(1, 2, 3), b = c("a", "b", "c"))
tibble_example


