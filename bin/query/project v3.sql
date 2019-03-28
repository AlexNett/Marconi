-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mar 15, 2019 alle 18:19
-- Versione del server: 10.1.38-MariaDB
-- Versione PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE SCHEMA IF NOT EXISTS `quintab_project` DEFAULT CHARACTER SET utf8 ;
USE `quintab_project` ;

--
-- Database: `quintab_project`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `classe`
--

CREATE TABLE `classe` (
  `idclasse` int(11) NOT NULL,
  `classe` varchar(45) NOT NULL,
  `sezione` varchar(45) NOT NULL,
  `annoScolastico` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `evento`
--

CREATE TABLE `evento` (
  `idevento` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `tipoevento_idtipoevento` int(11) NOT NULL,
  `oggetto_idoggetto` int(11) NOT NULL,
  `gruppo_idgruppo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `gruppo`
--

CREATE TABLE `gruppo` (
  `idgruppo` int(11) NOT NULL,
  `macchina_idmacchina` int(11) NOT NULL,
  `sessione_idsessione` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `gruppo_has_studente`
--

CREATE TABLE `gruppo_has_studente` (
  `gruppo_idgruppo` int(11) NOT NULL,
  `studente_idstudente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `macchina`
--

CREATE TABLE `macchina` (
  `idmacchina` int(11) NOT NULL,
  `qr` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `oggetto`
--

CREATE TABLE `oggetto` (
  `idoggetto` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `descrizione` varchar(45) NOT NULL,
  `qr` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `professore`
--

CREATE TABLE `professore` (
  `idprofessore` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `cognome` varchar(45) NOT NULL,
  `ruolo_idruolo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `ruolo`
--

CREATE TABLE `ruolo` (
  `idruolo` int(11) NOT NULL,
  `descrizione` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `sessione`
--

CREATE TABLE `sessione` (
  `idsessione` int(11) NOT NULL,
  `datainizio` datetime NOT NULL,
  `datafine` datetime NOT NULL,
  `professore_idprofessore` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `studente`
--

CREATE TABLE `studente` (
  `idstudente` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `cognome` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `classe_idclasse` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `tipoevento`
--

CREATE TABLE `tipoevento` (
  `idtipoevento` int(11) NOT NULL,
  `descrizione` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `classe`
--
ALTER TABLE `classe`
  ADD PRIMARY KEY (`idclasse`);

--
-- Indici per le tabelle `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`idevento`),
  ADD KEY `fk_evento_tipoevento1_idx` (`tipoevento_idtipoevento`),
  ADD KEY `fk_evento_oggetto1_idx` (`oggetto_idoggetto`),
  ADD KEY `fk_evento_gruppo1_idx` (`gruppo_idgruppo`);

--
-- Indici per le tabelle `gruppo`
--
ALTER TABLE `gruppo`
  ADD PRIMARY KEY (`idgruppo`),
  ADD KEY `fk_gruppo_macchina1_idx` (`macchina_idmacchina`),
  ADD KEY `fk_gruppo_sessione1_idx` (`sessione_idsessione`);

--
-- Indici per le tabelle `gruppo_has_studente`
--
ALTER TABLE `gruppo_has_studente`
  ADD PRIMARY KEY (`gruppo_idgruppo`,`studente_idstudente`),
  ADD KEY `fk_gruppo_has_studente_studente1_idx` (`studente_idstudente`),
  ADD KEY `fk_gruppo_has_studente_gruppo1_idx` (`gruppo_idgruppo`);

--
-- Indici per le tabelle `macchina`
--
ALTER TABLE `macchina`
  ADD PRIMARY KEY (`idmacchina`);

--
-- Indici per le tabelle `oggetto`
--
ALTER TABLE `oggetto`
  ADD PRIMARY KEY (`idoggetto`);

--
-- Indici per le tabelle `professore`
--
ALTER TABLE `professore`
  ADD PRIMARY KEY (`idprofessore`),
  ADD KEY `fk_professore_ruolo1_idx` (`ruolo_idruolo`);

--
-- Indici per le tabelle `ruolo`
--
ALTER TABLE `ruolo`
  ADD PRIMARY KEY (`idruolo`);

--
-- Indici per le tabelle `sessione`
--
ALTER TABLE `sessione`
  ADD PRIMARY KEY (`idsessione`),
  ADD KEY `fk_sessione_professore1_idx` (`professore_idprofessore`);

--
-- Indici per le tabelle `studente`
--
ALTER TABLE `studente`
  ADD PRIMARY KEY (`idstudente`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`),
  ADD KEY `fk_studente_classe1_idx` (`classe_idclasse`);

--
-- Indici per le tabelle `tipoevento`
--
ALTER TABLE `tipoevento`
  ADD PRIMARY KEY (`idtipoevento`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `classe`
--
ALTER TABLE `classe`
  MODIFY `idclasse` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `evento`
--
ALTER TABLE `evento`
  MODIFY `idevento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `gruppo`
--
ALTER TABLE `gruppo`
  MODIFY `idgruppo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT per la tabella `macchina`
--
ALTER TABLE `macchina`
  MODIFY `idmacchina` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `oggetto`
--
ALTER TABLE `oggetto`
  MODIFY `idoggetto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `professore`
--
ALTER TABLE `professore`
  MODIFY `idprofessore` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `ruolo`
--
ALTER TABLE `ruolo`
  MODIFY `idruolo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `sessione`
--
ALTER TABLE `sessione`
  MODIFY `idsessione` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `studente`
--
ALTER TABLE `studente`
  MODIFY `idstudente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `tipoevento`
--
ALTER TABLE `tipoevento`
  MODIFY `idtipoevento` int(11) NOT NULL AUTO_INCREMENT;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `evento`
--
ALTER TABLE `evento`
  ADD CONSTRAINT `fk_evento_gruppo1` FOREIGN KEY (`gruppo_idgruppo`) REFERENCES `gruppo` (`idgruppo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_evento_oggetto1` FOREIGN KEY (`oggetto_idoggetto`) REFERENCES `oggetto` (`idoggetto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_evento_tipoevento1` FOREIGN KEY (`tipoevento_idtipoevento`) REFERENCES `tipoevento` (`idtipoevento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `gruppo`
--
ALTER TABLE `gruppo`
  ADD CONSTRAINT `fk_gruppo_macchina1` FOREIGN KEY (`macchina_idmacchina`) REFERENCES `macchina` (`idmacchina`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_gruppo_sessione1` FOREIGN KEY (`sessione_idsessione`) REFERENCES `sessione` (`idsessione`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `gruppo_has_studente`
--
ALTER TABLE `gruppo_has_studente`
  ADD CONSTRAINT `fk_gruppo_has_studente_gruppo1` FOREIGN KEY (`gruppo_idgruppo`) REFERENCES `gruppo` (`idgruppo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_gruppo_has_studente_studente1` FOREIGN KEY (`studente_idstudente`) REFERENCES `studente` (`idstudente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `professore`
--
ALTER TABLE `professore`
  ADD CONSTRAINT `fk_professore_ruolo1` FOREIGN KEY (`ruolo_idruolo`) REFERENCES `ruolo` (`idruolo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `sessione`
--
ALTER TABLE `sessione`
  ADD CONSTRAINT `fk_sessione_professore1` FOREIGN KEY (`professore_idprofessore`) REFERENCES `professore` (`idprofessore`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `studente`
--
ALTER TABLE `studente`
  ADD CONSTRAINT `fk_studente_classe1` FOREIGN KEY (`classe_idclasse`) REFERENCES `classe` (`idclasse`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
