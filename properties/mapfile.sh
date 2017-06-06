
declare -A properties

readProperty() {

 local _line="${2}"
 local _key="${_line%%=*}"
 local _value="${_line##*=}"
 properties["${_key}"]="${_value}"
 }

# -t remove trailing newline
# -c invoke callback on every line
# -C the callback to be invoked
mapfile -t -c 1 -C readProperty < <(grep -v "#" my.properties)

echo "${!properties[@]}"
echo "${properties[@]}"
