declare -A my_map=( [key1]=value1 [key2]=value2 )

echo "keys:   ${!my_map[@]}"
echo "values: ${my_map[@]}"

declare -A my_map=( [key11]=value11 [key22]=value22 )

echo "keys:   ${!my_map[@]}"
echo "values: ${my_map[@]}"
