// Football Database

//1. Création des noeuds://

//Équipes://

CREATE (:Equipe {nom: 'Paris Saint-Germain'});
CREATE (:Equipe {nom: 'Al Nassr'});
CREATE (:Equipe {nom: 'Real Madrid'});

//Entraineurs://

CREATE (:Entraineur {nom: 'Enrique', prenom: 'Luis', nationalité: 'Espagnol', salaire_annuel: 12000000});
CREATE (:Entraineur {nom: 'Garcia', prenom: 'Rudi', nationalité: 'Français', salaire_annuel: 8000000});
CREATE (:Entraineur {nom: 'Ancelotti', prenom: 'Carlo', nationalité: 'Italien', salaire_annuel: 12500000});

//Joueurs (3 par équipe)://

//PSG://

CREATE (:Joueur {nom: 'Hakimi', prenom: 'Achraf', nationalité: 'Marocain', age: 24, salaire_annuel: 12000000});
CREATE (:Joueur {nom: 'Marquinhos', prenom: 'Marcos', nationalité: 'Brésilien', age: 28, salaire_annuel: 11000000});
CREATE (:Joueur {nom: 'Verratti', prenom: 'Marco', nationalité: 'Italien', age: 30, salaire_annuel: 10000000});

//Al Nassr://

CREATE (:Joueur {nom: 'Ronaldo', prenom: 'Cristiano', nationalité: 'Portugais', age: 37, salaire_annuel: 20000000});
CREATE (:Joueur {nom: 'Gervinho', prenom: 'Gervinho', nationalité: 'Ivoirien', age: 35, salaire_annuel: 4000000});
CREATE (:Joueur {nom: 'Aboubakar', prenom: 'Vincent', nationalité: 'Camerounais', age: 31, salaire_annuel: 6000000});

//Real Madrid://

CREATE (:Joueur {nom: 'Benzema', prenom: 'Karim', nationalité: 'Français', age: 35, salaire_annuel: 23000000});
CREATE (:Joueur {nom: 'Modrić', prenom: 'Luka', nationalité: 'Croate', age: 37, salaire_annuel: 10500000});
CREATE (:Joueur {nom: 'Kroos', prenom: 'Toni', nationalité: 'Allemand', age: 33, salaire_annuel: 15000000});

//2. Création des relations ://

//Entraineur - Équipe://

MATCH (coach1:Entraineur {nom: 'Enrique'}), (psg:Equipe {nom: 'Paris Saint-Germain'})
CREATE (coach1)-[:ENTRAINE]->(psg);

MATCH (coach2:Entraineur {nom: 'Garcia'}), (alnassr:Equipe {nom: 'Al Nassr'})
CREATE (coach2)-[:ENTRAINE]->(alnassr);

MATCH (coach3:Entraineur {nom: 'Ancelotti'}), (real:Equipe {nom: 'Real Madrid'})
CREATE (coach3)-[:ENTRAINE]->(real);

//Joueur - Équipe://

// PSG
MATCH (hakimi:Joueur {nom: 'Hakimi'}), (psg:Equipe {nom: 'Paris Saint-Germain'})
CREATE (hakimi)-[:JOUE_POUR]->(psg);

MATCH (marquinhos:Joueur {nom: 'Marquinhos'}), (psg:Equipe {nom: 'Paris Saint-Germain'})
CREATE (marquinhos)-[:JOUE_POUR]->(psg);

MATCH (verratti:Joueur {nom: 'Verratti'}), (psg:Equipe {nom: 'Paris Saint-Germain'})
CREATE (verratti)-[:JOUE_POUR]->(psg);

// Al Nassr
MATCH (ronaldo:Joueur {nom: 'Ronaldo'}), (alnassr:Equipe {nom: 'Al Nassr'})
CREATE (ronaldo)-[:JOUE_POUR]->(alnassr);

MATCH (gervinho:Joueur {nom: 'Gervinho'}), (alnassr:Equipe {nom: 'Al Nassr'})
CREATE (gervinho)-[:JOUE_POUR]->(alnassr);

