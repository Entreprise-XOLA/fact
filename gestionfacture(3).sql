-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Ven 25 Septembre 2020 à 09:01
-- Version du serveur :  5.7.14
-- Version de PHP :  7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `gestionfacture`
--

-- --------------------------------------------------------

--
-- Structure de la table `detailfact`
--

CREATE TABLE `detailfact` (
  `id_detailfact` int(11) NOT NULL,
  `idtype` int(11) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `quantite` int(255) DEFAULT NULL,
  `prixunitaire` int(255) DEFAULT NULL,
  `totalht` int(255) DEFAULT NULL,
  `total` int(255) DEFAULT NULL,
  `dateajout` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `detailfacture`
--

CREATE TABLE `detailfacture` (
  `id_detailfacture` int(11) NOT NULL,
  `idtype` int(11) NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `quantite` int(255) DEFAULT NULL,
  `prixunitaire` int(255) DEFAULT NULL,
  `totalht` int(255) DEFAULT NULL,
  `total` int(255) DEFAULT NULL,
  `dateajout` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `detailfacturetemp`
--

CREATE TABLE `detailfacturetemp` (
  `id_detailfacturetemp` int(11) NOT NULL,
  `idtypeprest` int(11) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `quantite` int(255) DEFAULT NULL,
  `prixunitaire` int(255) DEFAULT NULL,
  `totalht` int(255) DEFAULT NULL,
  `total` int(255) DEFAULT NULL,
  `totaldebours` int(255) DEFAULT NULL,
  `dateajout` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `detailfacturetemp`
--

INSERT INTO `detailfacturetemp` (`id_detailfacturetemp`, `idtypeprest`, `designation`, `quantite`, `prixunitaire`, `totalht`, `total`, `totaldebours`, `dateajout`) VALUES
(1, 2, 'redevance', 10, 1500, NULL, 15000, NULL, '2020-09-23'),
(2, 2, 'redevance', 10, 1500, 15000, 15000, NULL, '2020-09-24'),
(3, NULL, NULL, NULL, NULL, 15000, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `factdetail`
--

CREATE TABLE `factdetail` (
  `idfacture` int(11) NOT NULL,
  `id_detailfacture` int(11) NOT NULL,
  `dateajout` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `factdetailtemp`
--

CREATE TABLE `factdetailtemp` (
  `idfacturetemp` int(11) NOT NULL,
  `id_detailfacturetemp` int(11) NOT NULL,
  `dateajout` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

CREATE TABLE `facture` (
  `idfacture` int(11) NOT NULL,
  `montantht` int(255) DEFAULT NULL,
  `reduction` int(255) DEFAULT NULL,
  `montantnet` int(255) DEFAULT NULL,
  `tva` int(255) DEFAULT NULL,
  `montanttc` int(255) DEFAULT NULL,
  `numfacture` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `nif` varchar(30) DEFAULT NULL,
  `adresse` varchar(100) DEFAULT NULL,
  `bp` varchar(100) DEFAULT NULL,
  `telephone` varchar(200) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `declaration` varchar(255) DEFAULT NULL,
  `concerne` varchar(255) DEFAULT NULL,
  `bureaudest` varchar(255) DEFAULT NULL,
  `poids` int(255) DEFAULT NULL,
  `dateajout` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `facturetemp`
--

CREATE TABLE `facturetemp` (
  `idfacturetemp` int(11) NOT NULL,
  `montantht` int(255) DEFAULT NULL,
  `reduction` int(255) DEFAULT NULL,
  `montantnet` int(255) DEFAULT NULL,
  `tva` int(255) DEFAULT NULL,
  `montanttc` int(255) DEFAULT NULL,
  `numfacture` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `nif` varchar(30) DEFAULT NULL,
  `adresse` varchar(100) DEFAULT NULL,
  `bp` varchar(100) DEFAULT NULL,
  `telephone` varchar(200) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `declaration` varchar(255) DEFAULT NULL,
  `concerne` varchar(255) DEFAULT NULL,
  `bureaudest` varchar(255) DEFAULT NULL,
  `poids` int(255) DEFAULT NULL,
  `dateajout` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `facturetemp`
--

INSERT INTO `facturetemp` (`idfacturetemp`, `montantht`, `reduction`, `montantnet`, `tva`, `montanttc`, `numfacture`, `nom`, `nif`, `adresse`, `bp`, `telephone`, `email`, `declaration`, `concerne`, `bureaudest`, `poids`, `dateajout`) VALUES
(1, 15000, 0, 15000, 0, 15000, 'FCX063902/08', 'karol', '123fgbh', 'lome', '123L', '', 's@yahoo.fr', 'neant', 'karol', 'adidogome', 14, '2020-09-24'),
(2, NULL, 0, NULL, NULL, NULL, 'QON489604/33', 'karol', '123fgbh', 'lome', '123L', '22345789', 's@yahoo.fr', 'neant', 'karol', 'adidogome', 14, '2020-09-24');

-- --------------------------------------------------------

--
-- Structure de la table `permissions`
--

CREATE TABLE `permissions` (
  `permission_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(100) NOT NULL,
  `status` enum('active','inactive','deleted') NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `permissions`
--

INSERT INTO `permissions` (`permission_id`, `name`, `description`, `status`) VALUES
(1, 'admin.fraisdouane.index', 'fraisdouane', 'active'),
(2, 'admin.fraisdouane.print', 'fraisdouane', 'active'),
(3, 'admin.fraisdouane.add', 'fraisdouane', 'active'),
(4, 'admin.fraisdouane.update', 'fraisdouane', 'active'),
(5, 'admin.fraisdouane.delete', 'fraisdouane', 'active'),
(6, 'admin.autredebour.index', 'autredebour', 'active'),
(7, 'admin.autredebour.print', 'autredebour', 'active'),
(8, 'admin.autredebour.add', 'autredebour', 'active'),
(9, 'admin.autredebour.update', 'autredebour', 'active'),
(10, 'admin.autredebour.delete', 'autredebour', 'active'),
(11, 'admin.honoraire.index', 'honoraire', 'active'),
(12, 'admin.honoraire.print', 'honoraire', 'active'),
(13, 'admin.honoraire.add', 'honoraire', 'active'),
(14, 'admin.honoraire.update', 'honoraire', 'active'),
(15, 'admin.honoraire.delete', 'honoraire', 'active'),
(26, 'admin.somme.index', 'somme', 'active'),
(27, 'admin.somme.print', 'somme', 'active'),
(28, 'admin.somme.add', 'somme', 'active'),
(29, 'admin.somme.update', 'somme', 'active'),
(30, 'admin.somme.delete', 'somme', 'active');

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(60) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `can_delete` tinyint(1) NOT NULL DEFAULT '1',
  `login_destination` varchar(255) NOT NULL DEFAULT '/',
  `deleted` int(1) NOT NULL DEFAULT '0',
  `default_context` varchar(255) NOT NULL DEFAULT 'content'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`, `description`, `default`, `can_delete`, `login_destination`, `deleted`, `default_context`) VALUES
(1, 'admin', 'administrateur du site', 0, 1, '/', 0, 'content'),
(2, 'user', 'utilisateur enregistrer', 0, 1, '/', 0, 'content');

-- --------------------------------------------------------

--
-- Structure de la table `role_permissions`
--

CREATE TABLE `role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `role_permissions`
--

INSERT INTO `role_permissions` (`role_id`, `permission_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(1, 22),
(1, 23),
(1, 24),
(1, 25),
(1, 26),
(1, 27),
(1, 28),
(1, 29),
(1, 30),
(1, 31),
(1, 32),
(1, 33),
(1, 34),
(1, 35),
(1, 36),
(1, 37),
(1, 38),
(1, 39),
(1, 40),
(1, 41),
(1, 42),
(1, 43),
(1, 44),
(1, 45),
(1, 46),
(1, 47),
(1, 48),
(1, 49),
(1, 50),
(1, 51),
(1, 52),
(1, 53),
(1, 54),
(1, 55),
(1, 56),
(1, 57),
(1, 58),
(1, 59),
(1, 60),
(1, 61),
(1, 62),
(1, 63),
(1, 64),
(1, 65),
(1, 66),
(1, 67),
(1, 68),
(1, 69),
(1, 70),
(1, 71),
(1, 72),
(1, 73),
(1, 74),
(1, 75),
(1, 76),
(1, 77),
(1, 78),
(1, 79),
(1, 80),
(1, 81),
(1, 82),
(1, 83),
(1, 84),
(1, 85),
(1, 86),
(1, 87),
(1, 88),
(1, 89),
(1, 90),
(1, 91),
(1, 92),
(1, 93),
(1, 94),
(1, 95),
(1, 96),
(1, 97),
(1, 98),
(1, 99),
(1, 100),
(1, 101),
(1, 102),
(1, 103),
(1, 104),
(1, 105);

-- --------------------------------------------------------

--
-- Structure de la table `typeprestation`
--

CREATE TABLE `typeprestation` (
  `idtypeprestation` int(11) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `dateajout` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `typeprestation`
--

INSERT INTO `typeprestation` (`idtypeprestation`, `libelle`, `dateajout`) VALUES
(1, 'FRAIS DE DOUANE', '2020-09-23'),
(2, 'AUTRES DEBOURS', '2020-09-23'),
(3, 'HONORAIRES', '2020-09-23');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `id_pays` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `password` varchar(300) NOT NULL,
  `nom` varchar(40) NOT NULL,
  `prenom` varchar(40) NOT NULL,
  `email` varchar(100) NOT NULL,
  `about` varchar(400) NOT NULL,
  `lang` varchar(100) NOT NULL,
  `avatar` varchar(200) NOT NULL,
  `last_ip` varchar(20) NOT NULL,
  `last_login` datetime NOT NULL,
  `status` int(2) NOT NULL,
  `code_activation` varchar(40) NOT NULL,
  `fuseau_horaire` int(11) NOT NULL,
  `date_ajout` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id_user`, `id_pays`, `role_id`, `password`, `nom`, `prenom`, `email`, `about`, `lang`, `avatar`, `last_ip`, `last_login`, `status`, `code_activation`, `fuseau_horaire`, `date_ajout`) VALUES
(1, 1, 1, '$2y$10$Dqud032H8DyOZT8cH4xCCOxdVB3FbjPf.ptWhY1LpvVVTrp.1Dwk6', 'dyssa', 'dyssa', 'adjdyssa22@gmail.com', '', '', '', '', '0000-00-00 00:00:00', 1, '', 0, '2019-09-04 16:56:35');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `IDUTILISATEUR` int(11) NOT NULL,
  `IDTYPE` int(11) DEFAULT NULL,
  `IDROLE` int(11) DEFAULT NULL,
  `NOM` char(30) DEFAULT NULL,
  `PRENOM` char(50) DEFAULT NULL,
  `TEL` char(30) DEFAULT NULL,
  `VILLE` char(30) DEFAULT NULL,
  `QUARTIER` char(20) DEFAULT NULL,
  `ADRESSE` varchar(255) DEFAULT NULL,
  `DATENAIS` date DEFAULT NULL,
  `LIEUNAIS` varchar(255) DEFAULT NULL,
  `NUMPIECE` char(20) DEFAULT NULL,
  `CONTENUPIECE` int(11) DEFAULT NULL,
  `DATEEMISSION` date DEFAULT NULL,
  `DATEEXPIRATION` date DEFAULT NULL,
  `EMAIL` char(20) DEFAULT NULL,
  `CODE` varchar(255) DEFAULT NULL,
  `PWD` varchar(255) DEFAULT NULL,
  `STATU` int(11) DEFAULT NULL,
  `NOTEPUBLIQUE` varchar(255) DEFAULT NULL,
  `NOTEPRIVEE` varchar(255) DEFAULT NULL,
  `LAST_LOGIN` datetime DEFAULT NULL,
  `DATEAJOUT` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurtoken`
--

CREATE TABLE `utilisateurtoken` (
  `IDTOKEN` int(11) NOT NULL,
  `IDUTILISATEUR` int(11) NOT NULL,
  `TOKEN` varchar(255) NOT NULL,
  `DATEAJOUT` datetime NOT NULL,
  `DATEEXPIRATION` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `detailfact`
--
ALTER TABLE `detailfact`
  ADD PRIMARY KEY (`id_detailfact`),
  ADD KEY `fk_idtype_idtypeprestation` (`idtype`);

--
-- Index pour la table `detailfacture`
--
ALTER TABLE `detailfacture`
  ADD PRIMARY KEY (`id_detailfacture`),
  ADD KEY `fk_idtype_id` (`idtype`);

--
-- Index pour la table `detailfacturetemp`
--
ALTER TABLE `detailfacturetemp`
  ADD PRIMARY KEY (`id_detailfacturetemp`),
  ADD KEY `fk_idtypeprest_idtypeprestation` (`idtypeprest`);

--
-- Index pour la table `factdetail`
--
ALTER TABLE `factdetail`
  ADD PRIMARY KEY (`idfacture`,`id_detailfacture`),
  ADD KEY `fk_idfacture_detail` (`id_detailfacture`);

--
-- Index pour la table `factdetailtemp`
--
ALTER TABLE `factdetailtemp`
  ADD PRIMARY KEY (`idfacturetemp`,`id_detailfacturetemp`),
  ADD KEY `fk_iddetail_id` (`id_detailfacturetemp`);

--
-- Index pour la table `facture`
--
ALTER TABLE `facture`
  ADD PRIMARY KEY (`idfacture`);

--
-- Index pour la table `facturetemp`
--
ALTER TABLE `facturetemp`
  ADD PRIMARY KEY (`idfacturetemp`);

--
-- Index pour la table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`permission_id`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Index pour la table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD PRIMARY KEY (`role_id`,`permission_id`);

--
-- Index pour la table `typeprestation`
--
ALTER TABLE `typeprestation`
  ADD PRIMARY KEY (`idtypeprestation`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`IDUTILISATEUR`),
  ADD KEY `fk_utilisateur_typepiece` (`IDTYPE`),
  ADD KEY `fk_utilisateur_role` (`IDROLE`),
  ADD KEY `fk_utilisateur_idville` (`VILLE`),
  ADD KEY `fk_utilisateur_contenupiece` (`CONTENUPIECE`),
  ADD KEY `fk_statuutilisateur_idstatuutilisateur` (`STATU`);

--
-- Index pour la table `utilisateurtoken`
--
ALTER TABLE `utilisateurtoken`
  ADD PRIMARY KEY (`IDTOKEN`),
  ADD KEY `fk_idutilisateur_token` (`IDUTILISATEUR`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `detailfact`
--
ALTER TABLE `detailfact`
  MODIFY `id_detailfact` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `detailfacture`
--
ALTER TABLE `detailfacture`
  MODIFY `id_detailfacture` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `detailfacturetemp`
--
ALTER TABLE `detailfacturetemp`
  MODIFY `id_detailfacturetemp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `facture`
--
ALTER TABLE `facture`
  MODIFY `idfacture` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `facturetemp`
--
ALTER TABLE `facturetemp`
  MODIFY `idfacturetemp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `permission_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;
--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `typeprestation`
--
ALTER TABLE `typeprestation`
  MODIFY `idtypeprestation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `IDUTILISATEUR` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT pour la table `utilisateurtoken`
--
ALTER TABLE `utilisateurtoken`
  MODIFY `IDTOKEN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `detailfact`
--
ALTER TABLE `detailfact`
  ADD CONSTRAINT `fk_idtype_idtypeprestation` FOREIGN KEY (`idtype`) REFERENCES `typeprestation` (`idtypeprestation`);

--
-- Contraintes pour la table `detailfacture`
--
ALTER TABLE `detailfacture`
  ADD CONSTRAINT `fk_idtype_id` FOREIGN KEY (`idtype`) REFERENCES `typeprestation` (`idtypeprestation`);

--
-- Contraintes pour la table `detailfacturetemp`
--
ALTER TABLE `detailfacturetemp`
  ADD CONSTRAINT `fk_idtypeprest_idtypeprestation` FOREIGN KEY (`idtypeprest`) REFERENCES `typeprestation` (`idtypeprestation`);

--
-- Contraintes pour la table `factdetailtemp`
--
ALTER TABLE `factdetailtemp`
  ADD CONSTRAINT `fk_iddetail_id` FOREIGN KEY (`id_detailfacturetemp`) REFERENCES `detailfacturetemp` (`id_detailfacturetemp`),
  ADD CONSTRAINT `fk_idfacturetemp_id` FOREIGN KEY (`idfacturetemp`) REFERENCES `facturetemp` (`idfacturetemp`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
