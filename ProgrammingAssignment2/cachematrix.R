## These functions cache a matrix and inverse matrix

## This function takes a matrix and creates two caches for a matrix and inverse matrix
## and functions which are used to modify them.

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y) {
        x <<- y
        i <<- NULL
    }
    get <- function() x
    setinverse <- function(inv) i <<- inv
    getinverse <- function() i
    list (set = set, get = get, setinverse = setinverse, getinverse = getinverse)
    

}


## This function solves for, caches and returns an inverse matrix.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    i <- x$getinverse()
    if(!is.null(i)){
        message("getting cached data")
        return(i)
    }
    mat <- x$get()
    i <- solve(mat)
    x$setinverse(i)
    i
}
