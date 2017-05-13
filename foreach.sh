#set -x

function foreach() {

    local -n _arr=${1}

    for item in "${!_arr[@]}"; do
       $2 ${_arr[${item}]}
    done
}

function oper() {
    echo $1
}

myarr=( "a" "b" "c" )

foreach myarr oper

declare -A mydict=( [key1]=value1 [key2]=value2 [key3]=value3 )

foreach mydict oper
