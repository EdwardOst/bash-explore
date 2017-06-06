{

# local can only be used in a function
# local myvar="hello world"

# unlike when used in functions, this is a global shell variable
declare myvar="hello world"

echo "inside: $myvar"
}


echo "outside: $myvar"
