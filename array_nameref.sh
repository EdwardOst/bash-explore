set -e
set -x

# myprint arrname [ arrname ... ]
function myprint {
    typeset -n _result=$1 _arr
    typeset IFS=|
    for _arr in "${@:2}"; do                        # Demonstrate the special property of "for" on a nameref.
        _result="${_arr[*]}" 
        echo "${!_result}"
        echo "${_result}"
        printf '%s = %s\n' "${!_result}" "${_result}" # Demonstrate the special property of ${!ref} on a nameref.
    done
}

a=([key1]="a1" [key2]="a2" [key3]="a3") b=([key1]="b1" [key2]="b2" [key3]="b3") c=([key1]="c1" [key2]="c2" [key3]="c3")
#a=("a1" "a2" "a3") b=("b1" "b2" "b3") c=("c1" "c2" "c3")
myprint summary a b c
printf 'summary: %s\n' "$summary"
