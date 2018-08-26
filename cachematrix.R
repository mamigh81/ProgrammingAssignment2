## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}

## Catching the Inverse of a Matrix
##Assigning a pair of functions that catche the inverse of a matrix

##Function 1: creates a special "matrix" object that can catch its inverse

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setInverse <- function(inverse) inv <<- inverse
  getInverse <- function() inv
  list(set = set,
       get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}

##Function 2: computes the inverse of the special"matrix" created with makeCatchMatrix
## If the inverse is already calculated (and the matrix has not changed),
##it should retrieve the inverse from the catche

cacheSolve <- function(x, ...) {
  
  ## Return a matrix that is the inverse of 'x'
  
  inv <- x$getInverse()
  if (!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  mat <- x$get()
  inv <- solve(mat, ...)
  x$setInverse(inv)
  inv
}


## To test my function

Browse[2]> my_matrix <- makeCacheMatrix(matrix(1:4, 2, 2))
Browse[2]> my_matrix$get()
[,1] [,2]
[1,]    1    3
[2,]    2    4
Browse[2]> my_matrix$getInverse()
NULL
Browse[2]> cacheSolve(my_matrix)
[,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
Browse[2]> cacheSolve(my_matrix)
getting cached data
[,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
Browse[2]> my_matrix$getInverse()
[,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
Browse[2]> my_matrix$set(matrix(c(2, 2, 1, 4), 2, 2))
Browse[2]> my_matrix$get()
[,1] [,2]
[1,]    2    1
[2,]    2    4
Browse[2]> cacheSolve(my_matrix)
[,1]       [,2]
[1,]  0.6666667 -0.1666667
[2,] -0.3333333  0.3333333
Browse[2]> cacheSolve(my_matrix)
getting cached data
[,1]       [,2]
[1,]  0.6666667 -0.1666667
[2,] -0.3333333  0.3333333
Browse[2]> my_matrix$getInverse()
[,1]       [,2]
[1,]  0.6666667 -0.1666667
[2,] -0.3333333  0.3333333