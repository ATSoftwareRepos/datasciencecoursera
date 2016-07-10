## There are two functions in this program to cache a matrix and its inverse.
## 

## This function creates a cache matrix with environment variables that are
## used to set and get the matrix and its inverse in cache

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


##This function solves for the inverse of the matrix, caches it, and returns it,
##if it doesn't exist. If it does exist it just returns the inverse.

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
