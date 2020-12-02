/*  vue correspondant à la jointure Produits - Fournisseurs */

DROP VIEW IF EXISTS `v_Prod_Four` ;

CREATE VIEW `v_Prod_Four`
AS
SELECT * FROM `produits` join `fournisseur` on `four_id`=`pro_four_id`;


/*Affichage des vues de la base village_green */
/*
SELECT * 
FROM information_schema.views
WHERE table_schema = 'village_green'; 
*/

