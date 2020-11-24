
Sauvegarde et restauration sous MySql

23 novembre :
Une première sauvegarde avec restauration testé le 23 novembre 2020 avec la cmd dans un dossier backup avec les commandes suivantes :

Sauvegarde

C:\wamp\bin\mysql\mysql8.0.21\bin>mysqldump --user=root --password= --databases village_green > C:\Backup\backup_village_green_23nov.sql
Restauration
C:\wamp\bin\mysql\mysql8.0.21\bin>mysql  --user=root --password= village_green23nov < C:\Backup\backup_village_green_23nov.sql

La restauration se fait dans une base village_green_20nov crée auparavant dans phpadmin. Il a été supprimé la ligne de code create database village_green dans le fichier backup issue de la sauvegarde.

