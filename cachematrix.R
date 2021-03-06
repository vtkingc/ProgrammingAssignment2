## This program consists of a pair of functions that
## cache the inverse of a matrix.  It is assumed that
## the matrix supplied is always invertible.

## `makeCacheMatrix`: This function creates a special "matrix" object
##  that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
        inverse <- NULL
        set <- function(y) {
                x <<- y
                inverse <<- NULL
        }
        get <- function() x
        setInverse <- function(inv) inverse <<- inv
        getInverse  <- function() inverse
        
        list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)        
}


## `cacheSolve`: This function computes the inverse of the special
##  "matrix" returned by `makeCacheMatrix` above. If the inverse has
##  already been calculated (and the matrix has not changed), then
##  `cacheSolve` should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inverse <- x$getInverse()
        if (!is.null(inverse)) {
                message("cacheSolve: inverse is cached")
                return(inverse)
        }
        
        matrixObject <- x$get()
        inverse <- solve(matrixObject, ...)
        
        x$setInverse(inverse)
        inverse
}
