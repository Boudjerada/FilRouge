/*  Vue correspondant à la jointure Produits - Fournisseurs */
/* Pour la clareté de la vue, seul les informations essentiel sont affichées*/
/*un right join est utilisé, pour faire connaitre les fournisseurs du magasin ne fournissant pas encore de produit*/

DROP VIEW IF EXISTS `v_Prod_Four` ;

CREATE VIEW `v_Prod_Four`
AS
SELECT `pro_ref`as 'Référence Produit', `pro_libelle` as 'Libelle produit', `pro_prix` as 'Prix produit',`pro_stock` as 'Stock produit',
        `four_nom` as 'Nom du fournisseur', `four_ville` as 'Ville du fournisseur', `four_status` as 'Status du fournisseur' , `four_representant` as 'Représentant du fournisseur' 
FROM `produits` right join `fournisseur` on `pro_four_id` = `four_id`
order by `four_nom`;


/*Affichage des vues de la base village_green */
/*
SELECT * 
FROM information_schema.views
WHERE table_schema = 'village_green'; 
*/

