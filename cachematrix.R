## Function will cache the solution to the inverse of a Matrix to save computing 
## time and power.

## makeaCacheMatrix will create a matrix object that caches the matrix's inverse

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinv <- function(solve) m <<- solve
  getinv <- function() m
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}


## cacheSOlve will calculate the inverse of the special matrix generated by
## makeCacheMatrix above. If inverse has already been calculated ir will retrive
## the value

cacheSolve <- function(x, ...) {
  m <- x$getinv()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)## Return a matrix that is the inverse of 'x'
  x$setinv(m)
  m
        
}
