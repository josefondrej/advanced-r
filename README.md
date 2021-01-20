# Advanced R

Collection of my notes and exercises from the great book [Advanced R](https://adv-r.hadley.nz/index.html)
by [Hadley Wickham](http://hadley.nz/). Intended for personal use only. However if you want to learn about programming
in R, then I highly recommend the sources mentioned in this `README.md`

## Other useful R resources

- [R packages](https://r-pkgs.org/) -- book on how to create package in R. For quick reference see this
  sample [github repo](https://github.com/jennybc/foofactors).

- [tidyverse R Style Guide](https://style.tidyverse.org/), Google has
  it's [own](https://google.github.io/styleguide/Rguide.html)
  which is based on the tidyverse. I think Google makes the following good points:
    - do not use `attach`
    - do not use `->` (right hand assignment)
    - always use explicit returns (do not rely on R's implicit return feature)
    - qualify namespaces - e.g. `purrr::map()`

## IDE for R

Recently the company JetBrains started to [support R](https://www.jetbrains.com/help/pycharm/r-plugin-support.html)
language in their [products](https://www.jetbrains.com/products/). As far as I know this is the case for at least
IntelliJ IDEA an PyCharm. I was using both of these for a couple of years to develop Java / Python and I was super happy
with them.

I tried the R support only for couple of weeks in PyCharm and while there are still some minor bugs but I would say that
it works pretty well and together with the other features the IDE offers makes it a clear choice for me.

You might also want to check out [RStudio](https://rstudio.com/), which has more R focused features, but the tools for
code refactoring and overall user-friendliness are nowhere near the JetBrains products.

# Notes

**2. Names & Values**

- copy on modify (objects are immutable - exceptions)
- pass by value
- `lobstr::obj_addr(z)`

**3. Vectors**

- logical, integer, double, string
- list = atomic(reference)
- `attr(object, "key") = "value"`, `attributes(object)`,
- `data.frame` = named list of vectors

**4. Subsetting**
**5. Control Flow**
**6. Functions**

- function = (`base::formals(f)`, `base::body(f)`, `base::environment(f)` = evaluation env)
- lazy argument evaluation
- `base::stop("error")`, `base::on.exit()`

**7. Environments**

- environment = `rlang::env(a = 1, b = 2)`
- `rlang::global_env()` -> env(package_1) -> ... -> env(package_n) -> `rlang::base_env()` -> `rlang::empty_env()`
- `<<-`
- function captures/binds environment (=looks for the variables in it) in which it is **defined** (closure)
- execution environment
- (namespace and import environment)
- `rlang::caller_env`

**8. TryCatch**

- `tryCatch(error = function(cnd) {}, code)`

**9. Functionals**

- `purrr::map(1:10, function, arg_1 = "fixed_value")`
- purrr style: `base::split(mtcars, mtcars$cyl) %>% map(func_1) %>% ...` etc. (split = pandas.groupby)
- `purrr::reduce`, `purrr::accumulate`

**10. Function Factories**

- use `base::force(arguments)` in fn factories (to avoid hell caused by lazy evaluation)
- the created fn keeps track of it's environment -- `gc()` won't collect any garbage you leave there

**11. Function Operators**

**12. Base vs OO Objects**

- objects = base objects + oo objects (`base::is.object` / `base::attr(object, "class") == NULL`)
- `sloop::s3_class(object)` -- used by S3,S4 to pick methods

**13. S3(🤮)**

- `sloop::s3_dispatch(generic_function(object))`
- **S3 object definition**: `new_myclass(args)` + `validate_myclass(object:myclass)`
    + `myclass(args){helpers + return new_myclass(x)}`
- **S3 object method definition**: `function.myclass()`, calling `function(object:myclass)` then
  calls `function.myclass` which is done by `base::UseMethod`
- **S3 generic**: `my_new_generic <- function(x) {UseMethod("my_new_generic")}`

> method must have same arguments as it's generic

- **S3 inheritance**:
    - `class(object)` can be `c("first class", "second class" ...)`
    - `base::NextMethod`

> base type of subclass = type of superclass
>
> attributes of subclass = superset of superclass
>

- **S3 subclassable constructor**:
  ```
  new_subclassable_myclass <- function(x, ..., class = character()) {
    return(structure(x, ..., class=c(class, "subclassable_myclass")))
  }
  ```

- **S3 classmethod** - use `vctrs::vec_restore`



