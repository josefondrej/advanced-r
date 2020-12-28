# Title     : Base types
# Created by: Josef Ondrej (www.josefondrej.com)
# Created on: 28.12.20

library("sloop")

# Base types vs OO objects
is.object(1:10)
sloop::otype(1:10)

x = 1:10
attr(x, "class")
attr(x, "class") = 5 # Throws an error
# use rather
sloop::s3_class(x)

# only oo objects have class but all objects have base type
typeof(1:10)
typeof(data.frame())

