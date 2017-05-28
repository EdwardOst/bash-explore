function implicit_local() {
    declare -A mydict=( [key1]=value1 [key2]=value2 )
}

function explicit_global() {
    declare -g -A mydict=( [key1]=value1 [key2]=value2 )
}


[ -z "${mydict:+x}" ] && echo "mydict not initialized"

echo "implicit local declarations are not reflected in calling scope"
implicit_local
[ -z "${mydict:+x}" ] && echo "mydict not initialized"
echo "keys:   ${!mydict[@]}"
echo "values: ${mydict[@]}"

echo "with explicit global declaration the array is reflected in calling scope"
explicit_global
[ -z "${mydict:+x}" ] && echo "mydict not initialized"
echo "keys:   ${!mydict[@]}"
echo "values: ${mydict[@]}"

