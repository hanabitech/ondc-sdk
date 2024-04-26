ENV_FILE="$1"
CMD=${@:2}

set -o allexport
source $ENV_FILE
set +o allexport

$CMD

chmod 755 mdeep run_with_env.sh