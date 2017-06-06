
my_func=foo
declare -A my_dictionary=( [key1]=value1 [key2]=value2 )

# pretty print define function for reading here documents into a variable
define(){ IFS='\n' read -r -d '' "${1}" || true; }

# use a Here document to create a template
# backtick allows commands or functions to inject derived content
define my_template <<EOF
function ${my_func}() {
    echo "executing ${my_func}"
    `typeset -p my_dictionary`
}
EOF

echo "${my_template}"

# source the here document variable to instantiate the function
# this is better than cat because echo is a builtin
#source <(echo "${my_template}")

# better yet is using path of stdin to avoid subshell
source /dev/stdin <<< "${my_template}"

foo

# alternative syntax sources here document in a single step with echo
source  <(
	define my_template <<-EOF
	    function my_test2() { 
	        echo "hello mars"
	    }
	EOF
	echo "${my_template}"
	)
my_test2


# alternative syntax sources here document in a single step with cat
source  <(
	cat <<-EOF
	    function my_test2() { 
	        echo "hello venus"
	    }
	EOF
	)
my_test2

