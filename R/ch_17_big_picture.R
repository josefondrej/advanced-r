# Title     : Big Picture
# Created by: Josef Ondrej (www.josefondrej.com)
# Created on: 28.12.20

library(rlang)
library(lobstr)

rlang::expr(mean(x, na.rm = TRUE))

capture_it <- function(x) {
  enexpr(x)
}

capture_it(a + b + c)

# Abstract syntax tree
lobstr::ast(f(a, "b"))

# code from code
call2("f", 1, 2, 3)

# bang bang
xx <- expr(x + x)
yy <- expr(y + y)

expr(!!xx / !!yy)

cv <- function(var) {
  var <- enexpr(var)
  expr(sd(!!var) / mean(!!var))
}

cv(x)
cv(x + y)
x = c(5, 2, 1)
y = c(3, 3, 2)
eval(cv(x + y))

string_math <- function(x) {
  e <- env(
    caller_env(),
    `+` = function(x, y) paste0(x, y),
    `*` = function(x, y) strrep(x, y)
  )

  eval(enexpr(x), e)
}

foo = "foo"
bar = "bar"
string_math(foo + bar)

# quosures
with2 <- function(df, expr) {
  a <- 1000
  eval_tidy(enexpr(expr), df)
}

df <- data.frame(x = 1:3)
a <- 10
with2(df, x + a)

with2 <- function(df, expr) {
  a <- 1000
  eval_tidy(enquo(expr), df)
}

with2(df, x + a)
