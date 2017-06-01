declare -A dictionary=( [var1]=value1 [var2]=value2 )

echo "${!dictionary[@]}"
echo "${dictionary[@]}"

function assign() {
    [ ${#} -lt 2 ] && echo "usage: assign <var_name> <value>" && exit 1
    local -n var="${1}"
    var="${2}"
}


# pretty print define function for reading here documents into a variable
define(){ IFS='\n' read -r -d '' ${1} || true; }

# use a Here document to create a template
# backtick allows commands or functions to inject derived content
define scope_context <<EOF
    local var1=value1
    local var2=value2
EOF

echo "${scope_context}"

function myfunc() {
    source <(echo "${scope_context}")
    echo "inside: var1: ${var1}"
    echo "inside: var2: ${var2}"
}

myfunc
echo "outside: var1: ${var1}"
echo "outside: var2: ${var2}"

function myfunc() {
    local -n myscope="${1}"
    source <(echo "${myscope}")
    echo "inside: var1: ${var1}"
    echo "inside: var2: ${var2}"
}

myfunc scope_context
echo "outside: var1: ${var1}"
echo "outside: var2: ${var2}"
