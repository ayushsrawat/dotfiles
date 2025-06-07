function port() { ps -ef | grep $1;}

function up() {
    local n=${1:-1};
    for ((i=1; i<=n; i++)); do
        cd .. || return
    done
}
