set -e
# set -x

declare -A properties_arr

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


function array_to_local_var() {

    local -r -n properties=${1}

    for item in "${!properties[@]}"; do
       local "l_${item}"="${properties[${item}]}"
    done

    echo "my_func: l_var1=${l_var1}"
    echo "my_func: l_var2=${l_var2}"
    echo "my_func: l_var3=${l_var3}"
}

mapfile -t < <(grep -v "#" my.properties)

foreach MAPFILE parseProperty

echo "${!properties_arr[@]}"
echo "${properties_arr[@]}"

array_to_local_var properties_arr

echo "outer: l_var1=${l_var1}"
echo "outer: l_var2=${l_var2}"
echo "outer: l_var3=${l_var3}"
