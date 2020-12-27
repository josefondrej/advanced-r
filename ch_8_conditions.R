# Title     : Conditions
# Created by: Josef Ondrej (www.josefondrej.com)
# Created on: 26.12.20

fnc = function(x) {
  abort("foo")
  return(x * x)
}

fnc("foo")

tryCatch(
  error = function(cnd) {
    # code to run when error is thrown
  },
  print("error")
)

withCallingHandlers(
  warning = function(cnd) {
    # code to run when warning is signalled
  },
  message = function(cnd) {
    # code to run when message is signalled
  },
  code_to_run_while_handlers_are_active
)