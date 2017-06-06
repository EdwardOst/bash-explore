
myvar="--help"
case "${myvar}" in
  --)
    echo "double-hyphen"
    ;;
  --help)
    echo "help"
    ;;
  *)
    echo "no match"
    ;;
esac
