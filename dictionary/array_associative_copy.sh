set -e
# set -x

# +m: Disable monitor mode (job control). Background processes display their
#     exit status upon completion when in monitor mode (we don't want that).
set +m
shopt -s lastpipe

function copy_array {
    declare -n _source=$1
    declare -n _target=$2
    typeset IFS=|
    for key in "${!_source[@]}" ; do
#        _target+=([${key}]="${_source[${key}]}")
        _target+=([${key}]="${_source[${key}]}")
    done
}

declare -A target
declare -A a
a=([k1]="a1" [k2]="a2" [k3]="a3")
copy_array a target
echo "indexes: ${!target[@]}"
echo "values: ${target[@]}"
