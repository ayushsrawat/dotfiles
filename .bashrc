# linux
function port() {
    ss -lptn "sport = :$1"
    #local pid=$(ss -lptn "sport = :$1" | awk -F ',' '/pid=/ {print $2}' | cut -d '"' -f1)
    local pid=$(ss -lptn "sport = :$1" | grep -oP 'pid=\K\d+')
    [ -n "$pid" ] && echo -n "$pid" | xclip -selection clipboard
}

function up() {
    local n=${1:-1};
    for ((i=1; i<=n; i++)); do
        cd .. || return
    done
}
