set -e
# set -x

declare -A properties_arr

function assign() {
    [ ${#} -lt 2 ] && echo "usage: assign <var_name> <value>" && exit 1
    local -n var="${1}"
    var="${2}"
}

function foreach() {

    typeset -n _arr=${1}

    for item in "${!_arr[@]}"; do
       "${2}" "${_arr[${item}]}" "${item}" 
    done
}


function parseProperty() {
    local _line="${1}"
    local _key="${_line%%=*}"
    local _value="${_line##*=}"
    properties_arr["${_key}"]="${_value}"
}


mapfile -t < <(grep -v "#" my.properties)

foreach MAPFILE parseProperty

function array_to_local_var() {

    local -r -n properties=${1}
    local "${!properties[@]}"
    for item in "${!properties[@]}"; do
        assign "${item}" "${properties[${item}]}"
    done

    echo "my_func: var1=${var1}"
    echo "my_func: var2=${var2}"
    echo "my_func: var3=${var3}"
}

echo "${!properties_arr[@]}"
echo "${properties_arr[@]}"

array_to_local_var properties_arr

echo "outer: var1=${var1}"
echo "outer: var2=${var2}"
echo "outer: var3=${var3}"
