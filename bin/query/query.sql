-- create class

USE quintab_project;

INSERT INTO classe (idclasse, classe, sezione, annoscolastico)
VALUES (NULL, 1,  1, '2018-2019');

-- create student

USE quintab_project;

INSERT INTO studente (idstudente, nome, cognome, email, classe_idclasse)
VALUES (NULL, 1,  1, 1, 2);

-- create ruolo

USE quintab_project;

INSERT INTO ruolo (idruolo, descrizione)
VALUES (NULL, 1);

-- create prof

USE quintab_project;

INSERT INTO professore (idprofessore, nome, cognome, ruolo_idruolo)
VALUES (NULL, 1, 1, 2);

-- create macchina

USE quintab_project;

INSERT INTO macchina (idmacchina, qr)
VALUES (NULL, 'test');

-- create session

USE quintab_project;

INSERT INTO sessione (idsessione, datainizio, datafine, professore_idprofessore)
VALUES (NULL, '2018-1-1', '2018-1-2', 3);

-- create group

USE quintab_project;

INSERT INTO gruppo (idgruppo, macchina_idmacchina, sessione_idsessione)
VALUES (NULL, 1, 3);

-- assegnazione studente al gruppo

INSERT INTO gruppo_has_studente (studente_idstudente, gruppo_idgruppo)
VALUES (6, (SELECT idgruppo FROM gruppo WHERE macchina_idmacchina = 1 AND sessione_idsessione = 3));

-- creazione oggetto

INSERT INTO oggetto (idoggetto, nome, descrizione, qr)
VALUES (NULL, 'yyyyy',  'xxxxxxx', 'test');

-- creazione evento

INSERT INTO evento (idevento, data, tipoevento_idtipoevento, oggetto_idoggetto, gruppo_idgruppo)
VALUES (NULL, '2018-1-1', 1, 1, 11);
