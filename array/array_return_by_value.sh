set -e
# set  -x

function return_some_array() {

    local -A myarray

    #myarray=( ["first"]="the" ["second"]="quick" ["third"]="brown" ["fourth"]="fox")
    myarray=([key1]="value1" [key2]="value2" [key3]="value3")

    typeset -p myarray
}

eval $(return_some_array)
echo "keys:   ${!myarray[@]}"
echo "values: ${myarray[@]}"
