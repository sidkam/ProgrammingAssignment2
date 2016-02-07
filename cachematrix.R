## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {	## Constructor function for inverse functions
        i <- NULL				## Initialize value of inverse variable
        set <- function(y) {			## Assign value of y to x in constructor function environment
                x <<- y
                i <<- NULL
        }
        get <- function() x			## Returns value of x from constructor function environment
        setinverse <- function(solve) i <<- solve	## Defines setinverse functions and sets value of i
        getinverse <- function() i			## Defines getinverse functions and gets value of i
        list(set = set, get = get,			## Defines list of all functions
             setinverse = setinverse,
             getinverse = getinverse)

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'    
        ## Function uses the matrix object created by makeCacheMatrix
        i <- x$getinverse()						## Assigns the inverse of matrix to i			
        if(!is.null(i)) {						## Checks if inverse matrix is empty
                message("getting cached data")	
                return(i)						##	If not empty return data from cache
        }
        data <- x$get()							## If i is empty, assign value of x to data
        i <- solve(data, ...)					        ## Assign inverse of data to i
        x$setinverse(i)							## Assigns value of i to value of i in constructor function
        i								## returns value of i
}
