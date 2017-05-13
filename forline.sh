set -e
# set -x

function forline() {

    [ ${#} -lt 2 ] && echo "usage: forline <file> <operation>" && exit 1

    local _file="${1}"
    local _operation="${2}"
    local _line

    while IFS='' read -r _line || [[ -n "${_line}" ]]; do
        ${_operation} "${_line}"
    done < "${_file}"
}


function oper() {
    echo "read from file: ${1}"
}

forline myfile.txt oper
