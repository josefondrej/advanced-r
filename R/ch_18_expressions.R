# Title     : Expressions
# Created by: Josef Ondrej (www.josefondrej.com)
# Created on: 28.12.20

library(lobstr)

lobstr::ast(
  if (x) { }
  else if (b) { }
  else { }
)

# constants
identical(expr("x"), "x")

expr(x) == sym("x")
x = 5
is.symbol(expr(x))

# Calls -- behave like lists
x = expr(read.table("important.csv", row.names = FALSE))
is.call(x)
x[[1]]

# construct call from its representation
call2("mean", x = expr(x), na.rm = TRUE)



