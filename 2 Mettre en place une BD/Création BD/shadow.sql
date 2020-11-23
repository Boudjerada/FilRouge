/*Les comptes formateurs se trouvent dans la dernière partie Administrateur*/

/*VISITEUR*/

/*Création du rôle Visiteur*/
drop role if exists 'visiteur'@'%';
CREATE ROLE 'visiteur'@'%';

/*Attibution du privilége de lecture sur le catalogue au rôle visiteur */

GRANT select
ON village_green.produits 
TO 'visiteur'@'%';


/*Création de 5 visiteurs*/

drop user if exists 'vis1'@'%';
drop user if exists 'vis2'@'%';
drop user if exists 'vis3'@'%';
drop user if exists 'vis4'@'%';
drop user if exists 'vis5'@'%';
CREATE USER if not exists 'vis1'@'%' IDENTIFIED BY 'vis1';
CREATE USER if not exists 'vis2'@'%' IDENTIFIED BY 'vis2';
CREATE USER if not exists 'vis3'@'%' IDENTIFIED BY 'vis3';
CREATE USER if not exists 'vis4'@'%' IDENTIFIED BY 'vis4';
CREATE USER if not exists 'vis5'@'%' IDENTIFIED BY 'vis5';


/*Affectation du rôle visiteur aux 5  visiteurs*/

GRANT 'visiteur'@'%'
TO 'vis1'@'%', 'vis2'@'%','vis3'@'%','vis4'@'%','vis5'@'%';  

/*Assignation du rôle visiteur pour test, via la commande SET DEFAULT ROLE */

SET DEFAULT ROLE 'visiteur'@'%' TO 'vis1'@'%';
SET DEFAULT ROLE 'visiteur'@'%' TO 'vis2'@'%';
SET DEFAULT ROLE 'visiteur'@'%' TO 'vis3'@'%';
SET DEFAULT ROLE 'visiteur'@'%' TO 'vis4'@'%';
SET DEFAULT ROLE 'visiteur'@'%' TO 'vis5'@'%';



/*CLIENT*/

/*Création du rôle client*/
drop role if exists 'client'@'%';
CREATE ROLE 'client'@'%';

/*Attibution du privilége de lecture sur la base au rôle client */

GRANT select
ON village_green.*
TO 'client'@'%';

/*Attibution du privilége d'insertion et modification sur les tables client et commande au rôle client */

GRANT insert, update
ON village_green.commande
TO 'client'@'%';

GRANT insert, update
ON village_green.client
TO 'client'@'%';


/*Création de 5 client*/

drop user if exists 'cli1'@'%';
drop user if exists 'cli2'@'%';
drop user if exists 'cli3'@'%';
drop user if exists 'cli4'@'%';
drop user if exists 'cli5'@'%';
CREATE USER if not exists 'cli1'@'%' IDENTIFIED BY 'cli1';
CREATE USER if not exists 'cli2'@'%' IDENTIFIED BY 'cli2';
CREATE USER if not exists 'cli3'@'%' IDENTIFIED BY 'cli3';
CREATE USER if not exists 'cli4'@'%' IDENTIFIED BY 'cli4';
CREATE USER if not exists 'cli5'@'%' IDENTIFIED BY 'cli5';


/*Affectation du rôle client aux 5 clients*/

GRANT 'client'@'%'
TO 'cli1'@'%', 'cli2'@'%','cli3'@'%','cli4'@'%','cli5'@'%';  

/*Assignation du rôle client pour test, via la commande SET DEFAULT ROLE */

SET DEFAULT ROLE 'client'@'%' TO 'cli1'@'%';
SET DEFAULT ROLE 'client'@'%' TO 'cli2'@'%';
SET DEFAULT ROLE 'client'@'%' TO 'cli3'@'%';
SET DEFAULT ROLE 'client'@'%' TO 'cli4'@'%';
SET DEFAULT ROLE 'client'@'%' TO 'cli5'@'%';


/*GESTION*/

/*Création du rôle gestion*/
drop role if exists 'gestion'@'%';
CREATE ROLE 'gestion'@'%';

/*Attibution du privilége de lecture, ecriture sur la base au rôle gestion */

GRANT select, insert, update
ON village_green.*
TO 'gestion'@'%';


/*Création de 5 gestionnaires*/

drop user if exists 'gest1'@'%';
drop user if exists 'gest2'@'%';
drop user if exists 'gest3'@'%';
drop user if exists 'gest4'@'%';
drop user if exists 'gest5'@'%';
CREATE USER if not exists 'gest1'@'%' IDENTIFIED BY 'gest1';
CREATE USER if not exists 'gest2'@'%' IDENTIFIED BY 'gest2';
CREATE USER if not exists 'gest3'@'%' IDENTIFIED BY 'gest3';
CREATE USER if not exists 'gest4'@'%' IDENTIFIED BY 'gest4';
CREATE USER if not exists 'gest5'@'%' IDENTIFIED BY 'gest5';


/*Affectation du rôle gestion aux 5 gestionnaires*/

GRANT 'gestion'@'%'
TO 'gest1'@'%', 'gest2'@'%','gest3'@'%','gest4'@'%','gest5'@'%';  

/*Assignation du rôle gestion pour test, via la commande SET DEFAULT ROLE */

SET DEFAULT ROLE 'gestion'@'%' TO 'gest1'@'%';
SET DEFAULT ROLE 'gestion'@'%' TO 'gest2'@'%';
SET DEFAULT ROLE 'gestion'@'%' TO 'gest3'@'%';
SET DEFAULT ROLE 'gestion'@'%' TO 'gest4'@'%';
SET DEFAULT ROLE 'gestion'@'%' TO 'gest5'@'%';


/*ADMINISTRATION*/

/*Création du rôle administration*/
drop role if exists 'administrateur'@'%';
CREATE ROLE 'administrateur'@'%';

/*Attibution du privilége de lecture, ecriture, suppression et création suppression de table sur la base au rôle administrateur */

GRANT ALL
ON village_green.*
TO 'administrateur'@'%';




/*Création de 5 administrateur */

drop user if exists 'Fode'@'%';
drop user if exists 'Herve'@'%';
drop user if exists 'admi3'@'%';
drop user if exists 'admi4'@'%';
drop user if exists 'admi5'@'%';
CREATE USER if not exists 'Fode'@'%' IDENTIFIED BY 'Fode';
CREATE USER if not exists 'Herve'@'%' IDENTIFIED BY 'Herve';
CREATE USER if not exists 'admi3'@'%' IDENTIFIED BY 'admi3';
CREATE USER if not exists 'admi4'@'%' IDENTIFIED BY 'admi4';
CREATE USER if not exists 'admi5'@'%' IDENTIFIED BY 'admi5';


/*Affectation du rôle gestion aux 5 administrateurs*/

GRANT 'administrateur'@'%'
TO 'Fode'@'%', 'Herve'@'%','admi3'@'%','admi4'@'%','admi5'@'%';  

/*Assignation du rôle administration pour test, via la commande SET DEFAULT ROLE */

SET DEFAULT ROLE 'administrateur'@'%' TO 'Fode'@'%';
SET DEFAULT ROLE 'administrateur'@'%' TO 'Herve'@'%';
SET DEFAULT ROLE 'administrateur'@'%' TO 'admi3'@'%';
SET DEFAULT ROLE 'administrateur'@'%' TO 'admi4'@'%';
SET DEFAULT ROLE 'administrateur'@'%' TO 'admi5'@'%';
