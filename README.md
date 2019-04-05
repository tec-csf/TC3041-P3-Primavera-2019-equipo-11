# TC3041-P3-Primavera-2019
Orientaciones para la Práctica 3. Graph databases

Paso 1. Abrir una terminal en linux y ejecutar el comando siguiente, para crear el contenedor de Neo4j:

    docker run --name=neo4j -m=4g --publish=7474:7474 --publish=7687:7687 --volume=$HOME/neo4j/data:/data --env=NEO4J_AUTH=none neo4j

Paso 2. Descargar, descomprimir y convertir a .csv el archivo encontrado aquí: https://snap.stanford.edu/data/web-BerkStan.html

Paso 3. Copiar, con docker, en el directorio import los archivos csv que se descargo en el Paso 2, y el archivo NodesBerkStan.csv, con los siguientes comandos:

    docker cp NodesBerkStan.csv neo4j:/var/lib/neo4j/import/
    docker cp web-BerkStan.csv neo4j:/var/lib/neo4j/import/

Paso 4. Ejecutar los comandos que se encuentra en ConfigureDB.cypher para crear la base de datos en Neo4j.

Paso 5. Utilizar el programa pipeline.py que ejecutará los comandos presentado en el archivo P3queries.cypher

Nota: Se necesita unas librerias para ejecutar el programa con python, se descargan con los siguientes comandos:

    pip install neo4j
    pip install neo4j-driver
  
