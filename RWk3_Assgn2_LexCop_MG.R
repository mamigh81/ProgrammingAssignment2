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
my_matrix <- makeCacheMatrix(matrix(1:4, 2, 2))
my_matrix$get()

my_matrix$getInverse()

cacheSolve(my_matrix)

cacheSolve(my_matrix)

my_matrix$getInverse()		

my_matrix$set(matrix(c(2, 2, 1, 4), 2, 2))
my_matrix$get()

cacheSolve(my_matrix)

cacheSolve(my_matrix)

my_matrix$getInverse()	

