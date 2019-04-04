USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///NodesBerkStan.csv" AS line
CREATE (:Site {:line.nodeId});
CREATE INDEX ON :Site(nodeId);


USING PERIODIC COMMIT LOAD CSV WITH HEADERS FROM "file:///web-BerkStan.csv" AS line FIELDTERMINATOR '\t'
MATCH (start:Node {nodeID: line.FromNodeId})
MATCH (end:Node {nodeID: line.ToNodeId})
MERGE (start)-[:Links_To]->(end);


