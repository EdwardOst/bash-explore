
my_func=foo
declare -A my_dictionary=( [key1]=value1 [key2]=value2 )

# pretty print define function for reading here documents into a variable
define(){ IFS='\n' read -r -d '' ${1} || true; }

# use a Here document to create a template
# single quote escapes allow commands or functions to inject derived content
define my_template <<EOF
function ${my_func}() {
    `typeset -p my_dictionary`
}
EOF

echo "${my_template}"

# source the here document variable to instantiate the function
source <(echo "${my_template}")

foo

# alternative syntax sources here document in a single step
source  <(
	cat <<-EOF
	    function my_test2() { 
	        echo "hello mars"
	    }
	EOF
	)
my_test2


