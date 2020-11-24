-- phpMyAdmin SQL Dump
-- version  5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3308
-- Généré le :  sam. 21 novembre 2020 à 12h11
-- Version du serveur :  8.0.21
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `Village_Green`
--
drop database if exists Village_Green;

create database Village_Green;

use Village_Green;

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

DROP TABLE IF EXISTS `pays`;
CREATE TABLE IF NOT EXISTS `pays` (
  `pays_id` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pays_nom` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`pays_id`)
);

-- --------------------------------------------------------

--
-- Structure de la table `poste`
--

DROP TABLE IF EXISTS `poste`;
CREATE TABLE `poste`(
   `pos_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
   `pos_libelle` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
   PRIMARY KEY(`pos_id`)
)AUTO_INCREMENT=36;

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `cat_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cat_nom` varchar(50) NOT NULL,
  `cat_parent_id` int(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`cat_id`),
  FOREIGN KEY (`cat_parent_id`) REFERENCES `categorie` (`cat_id`)
)AUTO_INCREMENT= 41;

-- --------------------------------------------------------

--
-- Structure de la table `employe`
--


DROP TABLE IF EXISTS `employe`;
CREATE TABLE IF NOT EXISTS `employe`(
   `emp_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
   `emp_sup_id` Int(10) UNSIGNED DEFAULT NULL,
   `emp_pos_id` INT(10) NOT NULL,
   `emp_nom` VARCHAR(50) NOT NULL,
   `emp_prenom` VARCHAR(50) NOT NULL,
   `emp_addresse` VARCHAR(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
   `emp_codepostal` VARCHAR(5) NOT NULL,
   `emp_ville` VARCHAR(50) NOT NULL,
   `emp_mail` VARCHAR(255) NOT NULL,
   `emp_tel` VARCHAR(10) NOT NULL,
   `emp_salaire` DECIMAL(8,2),
   `emp_d_entree` DATE NOT NULL,
   `emp_sexe` CHAR(1) NOT NULL,
   `emp_nbenf` tinyint(2) NOT NULL,
   PRIMARY KEY(`emp_id`),
   FOREIGN KEY(`emp_sup_id`) REFERENCES `employe`(`emp_id`),
   FOREIGN KEY(`emp_pos_id`) REFERENCES `poste`(`pos_id`)
)AUTO_INCREMENT=108;


-- --------------------------------------------------------

--
-- Structure de la table `fournisseur`
--


DROP TABLE IF EXISTS `fournisseur`;
CREATE TABLE IF NOT EXISTS `fournisseur`(
   `four_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
   `four_nom` VARCHAR(50) NOT NULL,
   `four_ville` VARCHAR(50) NOT NULL,
   `four_pays_id` CHAR(2) NOT NULL,
   `four_adresse` VARCHAR(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
   `four_codepostal` VARCHAR(5) NOT NULL,
   `four_representant` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
   `four_tel` VARCHAR(10) NOT NULL,
   `four_mail` VARCHAR(75) NOT NULL,
   `four_status` VARCHAR(15) NOT NULL,
   PRIMARY KEY(`four_id`),
   FOREIGN KEY(`four_pays_id`) REFERENCES `pays`(`pays_id`)
)AUTO_INCREMENT=6;

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--


DROP TABLE IF EXISTS `produits`;
CREATE TABLE IF NOT EXISTS `produits`(
   `pro_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
   `pro_cat_id` INT(10) NOT NULL,
   `pro_prix` DECIMAL(7,2) NOT NULL,
   `pro_ref` VARCHAR(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
   `pro_stock` Int(10) UNSIGNED NOT NULL,
   `pro_libelle` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
   `pro_desc_court` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
   `pro_desc_long` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
   `pro_d_ajout` datetime Not null,
   `pro_d_modif` datetime DEFAULT NULL,
   `pro_four_id` INT(10) NOT NULL,
   `pro_emp_id` INT(10) NOT NULL,
   `pro_photo` VARCHAR(50),
   PRIMARY KEY(`pro_id`),
   UNIQUE KEY `idx_pro_ref` (`pro_ref`),
   FOREIGN KEY(`pro_cat_id`) REFERENCES `categorie`(`cat_id`),
   FOREIGN KEY(`pro_four_id`) REFERENCES `fournisseur`(`four_id`),
   FOREIGN KEY(`pro_emp_id`) REFERENCES `employe`(`emp_id`)
)AUTO_INCREMENT=31;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--


DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client`(
    `cli_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `cli_nom` VARCHAR(50) NOT NULL,
    `cli_prenom` VARCHAR(30) DEFAULT NULL,
    `cli_adresse` VARCHAR(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `cli_codepostal` VARCHAR(5) NOT NULL,
    `cli_ville` VARCHAR(50) NOT NULL,
    `cli_pays_id` CHAR(2) NOT NULL,
    `cli_mail` VARCHAR(255) NOT NULL,
    `cli_tel` VARCHAR(10) NOT NULL,
    `cli_motdepasse` VARCHAR(60) NOT NULL,
    `cli_d_ajout` DATETIME NOT NULL,
    `cli_d_modif` DATETIME DEFAULT NULL,
    `cli_ref` VARCHAR(20) NOT NULL,
    `cli_coef` DECIMAL(3,2) NOT NULL,
    `cli_cat` VARCHAR(5) NOT NULL,
    `cli_emp_id` INT NOT NULL,
    PRIMARY KEY(`cli_id`),
    UNIQUE KEY `idx_cli_ref` (`cli_ref`),
    FOREIGN KEY(`cli_pays_id`) REFERENCES `pays`(`pays_id`),
    FOREIGN KEY(`cli_emp_id`) REFERENCES `employe`(`emp_id`)
)AUTO_INCREMENT=101;

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--


DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande`(
   `com_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
   `com_d_com` DATETIME NOT NULL,
   `com_d_paiement` DATETIME DEFAULT NULL,
   `com_reduc` DECIMAL(3,2) DEFAULT 0,
   `com_ref` VARCHAR(10) NOT NULL,
   `com_etat` char(1) NOT NULL,
   `com_adress_livraison` VARCHAR(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
   `com_adress_factu` VARCHAR(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
   `com_cli_id` INT(10) NOT NULL,
   PRIMARY KEY(`com_id`),
   UNIQUE KEY `idx_com_ref` (`com_ref`),
   FOREIGN KEY(`com_cli_id`) REFERENCES `client`(`cli_id`)
)AUTO_INCREMENT=31;

-- --------------------------------------------------------

--
-- Structure de la table `details_com`
--


DROP TABLE IF EXISTS `details_com`;
CREATE TABLE IF NOT EXISTS `details_com`(
   `detcom_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
   `detcom_qte` int(10) UNSIGNED NOT NULL,
   `detcom_tva` DECIMAL(4,2) NOT NULL,
   `detcom_d_exp` Date DEFAULT NULL,
   `detcom_d_liv` Date DEFAULT NULL,
   `detcom_adresse` VARCHAR(250) CHARACTER SET utf8 COLLATE utf8_general_ci not NULL, 
   `detcom_com_id` int(10) UNSIGNED NOT NULL,
   `detcom_pro_id` int(10) UNSIGNED NOT NULL,
   PRIMARY KEY(`detcom_id`),
   FOREIGN KEY(`detcom_com_id`) REFERENCES `commande`(`com_id`),
   FOREIGN KEY(`detcom_pro_id`) REFERENCES `produits`(`pro_id`)
)AUTO_INCREMENT=40;


