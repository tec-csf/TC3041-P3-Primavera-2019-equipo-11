# Obtener los 5 sitios que se conectan a m�s sitios. 
MATCH (n:Site)-[r:Links_To]->() RETURN DISTINCT n.siteID, count(r) ORDER BY count(r) desc LIMIT 5

# Obtiene el camino m�s corto entre dos sitios y su longitud. Ejemplo: 1 y 100
MATCH (n:Site { siteID: '1' }), (m:Site { siteID: '100' }), p = shortestPath((n)-[*]-(m)) RETURN p, length(p)

# Sitios que no conectan a ning�n otro sitio.

MATCH (n) WHERE NOT (n:Site)-[:Links_To]->() RETURN DISTINCT n.siteID ORDER BY n.siteID asc