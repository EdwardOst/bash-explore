
function finish() {
    echo "starting finish"
    [[ ${FD} > 0 ]] && exec {FD}>&-
    echo "finished"
}

trap finish EXIT

# the {FD} will get the first open descriptor starting at 10
# note that no $ is used when creating it
exec {FD}> test.txt
echo "FD: ${FD}" >&2
echo "line 1" >&${FD}
echo "line 2" >&${FD}
