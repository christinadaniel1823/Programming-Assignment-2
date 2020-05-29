## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {   ##create a fucntion  
  i <- NULL             ## set a functin where you take the value of x
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setInverse <- function(inv) i <<- inv   ## set and get Inverse  by the setInverse and getInverse
  getInverse <- function() i
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
  
}




cacheSolve <- function(x) ## Return a matrix that is the inverse of 'x'
{
  i <- x$getInverse()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data)
  x$setInverse(i)
  i
}

output :
  
  

my_matrix <- makeCacheMatrix(matrix(1:4, 2, 2))
> my_matrix$get()
[,1] [,2]
[1,]    1    3
[2,]    2    4
> my_matrix$getInverse()
NULL
> cacheSolve(my_matrix)
[,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
> cacheSolve(my_matrix)
getting cached data
[,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
> my_matrix$getInverse()
[,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5

