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

/*Requete 7 : Au moment de la commande, il faut prendre en compte l'adresse de livraison et l'adresse de facturation. Un bon de livraison et une facture doivent pouvoir être éditées*/


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



/*Requete 10 chiffre d'affaires hors taxes généré  par fournisseur*/


select `four_nom` as 'Nom fournisseur', round(sum(`detcom_qte` * (`pro_prix` - ((`pro_prix` * (`cli_coef` + `com_reduc`)) / 100) )),2) as 'Chiffre d affaire'
from `fournisseur`
join `produits` on `pro_four_id` = `four_id`
join `details_com` on `detcom_pro_id` = `pro_id`
join `commande` on `com_id` = `detcom_com_id`
join `client` on `cli_id` = `com_cli_id`
group by `four_id`;

/*Requete 11 chiffre d'affaires hors taxes généré pour l'ensemble des fournisseurs */ 

select  round(sum(`detcom_qte` * (`pro_prix` - ((`pro_prix` * (`cli_coef` + `com_reduc`)) / 100) )),2) as 'Chiffre d affaire total pour tout les fournisseurs'
from `produits`
join `details_com` on `detcom_pro_id` = `pro_id`
join `commande` on `com_id` = `detcom_com_id`
join `client` on `cli_id` = `com_cli_id`;

/*Requete 12 : liste des produits commandés pour une année sélectionnée (référence et nom du produit, quantité commandée, fournisseur) */
/*Cette requete prend une année en entrée année d'où l'utilisation d'une procédure*/ 

DROP PROCEDURE IF EXISTS `listeproannee`;

DELIMITER |

CREATE PROCEDURE `listeproannee` (IN annee int(10)) 

BEGIN

select `pro_ref` as 'Référence produit', `pro_libelle` as 'Nom Produit',  sum(`detcom_qte`) as 'quantité commandé',`four_nom` as 'Nom fournisseur'
from `fournisseur`
join `produits` on `pro_four_id` = `four_id`
join `details_com` on `detcom_pro_id` = `pro_id`
join `commande` on `com_id` = `detcom_com_id`
where year(`com_d_com`) = annee
group by `four_id`, `pro_ref`;

END |
DELIMITER ;

/*Test et exportation pour année 2019*/

Call listeproannee(2019);

/*Requete 13 :liste des commandes pour un client (date de commande, référence client, montant, état de la commande)*/
/*Cette requete prend une reférence client en entrée d'où l'utilisation d'une procédure*/ 

DROP PROCEDURE IF EXISTS `listecomclient`;

DELIMITER |

CREATE PROCEDURE `listecomclient` (IN refclient Varchar(20)) 

BEGIN

select `com_d_com` as 'Date commande', `cli_ref` as 'Référence client', round((round(sum(`detcom_qte` * (`pro_prix` - ((`pro_prix` * (`cli_coef` + `com_reduc`)) / 100) )),2)) + (( (round(sum(`detcom_qte` * (`pro_prix` - ((`pro_prix` * (`cli_coef` + `com_reduc`)) / 100) )),2)) * `detcom_tva`) / 100),2) as 'Montant TTC', `com_etat` as 'Livré ou Non'
from `client`
join `commande` on `com_cli_id` = `cli_id`
join `details_com` on `com_id` = `detcom_com_id`
join `produits` on `detcom_pro_id` = `pro_id`
where `cli_ref` = refclient 
group by `com_id`;

END |
DELIMITER ;

/*Test et exportation client de référence gjdhthh*/

Call listecomclient("gjdhthh");

/*Requete 14 :liste des commandes pour tout les clients (date de commande, référence client, montant, état de la commande)*/


select `com_d_com` as 'Date commande', `cli_ref` as 'Référence client', `cli_nom` as 'Nom client', round((round(sum(`detcom_qte` * (`pro_prix` - ((`pro_prix` * (`cli_coef` + `com_reduc`)) / 100) )),2)) + (( (round(sum(`detcom_qte` * (`pro_prix` - ((`pro_prix` * (`cli_coef` + `com_reduc`)) / 100) )),2)) * `detcom_tva`) / 100),2) as 'Montant TTC', `com_etat` as 'Livré ou Non'
from `client`
join `commande` on `com_cli_id` = `cli_id`
join `details_com` on `com_id` = `detcom_com_id`
join `produits` on `detcom_pro_id` = `pro_id`
group by `com_id`
order by `cli_nom`;

/* Requete 15 : répartition du chiffre d'affaires hors taxes par type de client*/

select `cli_cat` as 'Catégorie', round(sum(`detcom_qte` * (`pro_prix` - ((`pro_prix` * (`cli_coef` + `com_reduc`)) / 100) )),2)  as 'Chiffre d affaire HT'
from `client`
join `commande` on `com_cli_id` = `cli_id`
join `details_com` on `com_id` = `detcom_com_id`
join `produits` on `detcom_pro_id` = `pro_id`
group by `cli_cat`; 


/* Requete 16 : lister les commandes en cours de livraison */
/*Dans cette requete on a les livraison avec une date livraison null et aussi lorsque qu'une premiere livraison a été effectué mais qu'il manque des produits*/
select distinct(`com_id`) as 'Identifiant commande', `com_ref` as 'Référence commande en cours de livraison', `com_d_com` as 'Date commande'
from `commande`
join `details_com` on `com_id` = `detcom_com_id`
join `livraison` on `detcom_id` = `liv_detcom_id`
where (`liv_d_liv` is NULL and `liv_d_exp` is not null) or 
    (`com_id` in (select `com_id` 
    from `commande`
    join `details_com` on `com_id` = `detcom_com_id`
    join `livraison` on `detcom_id` = `liv_detcom_id`
    group by `detcom_id`,`detcom_qte`
    having `detcom_qte` <>  sum(`liv_qte`)))
