DICTIONNAIRE DES DONNEES

FOURNISSEUR

Identifiant (Entier)
Nom (Chaine caract�re)
Ville (Chaine caract�re)
Pays (2 caract�re)
Adresse (Chaine caract�re)
Code Postal (Chaine caract�re)
Status (Chaine caract�re)
Repr�sentant (Chaine caract�re)
T�l�phone (Chaine caract�re)
Mail (Chaine caract�re)



CLIENT

Identifiant (Entier)
Nom (Chaine caract�re)
Pr�nom (Chaine caract�re)
Adresse (Chaine caract�re)
Code postal (Chaine caract�re)
Ville (Chaine caract�re)
Pays (Char 2)
T�l�phone (Chaine caract�re)
Mail (Chaine caract�re)
Cat�gorie (Chaine caract�re)
R�f�rence (Chaine caract�re)
Coefficient r�duction (D�cimal)
Date d'ajout (Datetime)
Date de modification (Datetime)
Mot de passe (Chaine caract�re)
Commercial r�f�rent


Employ�

Identifiant (Entier)
Nom (Chaine caract�re)
Pr�nom (Chaine caract�re)
Ville(Chaine caract�re)
CodePostal(Chaine caract�re)
Fonction(Chaine caract�re)
Salaire(Decimal)
Nombre d'enfant(Entier)
Date d'entr�e(Date)
T�l�phone(Chaine caract�re)
Mail(Chaine caract�re)
Superieur(Entier)
Sexe(Char)

PRODUITS

Identifiant (Entier)
Cat�gorie (Chaine caract�re)
Prix (D�cimal)
R�f�rence (Chaine caract�re)
Libelle (Chaine caract�re)
Description court (Chaine caract�re)
Description Long (Chaine caract�re)
Photo (Chaine caract�re)
Stock (Entier)

COMMANDE

Identifiant (Entier)
R�f�rence (Chaine caract�re)
R�duction (D�cimal)
date commande (Date)
date paiement (Date)
adresse livraison (Chaine caract�re)
adresse facturation (Chaine caract�re)
etat commande(char 1)


DETAILS COMMANDE

Identifiant (Entier)
Quantit�  (Entier)
taux TVA  (Entier)
Exp�die (DATE)
livr� (Date)

PAYS

Identifiant (char 2)
Nom (Chaine caract�re)

Cat�gorie Produit

Identifiant (Entier)
Nom (Cha�ne caract�re)
Cat�gorie Parent (Entier)

Livraison

Identifiant Livraison(Entier)
Adresse (Chaine caract�re)
Quantit� du produit livr� (Entier)
Date d'expedition(Date)
