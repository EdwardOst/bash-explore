pass_by_value() {

    declare -a argAry1=("${!1}")
    echo "${argAry1[@]}"

    declare -a argAry2=("${!2}")
    echo "${argAry2[@]}"
}

array1=( the quick brown fox )
array2=( the lazy dog )

pass_by_value array1[@] array2[@]
