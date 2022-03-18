NTRES6100
================

# italic

<hr>

*lufthansa*

<br>

# bold

<hr>

**lufthansa**

<br>

# italic and bold

<hr>

***lufthansa***

<br>

# without blank, without change (1)

<hr>

-lufthansa <br> \*lufthansa

<br>

# without blank, without change (2)

<hr>

–lufthansa <br> \*\*lufthansa

<br>

# without blank, without change (3)

<hr>

—lufthansa <br> \*\*\*lufthansa

<br>

# with blank, with change (1)

<hr>

-   lufthansa <br>
-   lufthansa

<br>

# with blank, with change (2)

<hr>

– lufthansa <br> \*\* lufthansa

<br>

# with blank, with change (3)

<hr>

— lufthansa <br> \*\*\* lufthansa

<br>

# lufthansa

<br>

## lufthansa

<br>

### lufthansa

``` r
# range in R
x=c(5,2,7,9,4)
range(x)
```

    ## [1] 2 9

``` r
#[1] 2 9

# range in R - the NA issue
x=c(5,2,NA,9,4)
range(x,na.rm=FALSE)
```

    ## [1] NA NA

``` r
#[1] NA NA

# range in r - using na.rm to clean up results 
range(x,na.rm=TRUE)
```

    ## [1] 2 9

``` r
#[1] 2 9

# range in R - vectors with alphabetical data
x=c("c","r","e","a","g","e","r")
range(x)
```

    ## [1] "a" "r"

``` r
#[1] "a" "r"
```

``` r
x <- 1:10
y <- 11:20
z <- NULL
system.time(for (i in 1:length(x)){
  z <- c(z, x[i] + y[i])
})
```

    ##    user  system elapsed 
    ##   0.033   0.002   0.035

``` r
z 
```

    ##  [1] 12 14 16 18 20 22 24 26 28 30

``` r
x <- 1:10
y <- 11:20
z <- NULL
system.time(for (i in seq_along(x)) {
  z <- c(z, x[i] + y[i])
})
```

    ##    user  system elapsed 
    ##   0.006   0.001   0.006

``` r
z 
```

    ##  [1] 12 14 16 18 20 22 24 26 28 30

``` r
x <- 1:10
y <- 11:20
z <- NULL
system.time(for (i in range(x)) {
  z <- c(z, x[i] + y[i])
})
```

    ##    user  system elapsed 
    ##   0.006   0.000   0.007

``` r
z 
```

    ## [1] 12 30

``` r
x <- 1:10
y <- 11:20
z <- vector(length=10)
system.time(for (i in 1:length(x)){
  z[i] <- x[i] + y[i]
})
```

    ##    user  system elapsed 
    ##   0.009   0.000   0.009

``` r
z
```

    ##  [1] 12 14 16 18 20 22 24 26 28 30

``` r
x <- 1:10
y <- 11:20
z <- vector(mode = "double", length=10)
system.time(for (i in 1:length(x)){
  z[i] <- x[i] + y[i]
})
```

    ##    user  system elapsed 
    ##   0.010   0.001   0.011

``` r
z
```

    ##  [1] 12 14 16 18 20 22 24 26 28 30

``` r
#certain
for (i in 1:10) {
  print(i)
}
```

    ## [1] 1
    ## [1] 2
    ## [1] 3
    ## [1] 4
    ## [1] 5
    ## [1] 6
    ## [1] 7
    ## [1] 8
    ## [1] 9
    ## [1] 10

``` r
#uncertain
i <- 1
while(i<=10) {
  print(i)
  i <- i + 1
}
```

    ## [1] 1
    ## [1] 2
    ## [1] 3
    ## [1] 4
    ## [1] 5
    ## [1] 6
    ## [1] 7
    ## [1] 8
    ## [1] 9
    ## [1] 10

``` r
x <- 0
i <- 0
while (x < 2) {
  x <- rnorm(1,0,1)
  i <- i + 1
}
print(x)
```

    ## [1] 2.115701

``` r
print(i)
```

    ## [1] 3

``` r
sort(c (3, 1, 2, 5, 4, 2), decreasing = FALSE)
```

    ## [1] 1 2 2 3 4 5

``` r
sort(c (3, 1, 2, 5, 4, 2), decreasing = TRUE)
```

    ## [1] 5 4 3 2 2 1

``` r
rank(c (3, 1, 2, 5, 4, 2))
```

    ## [1] 4.0 1.0 2.5 6.0 5.0 2.5

``` r
c(3, 1, 2, 5, 4, 2)[order(c (3, 1, 2, 5, 4, 2))]
```

    ## [1] 1 2 2 3 4 5

``` r
order(c (3, 1, 2, 5, 4, 2))
```

    ## [1] 2 3 6 1 5 4

``` r
x <- 0
if (x < 0) {
print("Negative number")
} else if (x > 0) {
print("Positive number")
} else
print("Zero")
```

    ## [1] "Zero"
