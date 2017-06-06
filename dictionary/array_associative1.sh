function funky() {
    local -n ARR=$1
    ARR[foo]="bam"
    echo "indexes: ${!ARR[@]}"
    echo "values: ${ARR[@]}"
}

declare -A HASH

HASH=([foo]=bar [zoom]=fast)
echo "${HASH[@]}"
funky HASH # notice that I'm just passing the word 'HASH' to the function
echo "${HASH[@]}"
