declare -A var

function func {
local -n array=$1
array=([ci]=a [ca]=b [bo]=z)
}

func var 
echo "indexes: ${!var[@]}"
echo "values: ${var[@]}"
