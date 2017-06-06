# sum name arrname [ arrname ... ]
function sum {
    typeset -n _result=$1
    typeset -n _arr
    typeset IFS=+
    _result=0
    for _arr in "${@:2}"; do                        # Demonstrate the special property of "for" on a nameref.
        (( _result += ${_arr[*]} ))
        printf '%s = %d\n' "${!_result}" "$_result" # Demonstrate the special property of ${!ref} on a nameref.
    done
}

a=(1 2 3) b=(6 5 4) c=(2 4 6)
sum total a b c
printf 'Final value of "total" is: %d\n' "$total"
