DICTIONNAIRE DES DONNEES

FOURNISSEUR

Identifiant (Entier)
Nom (Chaine caractère)
Ville (Chaine caractère)
Pays (2 caractère)
Adresse (Chaine caractère)
Code Postal (Chaine caractère)
Status (Chaine caractère)
Représentant (Chaine caractère)
Téléphone (Chaine caractère)
Mail (Chaine caractère)



CLIENT

Identifiant (Entier)
Nom (Chaine caractère)
Prénom (Chaine caractère)
Adresse (Chaine caractère)
Code postal (Chaine caractère)
Ville (Chaine caractère)
Pays (Char 2)
Téléphone (Chaine caractère)
Mail (Chaine caractère)
Catégorie (Chaine caractère)
Référence (Chaine caractère)
Coefficient réduction (Décimal)
Date d'ajout (Datetime)
Date de modification (Datetime)
Mot de passe (Chaine caractère)
Commercial référent


Employé

Identifiant (Entier)
Nom (Chaine caractère)
Prénom (Chaine caractère)
Ville(Chaine caractère)
CodePostal(Chaine caractère)
Fonction(Chaine caractère)
Salaire(Decimal)
Nombre d'enfant(Entier)
Date d'entrée(Date)
Téléphone(Chaine caractère)
Mail(Chaine caractère)
Superieur(Entier)
Sexe(Char)

PRODUITS

Identifiant (Entier)
Catégorie (Chaine caractère)
Prix (Décimal)
Référence (Chaine caractère)
Libelle (Chaine caractère)
Description court (Chaine caractère)
Description Long (Chaine caractère)
Photo (Chaine caractère)
Stock (Entier)

COMMANDE

Identifiant (Entier)
Référence (Chaine caractère)
Réduction (Décimal)
date commande (Date)
date paiement (Date)
adresse livraison (Chaine caractère)
adresse facturation (Chaine caractère)
etat commande(char 1)


DETAILS COMMANDE

Identifiant (Entier)
Quantité  (Entier)
taux TVA  (Entier)
Expédie (DATE)
livré (Date)

PAYS

Identifiant (char 2)
Nom (Chaine caractère)

Catégorie Produit

Identifiant (Entier)
Nom (Chaîne caractère)
Catégorie Parent (Entier)

Livraison

Identifiant Livraison(Entier)
Adresse (Chaine caractère)
Quantité du produit livré (Entier)
Date d'expedition(Date)
