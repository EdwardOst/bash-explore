set -e
# set  -x

echo "outer_FUNCNAME=$FUNCNAME"
echo "outer_0=$0"

function myfunc() {

echo "inner_FUNCNAME=$FUNCNAME"
echo "inner_0=$0"

}

myfunc
