# Travaux Pratiques en Cypher avec Neo4j

## Introduction

Bienvenue dans ces travaux pratiques ! Vous allez utiliser le langage de requête Cypher pour interagir avec une base de données Neo4j. Assurez-vous d'avoir accès à une instance de Neo4j pour réaliser ces exercices.

## Exercice 1: Création de données

1. Créez cinq nœuds de type `Personne` avec les proprietes suivants :
   - nom : Ahmed   , age : 25 , ville : "Tinghir"
   - nom : Fatima  , age : 20 , ville : "Ouarzazate"
   - nom : Yasmina , age : 32 , ville : "Rabat"
   - nom : Omar    , age : 16 , ville : "Marrakech"
   - nom : Hicham  , age : 27 , ville : "Skoura"

2. Créez des relations `CONNAIT` entre les personnes. Par exemple, si Ahmed connaît Fatima et Yasmina, créez des relations `CONNAIT` correspondantes.

## Exercice 2: Requêtes de base

1. Sélectionnez tous les nœuds de type `Personne`.
2. Sélectionnez le nœud représentant "Ahmed" et affichez ses propriétés.
3. Sélectionnez toutes les relations `CONNAIT`.

## Exercice 3: Requêtes avancées

1. Sélectionnez toutes les personnes que Fatima connaît.
2. Sélectionnez toutes les personnes qui ne connaissent personne.
3. Sélectionnez toutes les personnes qui ont plus de deux amis.

## Exercice 4: Mises à jour de données

1. Modifiez l'âge de "Fatima" pour le mettre à 25.
2. Ajoutez une nouvelle propriété `ville` au nœud "Omar" et définissez sa valeur sur "Casablanca".

## Exercice 5: Suppression de données

1. Supprimez la relation `CONNAIT` entre "Ahmed" et "Fatima".
2. Supprimez le nœud représentant "Hicham".
