// Football Database

//1. Création des noeuds://

//Équipes://

CREATE (:Equipe {nom: 'Paris Saint-Germain'});
CREATE (:Equipe {nom: 'Al Nassr'});
CREATE (:Equipe {nom: 'Real Madrid'});

//Entraîneurs://

CREATE (:Entraîneur {nom: 'Luis Enrique', prenom: 'Luis', nationalité: 'Espagnol', salaire_annuel: 12000000});
CREATE (:Entraîneur {nom: 'Rudi Garcia', prenom: 'Rudi', nationalité: 'Français', salaire_annuel: 8000000});
CREATE (:Entraîneur {nom: 'Carlo Ancelotti', prenom: 'Carlo', nationalité: 'Italien', salaire_annuel: 12500000});

//Joueurs (3 par équipe)://

//PSG://

CREATE (:Joueur {nom: 'Achraf Hakimi', prenom: 'Achraf', nationalité: 'Marocain', age: 24, salaire_annuel: 12000000});
CREATE (:Joueur {nom: 'Marquinhos', prenom: 'Marcos', nationalité: 'Brésilien', age: 28, salaire_annuel: 11000000});
CREATE (:Joueur {nom: 'Marco Verratti', prenom: 'Marco', nationalité: 'Italien', age: 30, salaire_annuel: 10000000});

//Al Nassr://

CREATE (:Joueur {nom: 'Cristiano Ronaldo', prenom: 'Cristiano', nationalité: 'Portugais', age: 37, salaire_annuel: 20000000});
CREATE (:Joueur {nom: 'Gervinho', prenom: 'Gervinho', nationalité: 'Ivoirien', age: 35, salaire_annuel: 4000000});
CREATE (:Joueur {nom: 'Vincent Aboubakar', prenom: 'Vincent', nationalité: 'Camerounais', age: 31, salaire_annuel: 6000000});

//Real Madrid://

CREATE (:Joueur {nom: 'Karim Benzema', prenom: 'Karim', nationalité: 'Français', age: 35, salaire_annuel: 23000000});
CREATE (:Joueur {nom: 'Luka Modrić', prenom: 'Luka', nationalité: 'Croate', age: 37, salaire_annuel: 10500000});
CREATE (:Joueur {nom: 'Toni Kroos', prenom: 'Toni', nationalité: 'Allemand', age: 33, salaire_annuel: 15000000});

//2. Création des relations (corrigée)://

//Entraîneur - Équipe://

MATCH (coach1:Entraîneur {nom: 'Luis Enrique'}), (psg:Equipe {nom: 'Paris Saint-Germain'})
CREATE (coach1)-[:ENTRAINE]->(psg);

// Répétez le même motif pour les autres entraîneurs et équipes...

MATCH (coach3:Entraîneur {nom: 'Carlo Ancelotti'}), (real:Equipe {nom: 'Real Madrid'})
CREATE (coach3)-[:ENTRAINE]->(real);

//Joueur - Équipe://

// PSG
MATCH (hakimi:Joueur {nom: 'Achraf Hakimi'}), (psg:Equipe {nom: 'Paris Saint-Germain'})
CREATE (hakimi)-[:JOUE_POUR]->(psg);

// Répétez le même motif pour les autres joueurs et équipes...

MATCH (kroos:Joueur {nom: 'Toni Kroos'}), (real:Equipe {nom: 'Real Madrid'})
CREATE (kroos)-[:JOUE_POUR]->(real);

//Joueur - Joueur (amitié) (adapté pour 3 joueurs par équipe)://

// Amitiés entre joueurs du PSG
MATCH (hakimi:Joueur {nom: 'Achraf Hakimi'}), (marquinhos:Joueur {nom: 'Marquinhos'})
CREATE (hakimi)-[:AMITIE]->(marquinhos),
(marquinhos)-[:AMITIE]->(hakimi); // Relation bidirectionnelle

