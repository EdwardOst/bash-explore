set -e
#set -x

function parent() {

local var1
local var2
local var3

function set_env() {
    var1="hello"
    var2="world"
    var3="mars"
}

set_env

$@

}

function child() {

echo var1=${var1}
echo var2=${var2}
echo var3=${var3}

}

echo "setting environment variables with an inner function"

echo "executing child in parent context"
parent child

echo "outer:"
echo var1=${var1}
echo var2=${var2}
echo var3=${var3}

echo "executing child in global context"
set_env
child

echo "outer:"
echo var1=${var1}
echo var2=${var2}
echo var3=${var3}
