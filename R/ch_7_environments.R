# Title     : Environments
# Created by: Josef Ondrej (www.josefondrej.com)
# Created on: 26.12.20

library(rlang)

environment = rlang::env(a = 1, b = 2)
rlang::env_print(env = environment)
rlang::env_names(env = environment)

# Global environment
identical(global_env(), current_env())

current_environment = rlang::current_env()
while (TRUE) {
  print(rlang::env_name(env = current_environment))
  current_environment = rlang::env_parent(current_environment)
}
# which is the same as
search_envs()
# Autoload and base are always present
rlang::base_env()

# <<- modifies existing variable in parent env or creates new one in global env

# Get and set works as with lists + eng_get, env_poke, env_bind, env_has, env_bind_lazy, env_bind_active

# Binding and being bound to environemnt -- functions
# ----------------------------------------------------------------------------
# Across computer languages, functions that capture (or enclose) their environments are called closures
e <- env()
e$g <- function(x) { return(x + 1) }

fn_env(e$g)

# environemnt e binds name f to the function but the function binds the global environment (it looks for its
# variables in it)
a = 10
e$a = 20
e$g(a)

# Namespaces
# ----------------------------------------------------------------------------
# Every package has namespace & imports environments that control which function the package functions
# use

# Execution environments
# ----------------------------------------------------------------------------
# created when function is executed -- hosts the execution
# two ways how to return it -- explicitely, return object that references that env -- e.g. a function

# Caller environemnt
# ----------------------------------------------------------------------------
caller_env() # from which env the fnction was called, as opposed to created (fn_env)
# Call stack  = list of frames
# frame = (expr, env, parent frame)
f <- function(x) {
  g(x = 2)
}

g <- function(x) {
  h(x = 3)
}

h <- function(x) {
  stop()
}

f(x = 1)

h <- function(x) {
  lobstr::cst()
}

f(x = 1)

