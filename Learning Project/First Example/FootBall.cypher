// Création des joueurs
CREATE (hakimi:Joueur {nom: 'Hakimi', prenom: 'Achraf', age: 23}),
       (cristiano:Joueur {nom: 'Ronaldo', prenom: 'Cristiano', age: 36}),
       (messi:Joueur {nom: 'Messi', prenom: 'Lionel', age: 34}),
       (mbappe:Joueur {nom: 'Mbappe', prenom: 'Kylian', age: 23});

// Création des équipes
CREATE (psg:Equipe {nom: 'PSG'}),
       (fcb:Equipe {nom: 'FCB'}),
       (alnasser:Equipe {nom: 'AlNassr'});

// Création des entraîneurs
CREATE (entraineur1:Entraineur {nom: 'EntraineurPSG'}),
       (entraineur2:Entraineur {nom: 'EntraineurFCB'}),
       (entraineur3:Entraineur {nom: 'EntraineurAlNassr'});

// Création des relations entre joueurs et équipes
CREATE (hakimi)-[:JOUE_POUR]->(psg),
       (cristiano)-[:JOUE_POUR]->(alnasser),
       (messi)-[:JOUE_POUR]->(fcb),
       (mbappe)-[:JOUE_POUR]->(psg);

// Création des relations entre entraîneurs et équipes
CREATE (entraineur1)-[:ENTRAINE]->(psg),
       (entraineur2)-[:ENTRAINE]->(fcb),
       (entraineur3)-[:ENTRAINE]->(alnasser);

// Création des relations d'amitié
CREATE (mbappe)-[:AMI]->(hakimi),
       (messi)-[:AMI]->(cristiano);


// Mettre à jour un joueur
MATCH (j:Joueur {nom: 'Mbappe'})
SET j.age = 24;

// Mettre à jour une propriété d'une relation
MATCH (j:Joueur {nom: 'Mbappe'})-[r:JOUE_POUR]->(e:Equipe {nom: 'PSG'})
SET r.duree_contrat = 5;

// Ajouter une propriété de salaire à un joueur
MATCH (j:Joueur {nom: 'Mbappe'})
SET j.salaire = 200000;

// Filtrer pour les nœuds spécifiques
MATCH (j:Joueur)
WHERE j.age > 30
RETURN j;

// Obtenir un joueur spécifique
MATCH (j:Joueur {nom: 'Mbappe'})
RETURN j;

// Obtenir tous les joueurs
MATCH (j:Joueur)
RETURN j;

// Obtenir tous les joueurs qui ne sont pas Hakimi
MATCH (j:Joueur)
WHERE NOT j.nom = 'Hakimi'
RETURN j;

// Utilisation d'opérations arithmétiques
MATCH (j:Joueur)
WHERE j.age * 2 > 50
RETURN j;

// Utilisation de multiples conditions
MATCH (j:Joueur)
WHERE j.age > 25 AND j.salaire > 100000
RETURN j;

// Limiter les résultats à 2
MATCH (j:Joueur)
RETURN j
LIMIT 2;

// Ordonner les résultats par âge décroissant
MATCH (j:Joueur)
RETURN j
ORDER BY j.age DESC;

// Filtrer plusieurs nœuds en même temps
MATCH (j:Joueur), (e:Equipe)
WHERE j.age > 25 AND e.nom = 'PSG'
RETURN j, e;

// Requête pour les relations
MATCH (j:Joueur)-[r:JOUE_POUR]->(e:Equipe)
RETURN j, r, e;

// Obtenir tous les coéquipiers de Hakimi qui gagnent 45 millions
MATCH (hakimi:Joueur {nom: 'Hakimi'})-[:JOUE_POUR]->(e:Equipe)<-[:JOUE_POUR]-(coequipier:Joueur)
WHERE coequipier.salaire = 45000000
RETURN coequipier;

// Agrégation
MATCH (j:Joueur)
RETURN COUNT(j) AS total_joueurs;

// Supprimer un nœud
MATCH (j:Joueur {nom: 'Mbappe'})
DELETE j;

// Supprimer une relation
MATCH (j:Joueur {nom: 'Mbappe'})-[r:JOUE_POUR]->()
DELETE r;

// Supprimer tous les nœuds
MATCH (n)
DETACH DELETE n;
