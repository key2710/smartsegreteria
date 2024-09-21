CREATE TABLE mansione (
    id_mansione INT AUTO_INCREMENT PRIMARY KEY,
    nome_mansione VARCHAR(100) NOT NULL
);

CREATE TABLE classe_di_concorso(
	id_classe_di_concorso INT AUTO_INCREMENT PRIMARY KEY,
	codice_classe_di_concorso VARCHAR(6) NOT NULL,
	descrizione_classe_di_concorso VARCHAR(100)
);

CREATE TABLE personale_scolastico (
    id_personale_scolastico INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cognome VARCHAR(100) NOT NULL,
    id_mansione INT,
    data_inizio DATE NOT NULL DEFAULT CURRENT_DATE,
    data_fine DATE DEFAULT NULL,
    telefono VARCHAR(20),
    email VARCHAR(100),
    FOREIGN KEY (id_mansione) REFERENCES mansione(id_mansione)
);

CREATE TABLE docente_personale_scolastico(
	id_docente_personale_scolastico INT AUTO_INCREMENT PRIMARY KEY,
	id_classe_di_concorso INT,
	id_personale_scolastico INT,
    FOREIGN KEY (id_classe_di_concorso) REFERENCES clase_di_concorso(id_classe_di_concorso),
    FOREIGN KEY (id_personale_scolastico) REFERENCES personale_scolastico(id_personale_scolastico)
)

CREATE TABLE classe(
	id_classe INT AUTO_INCREMENT PRIMARY KEY,
	descrizione_breve_classe VARCHAR(10),
	aula_classe VARCHAR(4),
    data_inizio DATE NOT NULL DEFAULT CURRENT_DATE,
    data_fine DATE DEFAULT NULL
)

CREATE TABLE giorno_settimana(
	id_giorno_settimana INT AUTO_INCREMENT PRIMARY KEY,
	desc_breve_giorno_settmana VARCHAR(3)
)

CREATE TABLE orario_scolastico(
	id_orario_scolastico INT AUTO_INCREMENT PRIMARY KEY,
	id_giorno_settimana INT,
	ora_lezione_giorno_settimana INT,
	id_classe INT,
	id_docente_personale_scolastico INT, 
    data_inizio DATE NOT NULL DEFAULT CURRENT_DATE,
    data_fine DATE DEFAULT NULL,
    FOREIGN KEY (id_giorno_settimana) REFERENCES giorno_settimana(id_giorno_settimana),
    FOREIGN KEY (id_classe) REFERENCES classe(id_classe),
    FOREIGN KEY (id_docente_personale_scolastico) REFERENCES docente_personale_scolastico(id_docente_personale_scolastico)    
)

insert into giorno_settimana(desc_breve_giorno_settmana)
VALUES 
	('LUN'),
	('MAR'),
	('MER'),
	('GIO'),
	('VEN'),
	('SAB');

INSERT INTO mansione(nome_mansione)
VALUES ('Docente');

insert into classe_di_concorso(codice_classe_di_concorso,descrizione_classe_di_concorso)
VALUES
	('ALFA','Classe di concorso fittizzia da correggere dopo');
