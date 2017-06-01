#shopt -s extglob
myvar="   hello world   "
echo "|${myvar}|"
myvar="${myvar/#+( )}"
echo "|${myvar}|"
myvar="${myvar/%+( )}"
echo "|${myvar}|"
