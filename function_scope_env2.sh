set -e
#set -x

function parent() {

local var1
local var2
local var3

set_env

$@

}

function set_env() {
    var1="hello"
    var2="world"
    var3="mars"
}


function child() {

echo var1=${var1}
echo var2=${var2}
echo var3=${var3}

}


echo "setting environment variables with a top level function"

echo "executing top level child function in parent context"
parent child

echo "outer:"
echo var1=${var1}
echo var2=${var2}
echo var3=${var3}

echo "executing top level child in global context"
set_env
child

echo "outer:"
echo var1=${var1}
echo var2=${var2}
echo var3=${var3}
