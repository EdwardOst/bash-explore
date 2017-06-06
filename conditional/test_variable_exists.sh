echo "### starting"

[ -z "${myvar+x}" ] && echo "myvar unset"
[ -z "${myvar:+x}" ] && echo "myvar unset or null"
[ -n "${myvar+x}" ] && echo "myvar initialized"
[[ -v myvar ]] && echo "[[ myvar exists ]]"
[[ ! -v myvar ]] && echo "[[ myvar does not exist ]]"
declare -p myvar


echo "### declaring"

declare myvar

[ -z "${myvar+x}" ] && echo "myvar unset"
[ -z "${myvar:+x}" ] && echo "myvar unset or null"
[ -n "${myvar+x}" ] && echo "myvar initialized"
[[ -v myvar ]] && echo "[[ myvar exists ]]"
[[ ! -v myvar ]] && echo "[[ myvar does not exist ]]"
declare -p myvar


echo "### setting to null"

myvar=

[ -z "${myvar+x}" ] && echo "myvar unset"
[ -z "${myvar:+x}" ] && echo "myvar unset or null"
[ -n "${myvar+x}" ] && echo "myvar initialized"
[[ -v myvar ]] && echo "[[ myvar exists ]]"
[[ ! -v myvar ]] && echo "[[ myvar does not exist ]]"
declare -p myvar


echo "### setting"

myvar="hello"

[ -z "${myvar+x}" ] && echo "myvar unset"
[ -z "${myvar:+x}" ] && echo "myvar unset or null"
[ -n "${myvar+x}" ] && echo "myvar initialized"
[[ -v myvar ]] && echo "[[ myvar exists ]]"
[[ ! -v myvar ]] && echo "[[ myvar does not exist ]]"
declare -p myvar


echo "### declare associative array"

declare -A myarr

[ -z "${myarr+x}" ] && echo "myarr unset"
[ -z "${myarr:+x}" ] && echo "myarr unset or null"
[ -n "${myarr+x}" ] && echo "myarr initialized"
[[ -v myarr ]] && echo "[[ myarr exists ]]"
[[ ! -v myarr ]] && echo "[[ myarr does not exist ]]"
declare -p myarr >/dev/null 2>&1 && echo "declare:exists" || echo "declare: does not exist"
[ "${#myarr[@]}" -lt 1 ] && echo "array is empty or undeclared" || echo "array exists"


echo "### setting associative array"

declare -A myarr=( [key1]=value1 )

[ -z "${myarr+x}" ] && echo "myarr unset"
[ -z "${myarr:+x}" ] && echo "myarr unset or null"
[ -n "${myarr+x}" ] && echo "myarr initialized"
[[ -v myarr ]] && echo "[[ myarr exists ]]"
[[ ! -v myarr ]] && echo "[[ myarr does not exist ]]"
declare -p myarr >/dev/null 2>&1 && echo "declare:exists" || echo "declare: does not exist"
[ "${#myarr[@]}" -lt 1 ] && echo "array is empty or undeclared" || echo "array exists"