// Amitiés entre joueurs d'Al Nassr
MATCH (cristiano:Joueur {nom: 'Cristiano Ronaldo'}), (konan:Joueur {nom: 'Gervinho'})
CREATE (cristiano)-[:AMITIE]->(konan),
(konan)-[:AMITIE]->(cristiano); // Relation bidirectionnelle

// Amitiés entre joueurs du Real Madrid (adapter en fonction des joueurs)
MATCH (benzema:Joueur {nom: 'Karim Benzema'}), (modric:Joueur {nom: 'Luka Modrić'})
CREATE (benzema)-[:AMITIE]->(modric),
(modric)-[:AMITIE]->(benzema);  // Relation bidirectionnelle

//Équipe - Équipe (rivalité)://

MATCH (psg:Equipe {nom: 'Paris Saint-Germain'}), (real:Equipe {nom: 'Real Madrid'})
CREATE (psg)-[:RIVALITE]->(real),
(real)-[:RIVALITE]->(psg);  // Relation bidirectionnelle

MATCH (real:Equipe {nom: 'Real Madrid'}), (alnassr:Equipe {nom: 'Al Nassr'})
CREATE (real)-[:RIVALITE]->(alnassr),
(alnassr)-[:RIVALITE]->(real);  // Relation bidirectionnelle

//Joueur - Équipe (ancien joueur)://

// Hakimi (Real Madrid)
MATCH (hakimi:Joueur {nom: 'Achraf Hakimi'}), (real:Equipe {nom: 'Real Madrid'})
CREATE (hakimi)-[:ANCIEN_JOUEUR]->(real);

// Cristiano (autres anciens clubs) - À compléter selon vos informations
MATCH (cristiano:Joueur {nom: 'Cristiano Ronaldo'}), (autre_equipe:Equipe {nom: 'Manchester United'})  // Remplacer 'autre_equipe' par le nom réel
CREATE (cristiano)-[:ANCIEN_JOUEUR]->(autre_equipe);


MATCH (coach2:Entraîneur {nom: 'Rudi Garcia'}), (alnassr:Equipe {nom: 'Al Nassr'})
CREATE (coach2)-[:ENTRAINE]->(alnassr);

MATCH (marquinhos:Joueur {nom: 'Marquinhos'}), (psg:Equipe {nom: 'Paris Saint-Germain'})
CREATE (marquinhos)-[:JOUE_POUR]->(psg);

MATCH (verratti:Joueur {nom: 'Marco Verratti'}), (psg:Equipe {nom: 'Paris Saint-Germain'})
CREATE (verratti)-[:JOUE_POUR]->(psg);

MATCH (ronaldo:Joueur {nom: 'Cristiano Ronaldo'}), (alnassr:Equipe {nom: 'Al Nassr'})
CREATE (ronaldo)-[:JOUE_POUR]->(alnassr);

MATCH (gervinho:Joueur {nom: 'Gervinho'}), (alnassr:Equipe {nom: 'Al Nassr'})
CREATE (gervinho)-[:JOUE_POUR]->(alnassr);

MATCH (aboubakar:Joueur {nom: 'Vincent Aboubakar'}), (alnassr:Equipe {nom: 'Al Nassr'})
CREATE (aboubakar)-[:JOUE_POUR]->(alnassr);

MATCH (benzema:Joueur {nom: 'Karim Benzema'}), (real:Equipe {nom: 'Real Madrid'})
CREATE (benzema)-[:JOUE_POUR]->(real);

MATCH (modric:Joueur {nom: 'Luka Modrić'}), (real:Equipe {nom: 'Real Madrid'})
CREATE (modric)-[:JOUE_POUR]->(real);

MATCH (cristiano:Joueur {nom: 'Cristiano Ronaldo'}), (manu:Equipe {nom: 'Manchester United'})  
CREATE (cristiano)-[:ANCIEN_JOUEUR]->(manu);


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
