/* Requete 1 : Les produits référencés sont achetés directement auprès des fournisseurs (constructeurs ou importateurs)*/

select `four_id` as 'Identifiant Fournisseur', `four_nom` as 'Nom fournisseur', `four_status` as 'Status fournisseur', `pro_ref` as 'Référence produit', `pro_prix` as 'Prix produit'
from `fournisseur`
join `produits` on `pro_four_id` = `four_id`;


/* Requete 2 : Dans le catalogue de l'entreprise tous les produits sont organisés en catégories, elles-mêmes divisées en sous-catégories*/

select  `pro_ref` as 'Référence produit', `cat`.`cat_nom` as `Nom catégorie` , `catparent`.`cat_nom` as 'Nom catégorie parent'
from `produits`
join `categorie` as `cat` on `cat`.`cat_id` = `pro_cat_id`
join `categorie` as `catparent` on `catparent`.`cat_id` = `cat`.`cat_parent_id`
order by `pro_ref`;

/* Requete 3 : Chaque produit doit être décrit par un libellé court et un libellé long (description), une référence fournisseur, un prix d'achat et une photo*/

select  `pro_ref` as 'Référence produit',`pro_libelle` as 'Libelle produit',`pro_desc_court` as 'Description courte',`pro_desc_long` as 'Description longue',`four_id` as 'Identifiant Fournisseur', `four_nom` as 'Nom fournisseur' , `pro_prix` as 'Prix produit', `pro_photo` as 'Photo produit'
from `fournisseur`
join `produits` on `pro_four_id` = `four_id`
order by `pro_ref`;

/* Requete 4 :Le prix de vente est calculé à partir du prix d'achat auquel on applique un coefficient en fonction de la catégorie du client (particulier ou professionnel) 
 Pour chaque catégorie de client particulier professionnel il existe 3 coef que le commercial peut mettre à jour*/

select `pro_ref` as 'Référence produit', round(`pro_prix`- ((`pro_prix`*1.12) / 100),2) as 'Prix produit particulier1',round(`pro_prix`- ((`pro_prix`*1.80) / 100),2) as 'Prix produit particulier2',round(`pro_prix`- ((`pro_prix`*2.04) / 100),2) as 'Prix produit particulier3',round(`pro_prix`- ((`pro_prix`*2.34) / 100),2) as 'Prix produit professionne1', round(`pro_prix`- ((`pro_prix`*3.00) / 100),2) as 'Prix produit professionnel2',round(`pro_prix`- ((`pro_prix`*3.20) / 100),2) as 'Prix produit professionnel3'
from `produits`
order by `pro_ref`;

/*Requete 5 : A chaque client est attribué un commercial. Un commercial spécifique id7 s'occupe des clients particuliers*/

select `cli_id` as 'Identifiant Client', `cli_nom` as 'Nom Client', `cli_prenom` as 'Prenom Client', `emp_id` as `Identifiant commercial référent`, `emp_nom` as 'Nom Commercial', `emp_prenom` as 'Prénom Commercial'
from `client`
join `employe` on `emp_id` = `cli_emp_id`
order by `cli_nom`,`cli_prenom` ;

/*Requete 6 : Quand un client passe une commande, il peut être appliqué une réduction supplémentaire sur le total, cette réduction est négociée par le service commercial*/

select `com_id` as 'Identifiant commande', `com_ref` as 'Référence commande', `cli_id` as 'Identifiant Client', `cli_nom` as 'Nom Client', `cli_prenom` as 'Prénom Cient', `com_reduc` as `Reduction commande`
from `client`
join `commande` on `com_cli_id` = `cli_id`;

/*Requete 7 : Au moment de la commande, il faut prendre en compte l'adresse de livraison et l'adresse de facturation. Un bon de livraison et une facture doivent pouvoir être éditées
 Lors de l'edition des bons de livraison, pour une commande livré en plusieurs fois il existera plusieurs bon de livraison avec adresse de livraison précisé dans le détail commande
 Une commande expédiée même partiellement fait l'objet d'une facturation de l'ensemble de la commande*/

select `com_id` as 'Identifiant commande', `com_ref` as 'Référence commande', `cli_id` as 'Identifiant Client', `cli_nom` as 'Nom Client', `cli_prenom`, round(sum(`detcom_qte` * (`pro_prix` - ((`pro_prix` * (`cli_coef` + `com_reduc`)) / 100) )),2) as 'Total commande prix HT',round((round(sum(`detcom_qte` * (`pro_prix` - ((`pro_prix` * (`cli_coef` + `com_reduc`)) / 100) )),2)) + (( (round(sum(`detcom_qte` * (`pro_prix` - ((`pro_prix` * (`cli_coef` + `com_reduc`)) / 100) )),2)) * `detcom_tva`) / 100),2) as 'Total commande prix TTC', `com_adress_factu` as 'Adresse de facturation', `com_adress_livraison` as 'Adresse facturation'
from `client`
join `commande` on `com_cli_id` = `cli_id`
join `details_com` on `detcom_com_id` = `com_id`
join `produits` on `pro_id` = `detcom_pro_id`
group By `com_id`;

/*Requete 8 : Pour les clients particuliers, un paiement à la commande est exigé.
              Pour les clients professionnels, le paiement se fait en différé */

select  `cli_id` as 'Identifiant Client', `cli_nom` as 'Nom Client', `cli_prenom` as 'Prénom client', `cli_cat` as 'Catégorie',  `com_id` as 'Identifiant commande', `com_ref` as 'Référence commande', `com_d_com` as 'Date commande', `com_d_paiement` as 'Date paiement'
from `client`
join `commande` on `com_cli_id` = `cli_id`
order by `cli_nom`,`cli_prenom` ;