MATCH (aboubakar:Joueur {nom: 'Aboubakar'}), (alnassr:Equipe {nom: 'Al Nassr'})
CREATE (aboubakar)-[:JOUE_POUR]->(alnassr);

// Real Madrid
MATCH (benzema:Joueur {nom: 'Benzema'}), (real:Equipe {nom: 'Real Madrid'})
CREATE (benzema)-[:JOUE_POUR]->(real);

MATCH (modric:Joueur {nom: 'Modrić'}), (real:Equipe {nom: 'Real Madrid'})
CREATE (modric)-[:JOUE_POUR]->(real);

//Joueur - Joueur (amitié) (adapté pour 3 joueurs par équipe)://

// Amitiés entre joueurs du PSG
MATCH (hakimi:Joueur {nom: 'Hakimi'}), (marquinhos:Joueur {nom: 'Marquinhos'})
CREATE (hakimi)-[:AMITIE]->(marquinhos),
(marquinhos)-[:AMITIE]->(hakimi); // Relation bidirectionnelle

// Amitiés entre joueurs d'Al Nassr
MATCH (ronaldo:Joueur {nom: 'Ronaldo'}), (gervinho:Joueur {nom: 'Gervinho'})
CREATE (ronaldo)-[:AMITIE]->(gervinho),
(gervinho)-[:AMITIE]->(ronaldo); // Relation bidirectionnelle

// Amitiés entre joueurs du Real Madrid (adapter en fonction des joueurs)
MATCH (benzema:Joueur {nom: 'Benzema'}), (modric:Joueur {nom: 'Modrić'})
CREATE (benzema)-[:AMITIE]->(modric),
(modric)-[:AMITIE]->(benzema);  // Relation bidirectionnelle

//Équipe - Équipe (rivalité)://

MATCH (psg:Equipe {nom: 'Paris Saint-Germain'}), (real:Equipe {nom: 'Real Madrid'})
CREATE (psg)-[:RIVALITE]->(real),
(real)-[:RIVALITE]->(psg);

MATCH (real:Equipe {nom: 'Real Madrid'}), (alnassr:Equipe {nom: 'Al Nassr'})
CREATE (real)-[:RIVALITE]->(alnassr),
(alnassr)-[:RIVALITE]->(real);  // Relation bidirectionnelle

//Joueur - Équipe (ancien joueur)://

// Hakimi (Real Madrid)
MATCH (hakimi:Joueur {nom: 'Hakimi'}), (real:Equipe {nom: 'Real Madrid'})
CREATE (hakimi)-[:ANCIEN_JOUEUR]->(real);

// Cristiano (autres anciens clubs) - À compléter selon vos informations
MATCH (ronaldo:Joueur {nom: 'Ronaldo'}), (manu:Equipe {nom: 'Manchester United'})  
CREATE (ronaldo)-[:ANCIEN_JOUEUR]->(manu);


// --------------------------------------------------------------------
// -- Query
// --------------------------------------------------------------------

//voire tout la base de donnes 
Match (n) return n

// Voire tous les joueurs 
MATCH (j :Joueur ) return j

// Voire tous les entraineurs 
MATCH (en :Entraineur ) return en

// Voire tous les entraineurs 
MATCH (eq :Equipe ) return eq


// selectionner tous les joueurs et equippes
MATCH (j :Joueur ) , (eq :Equipe ) return j , eq

//selectionner un joueur appelle "Ronaldo"
MATCH (j:Joueur {nom:"Ronaldo"}) return j

//selectionner un joueur appelle "Ronaldo" avec Where
MATCH (j:Joueur ) 
WHERE j.nom = "RONALDO"
RETURN J

//selectionner un joueur appelle "Ronaldo Cristiano"
MATCH (j:Joueur ) 
WHERE j.nom = "Ronaldo" and j.prenom = "Cristiano"
RETURN j











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
