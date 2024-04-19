if [ $# == 0 ]; then
    echo Usage: remove runId
    exit 1
fi
$PROJECT_HOME/bin/mongo.sh --eval "var runId=\"$1\"" $PROJECT_HOME/bin/remove.js