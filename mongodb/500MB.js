show dbs
use ycsb
db.adminCommand( { "setParameter": 1, "wiredTigerEngineRuntimeConfig": "cache_size=500MB"})
