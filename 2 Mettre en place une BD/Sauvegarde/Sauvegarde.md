Sauvegarde et restauration sous MySql


Sauvegarde

C:\wamp\bin\mysql\mysql8.0.21\bin>mysqldump --user=root --password= --databases village_green > C:\Backup\backup_village_green(date).sql

Restauration

C:\wamp\bin\mysql\mysql8.0.21\bin>mysql  --user=root --password= village_green_(date) < C:\Backup\backup_village_green(date).sql

La restauration se fait dans une base village_green_(date) crée auparavant dans phpadmin. Il a été supprimé la ligne de code create database village_green dans le fichier backup issue de la sauvegarde.


Une sauvegarde sera réalisé 1 fois par semaine environ

23 novembre :
Une première sauvegarde avec restauration test le 23 novembre 2020. Cette sauvegarde sur un mcd imcomplet et donc un chargement inaproprié n'a pas été conservé.

2 décembre : 2éme sauvegarde 

5 décembre : 3 éme sauvegarde MCD modifié avec une table livraison, chargement refait.



 
