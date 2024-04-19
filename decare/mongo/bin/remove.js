db.GroovyScriptResult.remove({runId: runId});
print(db.getLastErrorObj().n);