/* Requete 9 : Chaque client se voit attribuer une référence qui servira à l'identifier lors des échanges avec les différents services de l'entreprise (après-vente, commercial, comptabilité)*/

select `cli_nom` as 'Nom Client', `cli_prenom` as 'Prénom client', `cli_ref` as 'Référence'
from `client`
order by `cli_nom`,`cli_prenom` ;


/*Requetes 10 et 11, de suppression : Les commandes et les documents associés sont conservés pendant trois ans.
 Chaque 31 décembre, la suppression des commandes et de leurs détails intervient
 Pour le respect de l'intégrité de la base, il sera supprimé le détails avant la commande
 Ces requetes sont testées sachant que mon magasin a ouvert en Avril 2019, aucune commande n'est affectées */

delete from `details_com` where `detcom_com_id` in (select `com_id` from `commande` where year(now()) > year(`com_d_com`) + 2);
delete from `commande` where year(now()) > year(`com_d_com`) + 2;

/*Requete 12 chiffre d'affaires hors taxes généré  par fournisseur*/


select `four_nom` as 'Nom fournisseur', round(sum(`detcom_qte` * (`pro_prix` - ((`pro_prix` * (`cli_coef` + `com_reduc`)) / 100) )),2) as 'Chiffre d affaire'
from `fournisseur`
join `produits` on `pro_four_id` = `four_id`
join `details_com` on `detcom_pro_id` = `pro_id`
join `commande` on `com_id` = `detcom_com_id`
join `client` on `cli_id` = `com_cli_id`
group by `four_id`;

/*Requete 13 chiffre d'affaires hors taxes généré pour l'ensemble des fournisseurs */ 

select  round(sum(`detcom_qte` * (`pro_prix` - ((`pro_prix` * (`cli_coef` + `com_reduc`)) / 100) )),2) as 'Chiffre d affaire total'
from `produits`
join `details_com` on `detcom_pro_id` = `pro_id`
join `commande` on `com_id` = `detcom_com_id`
join `client` on `cli_id` = `com_cli_id`;

/*Requete 14 : liste des produits commandés pour une année sélectionnée (référence et nom du produit, quantité commandée, fournisseur) */
/*Ici 2019*/

select `pro_ref` as 'Référence produit', `pro_libelle` as 'Nom Produit',  sum(`detcom_qte`) as 'quantité commandé',`four_nom` as 'Nom fournisseur'
from `fournisseur`
join `produits` on `pro_four_id` = `four_id`
join `details_com` on `detcom_pro_id` = `pro_id`
join `commande` on `com_id` = `detcom_com_id`
where year(`com_d_com`) = 2019
group by `four_id`, `pro_ref`;

/*Requete 15 :liste des commandes pour un client (date de commande, référence client, montant, état de la commande)*/
/*Ici le client id50 référencé par "gjdhthh"*/

select `com_d_com` as 'Date commande', `cli_ref` as 'Référence client', round((round(sum(`detcom_qte` * (`pro_prix` - ((`pro_prix` * (`cli_coef` + `com_reduc`)) / 100) )),2)) + (( (round(sum(`detcom_qte` * (`pro_prix` - ((`pro_prix` * (`cli_coef` + `com_reduc`)) / 100) )),2)) * `detcom_tva`) / 100),2) as 'Montant TTC', `com_etat` as 'Livré ou Non'
from `client`
join `commande` on `com_cli_id` = `cli_id`
join `details_com` on `com_id` = `detcom_com_id`
join `produits` on `detcom_pro_id` = `pro_id`
where `cli_ref` = "gjdhthh"
group by `com_id`;


/*Requete 16 :liste des commandes pour un client (date de commande, référence client, montant, état de la commande)*/
/*Ici pour tout les clients*/

select `com_d_com` as 'Date commande', `cli_ref` as 'Référence client', `cli_nom` as 'Nom client', round((round(sum(`detcom_qte` * (`pro_prix` - ((`pro_prix` * (`cli_coef` + `com_reduc`)) / 100) )),2)) + (( (round(sum(`detcom_qte` * (`pro_prix` - ((`pro_prix` * (`cli_coef` + `com_reduc`)) / 100) )),2)) * `detcom_tva`) / 100),2) as 'Montant TTC', `com_etat` as 'Livré ou Non'
from `client`
join `commande` on `com_cli_id` = `cli_id`
join `details_com` on `com_id` = `detcom_com_id`
join `produits` on `detcom_pro_id` = `pro_id`
group by `com_id`
order by `cli_nom`;

/* Requete 17 : répartition du chiffre d'affaires hors taxes par type de client*/

select `cli_cat` as 'Catégorie', round(sum(`detcom_qte` * (`pro_prix` - ((`pro_prix` * (`cli_coef` + `com_reduc`)) / 100) )),2)  as 'Chiffre d affaire HT'
from `client`
join `commande` on `com_cli_id` = `cli_id`
join `details_com` on `com_id` = `detcom_com_id`
join `produits` on `detcom_pro_id` = `pro_id`
group by `cli_cat`; 


/* Requete 18 : lister les commandes en cours de livraison */

select distinct(`com_id`) as 'Identifiant commande', `com_ref` as 'Référence commande en cours de livraison', `com_d_com` as 'Date commande'
from `commande`
join `details_com` on `com_id` = `detcom_com_id`
where `detcom_d_liv` is NULL and `detcom_d_exp` is not null
group by `com_id`
order by `com_ref`;

