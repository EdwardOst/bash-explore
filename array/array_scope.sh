declare -a myarr_outside=( x y )

function myfunc() {

    declare -a -g myarr=( value1 value2 )
    # implicit local scope
    declare -a myarr_local=( value1 value2 )
    declare -a myarr_outside=( value1 value2  )

    echo "myarr inside: ${myarr[@]}"
    echo "myarr_local inside: ${myarr_local[@]}"
    echo "myarr_outside inside: ${myarr_outside[@]}"

    function mycommand() {
        echo "myarr nested: ${myarr[@]}"
        echo "myarr_local nested: ${myarr_local[@]}"
        echo "myarr_outside nested: ${myarr_outside[@]}"
    }

    mycommand

}

myfunc

echo "myarr outside: ${myarr[@]}"
echo "myarr_local outside: ${myarr_local[@]}"
echo "myarr_outside outside: ${myarr_outside[@]}"
