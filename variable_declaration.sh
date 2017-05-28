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
