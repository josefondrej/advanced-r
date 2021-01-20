# Title     : Subsetting
# Created by: Josef Ondrej (www.josefondrej.com)
# Created on: 26.12.20

x = c(2, 4, 3, 5)
x[c(3, 1)]
x[base::order(x)]
x[c(1, 1)]

x[-c(3, 1)]

x[c(TRUE, FALSE, TRUE, FALSE)]

x[]

x[0]

y = stats::setNames(x, c("a", "b", "c", "d"))
y
y["a"]
# WARNING: Factors are treated as integers when used for subsetting !!!

df = data.frame(a = 1:5, b = 3:7, c = letters[5:9])
rownames(df)
df[c("1", "2"), c("b", "c")]
df[-1:-3, "a", drop = FALSE] # Do not reduce dimension
df[-1:-3, "a"]
x = 1:5

