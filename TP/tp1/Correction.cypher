// Création des nœuds de type Personne avec les propriétés spécifiées
CREATE (:Personne {nom: 'Ahmed', age: 25, ville: 'Tinghir'}),
       (:Personne {nom: 'Fatima', age: 20, ville: 'Ouarzazate'}),
       (:Personne {nom: 'Yasmina', age: 32, ville: 'Rabat'}),
       (:Personne {nom: 'Omar', age: 16, ville: 'Marrakech'}),
       (:Personne {nom: 'Hicham', age: 27, ville: 'Skoura'});

// Création des relations CONNAIT dans les deux sens entre les personnes
MATCH (a:Personne {nom: 'Ahmed'}), (f:Personne {nom: 'Fatima'})
CREATE (a)-[:CONNAIT]->(f),
       (f)-[:CONNAIT]->(a);

MATCH (a:Personne {nom: 'Ahmed'}), (y:Personne {nom: 'Yasmina'})
CREATE (a)-[:CONNAIT]->(y),
       (y)-[:CONNAIT]->(a);

MATCH (f:Personne {nom: 'Fatima'}), (y:Personne {nom: 'Yasmina'})
CREATE (f)-[:CONNAIT]->(y),
       (y)-[:CONNAIT]->(f);

MATCH (o:Personne {nom: 'Omar'}), (h:Personne {nom: 'Hicham'})
CREATE (o)-[:CONNAIT]->(h),
       (h)-[:CONNAIT]->(o);

MATCH (h:Personne {nom: 'Hicham'}), (y:Personne {nom: 'Yasmina'})
CREATE (h)-[:CONNAIT]->(y),
       (y)-[:CONNAIT]->(h);

// Sélection de tous les nœuds de type Personne
MATCH (p:Personne)
RETURN p;

// Sélection du nœud représentant "Ahmed" et affichage de ses propriétés
MATCH (p:Personne {nom: 'Ahmed'})
RETURN p;

// Sélection de toutes les relations CONNAIT
MATCH (:Personne)-[r:CONNAIT]->(:Personne)
RETURN r;

// Sélection de toutes les personnes que Fatima connaît
MATCH (:Personne {nom: 'Fatima'})-[:CONNAIT]->(p:Personne)
RETURN p;

// Sélection de toutes les personnes qui ne connaissent personne
MATCH (p:Personne)
WHERE NOT (p)-[:CONNAIT]->()
RETURN p;

// Sélection de toutes les personnes qui ont plus de deux amis
MATCH (p:Personne)-[:CONNAIT]->(f:Personne)
WITH p, COUNT(f) AS nbAmis
WHERE nbAmis > 2
RETURN p;

// Modification de l'âge de "Fatima" pour le mettre à 25
MATCH (p:Personne {nom: 'Fatima'})
SET p.age = 25;

// Ajout d'une nouvelle propriété ville au nœud "Omar" et définition de sa valeur sur "Casablanca"
MATCH (p:Personne {nom: 'Omar'})
SET p.ville = 'Casablanca';

// Suppression de la relation CONNAIT entre "Ahmed" et "Fatima"
MATCH (:Personne {nom: 'Ahmed'})-[r:CONNAIT]->(:Personne {nom: 'Fatima'})
DELETE r;

// Suppression du nœud représentant "Hicham"
MATCH (p:Personne {nom: 'Hicham'})
DELETE p;
