## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## This is a function which puts the inverse of the matrix into the cache. It consists of 4 functions
## and it returns these 4 functions in the form of  list. setmatrix sets the value of the matrix and NULLs the cache
## since a new value for the matrix has been set. getmatrix gets the matrix. setinverse sets the value of inverse
## and getinverse gets it. these 4 functions are returned as a list.

makeCacheMatrix <- function(x = matrix()) {
inverse<-NULL
setmatrix<-function(y) {
  x<<-y
  inverse<<-NULL
}
getmatrix<-function() x
setinverse<-function(x){inverse<<-solve(x)}
getinverse<- function() inverse
list(setmatrix = setmatrix, getmatrix = getmatrix,
     setinverse = setinverse,
     getinverse = getinverse)
}


## Write a short comment describing this function
## This function returns the inverse of the matrix passed to it. It first checks if the inverse is present in
## the cache. If so, it simply gets the data from the cache and returns it. Otherwise, it calculates the inverse
## and stores it in the cache, and then returns the inverse.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inverse <- x$getinverse()
  if(!is.null(inverse)) {
    message("getting cached data")
    return(inverse)
  }
  data <- x$getmatrix()
  inverse <- solve(data, ...)
  x$setinverse(inverse)
  inverse
}
