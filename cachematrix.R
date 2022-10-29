## Put comments here that give an overall description of what your functions do

## Write a short comment describing this function
  #The <<- operator can be used to assign a value to an object in an 
  #Environment that is different from the current environment.

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list(set = set,
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function
    # Use "...":
      # When it makes sense to call the function with a variable number of 
      # arguments. 
      # When, within your function, you call other functions, and these functions 
      # can have a variable number of arguments, either because:
              # the called function is generic
              # the called function can be passed into the function as an argument

cacheSolve <- function(x, ...) {
  i <- x$getinverse()
  if (!is.null(i)) {
    message("obtaining cached data")
    return(i)
  }
  d <- x$get()
  i <- solve(d, ...)
  x$setinverse(i)
  i
}

#--------------- TEST ---------------#
a <- matrix(c(2,3,4,5),2,2)
A1 <- makeCacheMatrix(a)
cacheSolve(A1)
