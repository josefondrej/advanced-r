# Title     : Control Flow
# Created by: Josef Ondrej (www.josefondrej.com)
# Created on: 26.12.20

x = TRUE
y = if (x) 3
y == 3

x = 1:10

# Vectorized if
ifelse(x %% 5 == 0, "FOO", as.character(x))

# Case
foo = dplyr::case_when(
  x %% 35 == 0 ~ "foo",
  x %% 5 == 0 ~ "fizz",
  is.na(x) ~ "???",
  TRUE ~ as.character(x)
)

# Switch
switch()

# For loop
for (i in 1:10) {
  if (i %% 2 == 0) next
  if (i %% 5 == 0) break
  print(i)
}

x = c(1, 2, 33)
seq_along(x) # is better than 1:len(x) -- if len(x) == 0 it fucks up

# For loop strips the attributes - WHAT THE HELL IS THIS?!
xs = list(as.Date("2020-01-01"), as.Date("2010-02-02"))
xs = as.Date(c("2020-01-01", "2010-01-01"))
for (x in xs) {
  print(x)
}

xs[[1]]
