
Sauvegarde et restauration sous MySql

23 novembre :
Une premi�re sauvegarde avec restauration test� le 23 novembre 2020 avec la cmd dans un dossier backup avec les commandes suivantes :

Sauvegarde

C:\wamp\bin\mysql\mysql8.0.21\bin>mysqldump --user=root --password= --databases village_green > C:\Backup\backup_village_green.sql

Restauration

C:\wamp\bin\mysql\mysql8.0.21\bin>mysql  --user=root --password= village_green_rest < C:\Backup\backup_village_green.sql

La restauration se fait dans une base village_green_rest cr�e auparavant dans phpadmin. Il a �t� supprim� la ligne de code create database village_green dans le fichier backup issue de la sauvegarde.

