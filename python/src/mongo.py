#!/usr/bin/env python
import pymongo

myclient = pymongo.MongoClient("mongodb://localhost/")

mydb = myclient["nucleus"]

collist = mydb.list_collection_names()
if "GroovyScriptResult" in collist:
  print("The collection exists.")

mycol = mydb["GroovyScriptResult"]

# DeprecationWarning: count is deprecated. Use Collection.count_documents instead.
x = mycol.find({})
print(x.count())

y = mycol.count_documents({})
print(y)

# A record from the earliest runId
print(x.sort("runId",pymongo.ASCENDING)[0])


