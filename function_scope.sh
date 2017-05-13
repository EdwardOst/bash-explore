set -e
# set -x

function parent() {

    local _myvar1="parent"
    local _myvar2="scope"

    function nested() {
        echo "nested : ${_myvar1} ${_myvar2} : ${1}"
    }

    "${@}"

    #   local -n commands=${1}
    #   ("${commands[@]}")
    #   for _mycmd in "${commands[@]}"; do
    #      ${_mycmd}
    #   done;

}


function outside() {
    echo "outside : ${_myvar1} ${_myvar2} : ${1}"
}

_myvar1="global"
_myvar2="scope"

echo "calling a nested function from within the parent fuction inherits the parent function scope"
echo "executing: parent nested parent_context"
parent nested parent_context

echo "calling the same nested function without the parent scope receives the global scope"
echo "executing: nested no_context"
nested no_context

echo "calling a non-nested function from within the parent function also inherits the parent function scope"
echo "executing: parent outside parent_context"
parent outside parent_context

echo "calling a non-nested function without the parent scope receives the global scope"
echo "executing: outside no_context"
outside no_context

# myCommands[0]='echo _myvar1="${_myvar1}"'
# myCommands[1]='echo _myvar2="${_myvar2}"'

# parent myCommands

