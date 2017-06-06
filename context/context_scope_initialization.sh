# a local variable can be initialized to a shell variable of the same name if done in the declaration statement

function myfunc() {
    local my_var="${1:-${MY_VAR:-${my_var:-${myVarDefault:-defaultValue}}}}"
    echo "myfunc: ${my_var}"
}


# prints "arg only"
myfunc "arg only"

my_var="shell var"

# prints "shell var"
myfunc

MY_VAR="env var"
# prints "env var"
myfunc
