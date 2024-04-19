#!/bin/bash
mongo.sh <<EOF
runId='$1'
db.GroovyScriptResult.remove({runId: runId})
EOF