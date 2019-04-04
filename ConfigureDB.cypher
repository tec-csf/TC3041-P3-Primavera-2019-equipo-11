USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///NodesBerkStan.csv" AS line
CREATE (:Site {siteID:line.nodeId});
CREATE INDEX ON :Site(siteID);

USING PERIODIC COMMIT 
LOAD CSV FROM "file:///web-BerkStan.csv" AS line FIELDTERMINATOR '\t'
MATCH (start:Site {siteID: line[0]})
MATCH (end:Site {siteID: line[1]})
MERGE (start)-[:Links_To]->(end);