group by `com_id`
order by `com_ref`;




/* Requete 17 :  Lors de l'edition des bons de livraison, pour une commande livré en plusieurs fois il existera plusieurs bon de livraison avec adresse de livraison*/
DROP PROCEDURE IF EXISTS `livcomgreen`;

DELIMITER |

CREATE PROCEDURE `livcomgreen` (IN p_numcom int(10)) 

BEGIN

if p_numcom in (select `com_id` from `commande`) then 

select `cli_ref` as 'Réference client', `cli_nom` as 'Nom client',`cli_prenom` as `Prénom client`, `com_ref` as 'Référence commande', `com_d_com` as 'Date commande',
        `pro_ref` as 'Référence produit', `pro_libelle` as 'Libelle produit', `pro_prix` as 'Prix produit', `detcom_qte` as 'Quantité commandé', `liv_qte` as 'Quantité livré',
        `liv_adresse` as 'adresse livraison', `liv_d_exp` as 'Date expédition', `liv_d_liv` as 'Date livraison',
        round(`liv_qte` * (`pro_prix` - ( (`pro_prix` * (`cli_coef` + `com_reduc` ) )/ 100) ),2) as 'Prix livraison HT',
        
        round(( round(`liv_qte` * (`pro_prix` - ( (`pro_prix` * (`cli_coef` + `com_reduc` )) / 100) ),2)) +              
        (((round(`liv_qte` * (`pro_prix` - ( (`pro_prix` * (`cli_coef` + `com_reduc` )) / 100) ),2)) * `detcom_tva`) / 100),2) as 'Prix Livraison TTC'

from `client`
join `commande` on `com_cli_id` = `cli_id`
join `details_com` on `com_id` = `detcom_com_id`
join `produits` on `detcom_pro_id` = `pro_id`
join `livraison` on `liv_detcom_id` = `detcom_id`
where `com_id` = p_numcom;

else (select "Commande inexistante ou non détaillé");

end if;

END |

DELIMITER ;

/*Test et exportation pour commande 12*/

Call livcomgreen(12);
 
/* Requete 18 : Une commande expédiée même partiellement fait l'objet d'une facturation de l'ensemble de la commande*/


DROP PROCEDURE IF EXISTS `facturegreen`;

DELIMITER |

CREATE PROCEDURE `facturegreen` (IN p_numcom int(10)) 

BEGIN

if p_numcom in (select `com_id` from `commande`) then 

select `com_d_com` as 'Date commande', `com_d_paiement` as 'Date paiement', `pro_prix` as 'Prix unitaire produit',`cli_coef` as 'Remise Client', `com_reduc` as 'Remise Commande', `detcom_qte` as 'Qauntité commandé', `pro_ref` as 'Réference produit', `pro_libelle` as 'Libelle produit',
     round(`detcom_qte` * (`pro_prix` - ( (`pro_prix` * (`cli_coef` + `com_reduc` ) )/ 100) ),2) as 'Prix HT', 
    `detcom_tva` as 'TVA',

      round(( round(`detcom_qte` * (`pro_prix` - ( (`pro_prix` * (`cli_coef` + `com_reduc` )) / 100) ),2)) +              
        (((round(`detcom_qte` * (`pro_prix` - ( (`pro_prix` * (`cli_coef` + `com_reduc` )) / 100) ),2)) * `detcom_tva`) / 100),2) as 'Prix TTC',
     
     (select round(((round(sum(`detcom_qte` * (`pro_prix` - ( (`pro_prix` * (`cli_coef` + `com_reduc` )) / 100) ) ),2)) + 
                (((round(sum(`detcom_qte` * (`pro_prix` - ( (`pro_prix` * (`cli_coef` + `com_reduc` )) / 100) ) ),2)) * `detcom_tva`) / 100)),2) as 'Montant TTC facture'
        
        from `client`
                join `commande` on `com_cli_id` = `cli_id`
                join `details_com` on `detcom_com_id`=`com_id`
                join `produits` on `detcom_pro_id` = `pro_id`
                where `com_id` = p_numcom) as 'Montant TTC facture' 
from `client`
join `commande` on `com_cli_id` = `cli_id`
join `details_com` on `detcom_com_id`=`com_id`
join `produits` on `detcom_pro_id` = `pro_id`
where `com_id` = p_numcom;

else (select "Commande inexistante ou non détaillé");

end if;

END |

DELIMITER ;


/*Test et exportation pour commande 12*/

Call facturegreen(12);


/* Les commandes et les documents associés sont conservés pendant trois ans.
 Chaque 31 décembre, la suppression des commandes et de leurs détails intervient
 Pour le respect de l'intégrité de la base, il sera supprimé les livraisons puis le détails avant la commande
 Ces requetes sont testées sachant que mon magasin a ouvert en Avril 2019, aucune commande n'est affectées */

delete from `livraison` where `liv_detcom_id` in (select `detcom_id` from `details_com` where `detcom_com_id` in (select `com_id` from `commande` where year(now()) > year(`com_d_com`) + 2)); 
delete from `details_com` where `detcom_com_id` in (select `com_id` from `commande` where year(now()) > year(`com_d_com`) + 2);
delete from `commande` where year(now()) > year(`com_d_com`) + 2;