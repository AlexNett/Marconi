-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mar 28, 2019 alle 17:30
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
-- Struttura della tabella `annoscolastivo`
--

CREATE TABLE `annoscolastivo` (
  `idannoscolastico` int(11) NOT NULL,
  `annoInizio` date NOT NULL,
  `annoFine` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `annoscolastivo`
--

INSERT INTO `annoscolastivo` (`idannoscolastico`, `annoInizio`, `annoFine`) VALUES
(1, '2017-00-00', '2018-00-00'),
(2, '2018-00-00', '2019-00-00');

-- --------------------------------------------------------

--
-- Struttura della tabella `classe`
--

CREATE TABLE `classe` (
  `idclasse` int(11) NOT NULL,
  `classe` varchar(45) NOT NULL,
  `sezione` varchar(45) NOT NULL,
  `annoScolastico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `classe`
--

INSERT INTO `classe` (`idclasse`, `classe`, `sezione`, `annoScolastico`) VALUES
(1, '1', 'A', 1),
(2, '2', 'A', 1),
(3, '3', 'A', 1),
(4, '4', 'A', 1),
(5, '5', 'A', 1),
(6, '1', 'B', 1),
(7, '2', 'B', 1),
(8, '3', 'B', 1),
(9, '4', 'B', 1),
(10, '5', 'B', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `docente`
--

CREATE TABLE `docente` (
  `iddocente` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `cognome` varchar(45) NOT NULL,
  `ruolo_idruolo` int(11) NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `docente`
--

INSERT INTO `docente` (`iddocente`, `nome`, `cognome`, `ruolo_idruolo`, `password`, `email`) VALUES
(19, 'Alex', 'Min', 1, 'pass', 'adam.min@Marconi.com'),
(21, 'Mario', 'Luigi', 1, 'Reset', 'BoB@Gmail.com'),
(22, 'A', 'A', 2, 'rr', 'A@A'),
(23, 'B', 'B', 2, 'rwrwwrwrrwrrwrr', 'B@B'),
(26, 'C', 'C', 2, 'ww', 'C@C'),
(28, 'A', 'A', 2, 'A', 'A');

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

--
-- Dump dei dati per la tabella `macchina`
--

INSERT INTO `macchina` (`idmacchina`, `qr`) VALUES
(4, 0x89504e470d0a1a0a0000000d494844520000012c0000012c0806000000797d8e750000000467414d410000b18f0bfc6105000000017352474200aece1ce9000000206348524d00007a26000080840000fa00000080e8000075300000ea6000003a98000017709cba513c00000006624b4744000000000000f943bb7f000000097048597300000048000000480046c96b3e000009aa4944415478daeddc8d6ae25a1480515f42dfffe1c48710c1a105413aa9893539d93feb8370a743e8b4c971d56cceede12e49493ab80492802549c092042c49029624014b12b024095892042c49c09224604912b024014b92802549c092042c49029624014b12b024095892042c49c09224604912b024014b92802549c092042c49029624604912b024095892802549c092246049029624016b69c7e3f17e381c5a1e436ffe4a5f4fb4cf631de65a87c0b25080651d026b54a7d3c94201d6eed7c73a049685022c6059871e092d14605987c00216b080651d02cb5b71607924b40e8165a100cb3a0496b7e2c0f248681d02eb8f0be57c3edfafd7ebf7f95fff7d1c3f3f8e74ce92efab2a10195f6cd621b0565f2873376aef03583dc0eab80e81f5c6ece072b9dcb3b5e4fb02561cb0ac4360ad7641bf7eb2bdeaf927cb3be74c7dbcd639de61d503abf33a04d61f67073f6fd6d4dbe125e7986101cb3a04d6d061e7bbcff36b2f945707b0fa0cdd3bac4360991d00cb0ccb0c0b58cb9b9b377c720eb08055691d02ebc3d9c19201e46fb3842dcff148d86b86d5651d026b85d9c1f3c7235f24d5879d23301af9f55887c0da05ac5703c93d164ad56127b0ac43606d3c3b88f618927976d0112ceb1058ab5dd0251bf646ff647b35ecf40eab2658d621b056dbb0677600ac91332ceb10581f6dd8333b00d65e4377ebd023a1d901b0ccb0ccb080b5c542a9b6610f58d621b0569e1d441b769a61f59c615987c0b2612ff02346c61df3d621b07601abe3863d60c503cbc651332cc34e60ed0a967508accd16cad470b1eab0135871c1eab40e81556476b0f5b01358665811d621b00a2c14332c6099617924343b009619961916b0ccb080651d026be823e1d48da9bc610f58311f09bbad436015197646d8b0371291aa5fb37508acd5178a0d7bc0b20e0dddcdb0920f3b81651d1aba075e2836ec01cb3a347437c34aba610f58d6a1a1bb856286052ceb10586607c032c332c302961916b0ac4360c57a2b3e7563ba6fd80396756886956c76b06413ddc873a2ed741ff96f65dc556f1d026bf5853277a3221dc0aa0b56c77508ac95670719bf2f60c501cb3a04d6660b656ab8b864003975cedc794bcf01563fb03aad436015991d6c3dec04961956847508ac1516cade87a13bb0baac4360991d00cb0ccb0c0b58c002967508ac008f84b7dbedfb78bcdd7dfef3f3dfed71cee3cf8f8f3d12d67d24ecb80e81f5c642a97a8c7cd1fa3cd621b080052c6001cb0ccb4201cdd8cf631d02cb420104b080e59110583e8f474260010b58c0b20e81e5ad38203c12020b58c0f27980052c8f84c0f248681d024bdbdcd8c63bd433bf20052c60010b58c012b08025600958c012b080052c60014bc00296802560014bc00216b0042c010b586a0756e71dea9d77d5bb3eb97e3000cbe20696eb032c60010b58c00216b080052c60010b58c0727d80052c60010b58c00216b0dc5360010b58c0727d80052c60010b58c0ca77011a2fb8aa5f73e75dfed5510316b080052c60010b58c00216b080052c60010b58c00216b080052c60010b58c00216b080052c60010b58c00216b080052c6035052be322e8bc7033ee74b78b1d58c00216b080052c60010b58c00216b080052c60010b58c00216b080052c60010b58c00216b080052c60010b58c00216b08005ac446075fe35ca7e78f4dcc50e2c60010b58c00216b080052c010b58c00216b080052c60010b58c00216b0042c60010b58c00216b080052c60010b58c012b01c6590752feafdc003960358ee05b080e545022cf70258c0f2220116b080e500967b012c607991000b58c002961789fb0e2c603980e55e000b585e24c0025673b0fc1adcba0b2eca7dcff8f5583fc00216b080052c60010b58c00216b080052c60010b58c00216b080052c60010b58c00216b080052c60010b58c00216b08005acb66055fd3c768df7dc9d5f155060010b58c00216b080052c60010b58c00216b080052c60010b58c00216b080052c60010b58c00216b080052c60010b58c0b27e8035ec065745a4f3f715eddfcaf8da0116b080052c60010b58c00216b080052c60010b58c00216b080052c60010b58c00216b080052c60010b58c00216b080052c6001ab2458d16e4ce75fc75c75577dd55fa30c2c6001cb012c60010b58c00216b080052c60010b58c072000b58c00216b080052c60010b58c00216b01cc00216b080052c60a918e89d2176bf80252f0060f97a802560010b58c00216b0dc2f60c90b0058be1e60095880009680052cf70b58f2020096af0758c00216208015a4e3f1683773b117b6eb5cefd75e030b58c0729d81950dacd3e9042c60b9cec00216b080052c6079240416b080052c6001cb750696474260010b58c00216b080052c8f84c00216b0809515acf3f97cbf5eafdfe77ffdf771fcfc38d2394bbeaf684044fbb7a2419cf1fa642e3d587360ec7d000b58c032c3ba5f2e9774177bc9f7052c6001ab20585fefb05ef5fc0ee79d73a63e5eeb1cefb080052c33acffd0987a2c5b728e1916b08005aca143f777e74a6b83f5ea0016b08065866586052c6001ab27587373af4fce0116b080e591f0ad41f86f33ad2dcff148082c60016b76ae347267f0c8a1bb1de171ae8fdde7c05a6de3e81e608d18ba030b58c02a38c38ab698d69a61010b58c04a06d6928da3a3df61bd1aba7b87052c6079247c39e436c30216b080157ae8fe7c9861010b58c032c332c30216b0805509ac2d378e020b58c02a30c38a367437c30216b08065e368d11740c6177fc61f1e7e45f28e60d9380a2c6001cb0cabc1d01d58c002d64e604d0db90ddd81052c609961cdccb0b20cdd81052c603507cb0c0b58c0f2486886052c60010b586658c00216b0863e124e0161e328b080052c33ac241b47a3bd203be358f5ff2800d61fc0b2711458c002961956f2a13bb08005acc060d9380a2c6001cb0c2be9c65160010b58c032c30216b0806586052c60010b586658c00216b0623d124e01d17de328b08005ac6433ac259b39479e130d2c18e5da7dee572d17df381aed0016b080658695a668332c60010b583b813535e45e32089f3a67eebca5e7000b58c0f248187e869565e80e2c60016b67b0f63e0cdd81052c8f846658c00216b080052c60010b58c31e096fb7dbf7f178ec7afef3f3dfed71cee3cf8f8f3d12020b584dc1aa7a64042bdacefb919f2723b276ba030b58c002961916b080052c60010b58c00216b03c12020b58c00216b080052c6079240416b080052c60010b58c0f248082c60010b5892143e6049029624014b12b024095892042c49c09224604912b024014b92802549c092042c49029624014b12b024095892042c49c09224604912b024014b92802549c092042c49029624014b12b02409589280e51248029624014b12b024095892042c49c092246049d247fd03572f656823734eeb0000002574455874646174653a63726561746500323031392d30332d32325431373a32323a35322b30303a30304742bf9d0000002574455874646174653a6d6f6469667900323031392d30332d32325431373a32323a35322b30303a3030361f072100000028744558747376673a626173652d7572690066696c653a2f2f2f746d702f6d616769636b2d65745a4c795a6c504c50f29e0000000049454e44ae426082),
(7, 0x89504e470d0a1a0a0000000d494844520000012c0000012c0806000000797d8e750000000467414d410000b18f0bfc6105000000017352474200aece1ce9000000206348524d00007a26000080840000fa00000080e8000075300000ea6000003a98000017709cba513c00000006624b4744000000000000f943bb7f000000097048597300000048000000480046c96b3e000009a84944415478daeddc018ae2581080612fa1f73f9c7808111c1402d2938eb17d79a97af5fd203bbd84deb1ad7c6d8aac87bb2425e9e04720095892042c49c09224604912b024014b92802549c092042c49029624014b12b024095892042c49c09224604912b024014b92802549c092042c49029624014b12b024095892042c49c092246049029624014b928025095892042c49029624604912b0d6763c1eef87c3a1e463d58b36e8f73187b9e61058060558e61058d9c03a9d4e060558e61058c00216b0cc21b0bc1507964b426001cba000cb1c02cb2521b080650e81655080052c60b9243428c03287c0ca3a28e7f3f97ebd5e9fc73ffe393d7e7e1de99835cfabd90b0bf4afbf8f390456f34179f742edfd00560db0cca11dd6e2e372b90cb91301561cb0cc21b09afd401fbfd9967afdcdf2c931735fb73ac63bacf1c03287c0fa7877f0f3c59a7b3bbce6183b2c60994360755dba7f7a3ddf7a50961ec0aab37437872e09ed0e806587658705aca56bfe96c7000b58d5e6d025e1c2ee60cd02f2b75dc296c7b824acb5c33287c0fad30d7b3d4fa49ecbce8c773c6784cf1c02abf9a02c2d24f718941ecb4e60c503abe21c02abf1ee20da09d06a7700ac38af57e53904d6073fd03537ecf5fecdb6b4ecf40e6b4cb02acf21b0be5c76da61016bcf1d56b53904568365e7ebc30e0b58116e1cb5c372496887052c3b2c3b2c60b51a942d6fd80316b022cc21b0bedc1d445b76da61d5dc615599436035d81d58bac7bcb33ce3c7319b4360351f14378e022b02586e1cb5c3b2ec04d6ae609943606d362873cb454b776099434b773bac37bb836a4b77978435e71058030c8a1d16b0ecb05c12da1d00cb0ecb0e0b587658c03287c0eafa567cee8571e328b0cca11d961d56921b479b0dc8a0f0994360ed32286e1c05961b472dddedb0922fdd81650e2ddd0383e5c65160b971d4d2dd0e2be98da3c0328796eec0b2c30296390496dd01b0ecb0ecb0806587052c7308ac589784732f4cf51b4781650eedb092edb0d6dc44d7f398688332ea1deae6d08da36107e5dd0b15e901ac71c1328776585fef0e323e2f6099c36a735812acb9e5e29a05e4dc31ef8e5b7b0cb0ea81650e5d12a6db1d64597602cb1c026be741d9fb61e90e2c73e892d0ee0058e6d00e0b58c00296390456b7b7e2b7dbedf998deeebefef9f5dfed71ccf4e7e96b9784e35e129a4360957cf43cf97d1f73082c60010b58c0b2c33228a0e9fb7dcc21b00c0a2080052c9784c0f27d5c12020b58c00296390496b7e2807049082c6001cbf70116b05c1202cb25a1390496f67bf1134293f96413b0042c60014bc00296802560014bc012b080052c010b58029680052c014bc012b0042c6009581b0e6eb41360542032fe9c33fe7d2a7f5c35b080052c60010b58c00216b080052c60010b58c00216b080052c60010b58c00216b080052c60010b58c00216b080052c60010b58a17ee81987a0f21dea95efaa0796610216b080052c6001cb8c995560190260010b58c00216b080052c60010b58c00216b080052c60010b58c00216b080052c6001abec0f3ddaddde9e975f1e23bd16c00216b080052c60010b58c00216b080052c6001cb890d2c60010b58c00216b080052c60010b58c07262030b58c00216b080052c600df902bb93db899de5f50296c10516b080052c60010b58c00216b080052c60010b58c00216b080052c60010b58c00216b080052c60010b58c00216b08005acb260453b492a9f00fe4f809a1f570d2c60010b58c00216b080052c60010b58c00216b080052c60010b58c00216b080052c60010b58c00216b080052c60010b58c00256ba1766d481abfc8bc1dde7c00216b080052c60010b58c00216b080052c60010b58c00216b080052c60010b58c00216b080052c60010b58c00216b080052c6025022bda490223c88e78f739b080052c60010b58c00216b080052c60010b58c00216b080052c60010b58c00216b080052c60010b58c0029680052c60010b582130ca387019ff3e197f090d7b42fb886460010b58c00216b080052c60010b58c00216b080052c60010b58c00216b080052c60010b58c00216b080052c60010b58c0025636b032be7850cbf57d2affdf0ba9cf6960010b58c00216b080052c60010b58c00216b080052c60010b58c00216b080052c60010b58c00216b080052c60010b58c00216b0aa35eac7f27a5e3e461958c072627b5ec012b03c2f60014b4e6ccf0b58c0029613dbf3029680e579010b5872627b5ec00216b09cd89e17b0e404f0bc805510ace3f198f26ee56c773c8ffa51d4eee0f711c9c00216b08005acb94ea713b080052c60010b58c00216b05c12020b58c00216b080052c60b9240416b080052c60010b58c07249082c60010b5859c13a9fcff7ebf5fa3cfef1cfe9f1f3eb48c7ac795e5d5ffcc21f211dede73cea2f2a60fd00eb1d187b3f80052c60d961dd2f97cb3d5b6b9e17b08005ac01c17abcc35aeaf51dce27c7cc7dddea18efb080052c3bacffd098bb2c5b738c1d16b08005acae4bf74ff74aadc15a7a000b58c0b2c3b2c30216b0805513ac777baf6f8e0116b080e592f0a345f86f3bad2d8f7149082c6001ebed5ea9e79dc1d196eea37e4c70cfff963bef81d51caca5c5f81e604559ba030b58c04ab6c38a36703d7758c00216b00281b5e6c6d1deefb09696eede61010b582e091797dc7658c00216b0422fdd5f1f7658c00216b0ecb0ecb080052c608d04d6de378e020b58c00abec38ab674b7c30216b08055fec6d1ca1f955bf5a3b323fe1f05c0fa0358156f1c0516b08065879566e90e2c60012b3958734bee5197eec00216b0ecb09aedb0b65eba030b58c002961d16b080052c3b2c9784c00216b0429fd87658c002964b42378e020b58c0b2c31aedc6d19edf271a4619d1affc4ba814586e1c0516b0806587957ce90e2c60012b30586e1c0516b080658795f4c65160010b58c0b2c30216b0806587052c60010b587658c00216b0625d12ce0151fdc65160010b58c976586b6ee6ec794c46b07cdc701c6433fe7d80f5c18da3d11ec00216b0ecb0d2947187052c60016b03b0e696dc6b16e173c7bc3b6eed31c00216b05c1286df618db4740716b080b521587b3f2cdd81052c97847658c00216b080052c60010b58dd2e096fb7dbf3315d76bdfef9f5dfed71ccf4e7e96b9784c0025651b09c6cb9fecee1067fd0bbfc81052c60010b58c0fa6ed7032cc30d2c60010b58c00216b05c12020b585e536001cb70030b582e0981052c60010b58c00296d7d42521b00c37b0802549c092246049029624014b928025095892042c49029624604912b024095892802549c092246049029624014b928025095892042c49c09224604912b024014b92802549c092042c49029624014b12b024095892042c49c09224604912b024014b92802549c0923442ff0047589cf86b3aeb8f0000002574455874646174653a63726561746500323031392d30332d32335431333a32343a30362b30303a303098221eaa0000002574455874646174653a6d6f6469667900323031392d30332d32335431333a32343a30362b30303a3030e97fa61600000028744558747376673a626173652d7572690066696c653a2f2f2f746d702f6d616769636b2d55514862536e36434cf0733b0000000049454e44ae426082);

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
-- Struttura della tabella `ruolo`
--

CREATE TABLE `ruolo` (
  `idruolo` int(11) NOT NULL,
  `descrizione` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `ruolo`
--

INSERT INTO `ruolo` (`idruolo`, `descrizione`) VALUES
(1, 'Amministratore'),
(2, 'Docente');

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
-- Indici per le tabelle `annoscolastivo`
--
ALTER TABLE `annoscolastivo`
  ADD PRIMARY KEY (`idannoscolastico`);

--
-- Indici per le tabelle `classe`
--
ALTER TABLE `classe`
  ADD PRIMARY KEY (`idclasse`),
  ADD KEY `annoScolastico` (`annoScolastico`);

--
-- Indici per le tabelle `docente`
--
ALTER TABLE `docente`
  ADD PRIMARY KEY (`iddocente`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_professore_ruolo1_idx` (`ruolo_idruolo`);

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
-- AUTO_INCREMENT per la tabella `annoscolastivo`
--
ALTER TABLE `annoscolastivo`
  MODIFY `idannoscolastico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `classe`
--
ALTER TABLE `classe`
  MODIFY `idclasse` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT per la tabella `docente`
--
ALTER TABLE `docente`
  MODIFY `iddocente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT per la tabella `evento`
--
ALTER TABLE `evento`
  MODIFY `idevento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `gruppo`
--
ALTER TABLE `gruppo`
  MODIFY `idgruppo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `macchina`
--
ALTER TABLE `macchina`
  MODIFY `idmacchina` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT per la tabella `oggetto`
--
ALTER TABLE `oggetto`
  MODIFY `idoggetto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `ruolo`
--
ALTER TABLE `ruolo`
  MODIFY `idruolo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `sessione`
--
ALTER TABLE `sessione`
  MODIFY `idsessione` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `studente`
--
ALTER TABLE `studente`
  MODIFY `idstudente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `tipoevento`
--
ALTER TABLE `tipoevento`
  MODIFY `idtipoevento` int(11) NOT NULL AUTO_INCREMENT;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `classe`
--
ALTER TABLE `classe`
  ADD CONSTRAINT `classe_ibfk_1` FOREIGN KEY (`annoScolastico`) REFERENCES `annoscolastivo` (`idannoscolastico`);

--
-- Limiti per la tabella `docente`
--
ALTER TABLE `docente`
  ADD CONSTRAINT `fk_professore_ruolo1` FOREIGN KEY (`ruolo_idruolo`) REFERENCES `ruolo` (`idruolo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
-- Limiti per la tabella `sessione`
--
ALTER TABLE `sessione`
  ADD CONSTRAINT `fk_sessione_professore1` FOREIGN KEY (`professore_idprofessore`) REFERENCES `docente` (`iddocente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `studente`
--
ALTER TABLE `studente`
  ADD CONSTRAINT `fk_studente_classe1` FOREIGN KEY (`classe_idclasse`) REFERENCES `classe` (`idclasse`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
