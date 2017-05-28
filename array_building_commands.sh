somevar="hello world"
myvar="$somevar"

# myvar is expanded by the shell,
declare -a my_command=( "echo" "first arg" "second arg" "$myvar")
# and it is expanded again when assigned to the array
echo "my_command[0]: ${my_command[0]}"
echo "my_command[1]: ${my_command[1]}"
echo "my_command[2]: ${my_command[2]}"
echo "my_command[3]: ${my_command[3]}"
echo "array command: ${my_command[@]}"
# so by the time it gets to here it is already a string literal
"${my_command[@]}"


# myvar is not expanded by the shell because of the escape character,
declare -a my_command=( "echo" "first arg" "second arg" "\$myvar")
# this time the element at index 3 is a variable reference
echo "my_command[0]: ${my_command[0]}"
echo "my_command[1]: ${my_command[1]}"
echo "my_command[2]: ${my_command[2]}"
echo "my_command[3]: ${my_command[3]}"
echo "array command: ${my_command[@]}"
# the array ensures it is not expanded even when echo is executed
"${my_command[@]}"


# myvar is not expanded by the shell because of single quotes
declare -a my_command=( "echo" "first arg" "second arg" '$myvar')
# this time the element at index 3 is a variable reference
echo "my_command[0]: ${my_command[0]}"
echo "my_command[1]: ${my_command[1]}"
echo "my_command[2]: ${my_command[2]}"
echo "my_command[3]: ${my_command[3]}"
echo "array command: ${my_command[@]}"
# the array ensures it is not expanded even when echo is executed
"${my_command[@]}"
