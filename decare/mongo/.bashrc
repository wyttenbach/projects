
if [ -z "$MONGO_HOME" ]; then
    echo WARNING: MONGO_HOME not set
else
    export PATH="$PATH:$(cygpath $MONGO_HOME)/bin"
fi

export MONGO_SERVER=${MONGO_SERVER:=va33dlvaws303.decare.com}
export MONGO_DB=${MONGO_DB:=nucleus}
export MONGO_DUMP=${MONGO_DUMP:=$DRW/backups/$(date +"%Y-%m-%d")}

function dump {
    if [ ! -d $MONGO_DUMP ]; then
        echo mkdir -p $MONGO_DUMP || return
    fi
    if [ -d $MONGO_DUMP/dump ]; then
        echo "There is already a dump here"
        return
    fi
    echo $MONGO_DUMP
    (cd $MONGO_DUMP && mongodump -h $MONGO_SERVER -d $MONGO_DB -c GroovyScriptResult)
}

function restore {
    mongorestore -h $MONGO_SERVER -d $MONGO_DB "$@"
}

. $PROJECT_HOME/.bashrc-server
