from neo4j import GraphDatabase

driver = GraphDatabase.driver("bolt://localhost:7687", auth=("neo4j", "password"))
#driver = GraphDatabase.driver("bolt://10.49.95.97:7687", auth=("neo4j", "password")) #para conectarse remotamente a una ip

q1 = "MATCH (n:Site)-[r:Links_To]->()" "RETURN DISTINCT n.siteID, count(r) ORDER BY count(r) desc LIMIT 5"

q2 = "MATCH (n) WHERE NOT (n:Site)-[:Links_To]->() RETURN DISTINCT n.siteID ORDER BY n.siteID desc"

q3 = "MATCH (n:Site { siteID: '1' }),(m:Site { siteID: '100' }), p = shortestPath((n)-[*]-(m)) RETURN p, length(p)"

with driver.session() as session:
	query1 = session.run(q1)

with driver.session() as session:
    query2 = session.run(q2)

with driver.session() as session:
    query3 = session.run(q3)

print("Query 1: Obtener los 5 sitios que se conectan a mas sitios.")
for node in query1:
    q1 = "Sitio: " + node["n.siteID"] + " Links Totales: " + str(node ["count(r)"])
    print (q1)
    
print("\nQuery 2: Obtener los sitios que no conectan a ningun otro sitio.")
print("Sitios que no conectan a otro sitio:")
for node in query2:
    q2 = "Sitio: " + node["n.siteID"]
    print(q2)

print("\nQuery 3: Obtiene el camino mas corto entre dos sitios y su longitud. Ejemplo: 1 y 100")
print("Camino mas corto:")
for node in query3:
    q3 = node["p"]
    print(q3)
    print(" Longitud: " + str(node["length(p)"]))
