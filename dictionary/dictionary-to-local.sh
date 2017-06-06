declare -A dictionary=( [var1]=value1 [var2]=value2 )

echo "${!dictionary[@]}"
echo "${dictionary[@]}"

function assign() {
    [ ${#} -lt 2 ] && echo "usage: assign <var_name> <value>" && exit 1
    local -n var="${1}"
    var="${2}"
    debugVar "${!var}"
}


function myfunc() {
    local "${!dictionary[@]}"

    for varname in "${!dictionary[@]}"; do
        assign "${varname}" "${dictionary[${varname}]}"
    done
    echo "inside: var1: ${var1}"
    echo "inside: var2: ${var2}"
}


myfunc

echo "outside: var1: ${var1}"
echo "outside: var2: ${var2}"
