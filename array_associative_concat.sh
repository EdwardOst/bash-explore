set -e
# set -x

# +m: Disable monitor mode (job control). Background processes display their
#     exit status upon completion when in monitor mode (we don't want that).
set +m
shopt -s lastpipe


# myprint arrname [ arrname ... ]
function myprint {
    typeset -n _result=$1
    typeset -n _arr
    typeset IFS=|
    for _arr in "${@:1}"; do     # nameref provides useful behavior
        for key in "${!_arr[@]}"; do
            _result[${key}]="${_arr[${key}]}"
        done
    done
}

declare -A summary
declare -A a b c
a=([k1]="a1" [k2]="a2" [k3]="a3")
b=([l1]="b1" [l2]="b2" [l3]="b3")
c=([m1]="c1" [m2]="c2" [m3]="c3")
myprint summary a b c
echo "indexes: ${!summary[@]}"
echo "values: ${summary[@]}"
