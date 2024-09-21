CREATE TABLE ruoli (
    id_ruolo INT AUTO_INCREMENT PRIMARY KEY,
    nome_ruolo VARCHAR(50) NOT NULL UNIQUE,
    descrizione VARCHAR(255) DEFAULT NULL
);

CREATE TABLE users (
    id_user INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    id_ruolo INT,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_ruolo) REFERENCES ruoli(id_ruolo)
);

CREATE TABLE authorized_emails (
    id_authorized_email INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) NOT NULL UNIQUE,
    authorized_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    authorized_by INT,  -- Id del superuser che autorizza
    FOREIGN KEY (authorized_by) REFERENCES users(id_user)
);

CREATE TABLE mansione (
    id_mansione INT AUTO_INCREMENT PRIMARY KEY,
    nome_mansione VARCHAR(100) NOT NULL
);

CREATE TABLE materia (
    id_materia INT AUTO_INCREMENT PRIMARY KEY,
    nome_materia VARCHAR(100) NOT NULL,
    descrizione_materia VARCHAR(255) DEFAULT NULL
);

CREATE TABLE classe_di_concorso(
	id_classe_di_concorso INT AUTO_INCREMENT PRIMARY KEY,
	codice_classe_di_concorso VARCHAR(6) NOT NULL UNIQUE,
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
	FOREIGN KEY (id_mansione) REFERENCES mansione(id_mansione),
	INDEX idx_cognome (cognome),
	INDEX idx_nome (nome)
);

CREATE TABLE docente_personale_scolastico(
	id_docente_personale_scolastico INT AUTO_INCREMENT PRIMARY KEY,
	id_classe_di_concorso INT,
	id_personale_scolastico INT,
	FOREIGN KEY (id_classe_di_concorso) REFERENCES classe_di_concorso(id_classe_di_concorso),
	FOREIGN KEY (id_personale_scolastico) REFERENCES personale_scolastico(id_personale_scolastico)
);

CREATE TABLE classe(
	id_classe INT AUTO_INCREMENT PRIMARY KEY,
	descrizione_breve_classe VARCHAR(10),
	aula_classe VARCHAR(4),
	data_inizio DATE NOT NULL DEFAULT CURRENT_DATE,
	data_fine DATE DEFAULT NULL
);

CREATE TABLE giorno_settimana(
	id_giorno_settimana INT AUTO_INCREMENT PRIMARY KEY,
	desc_breve_giorno_settimana VARCHAR(3)
);

CREATE TABLE orario_scolastico(
	id_orario_scolastico INT AUTO_INCREMENT PRIMARY KEY,
	id_giorno_settimana INT,
	ora_lezione_giorno_settimana INT,
	id_classe INT,
	id_docente_personale_scolastico INT, 
	id_materia INT,
	data_inizio DATE NOT NULL DEFAULT CURRENT_DATE,
	data_fine DATE DEFAULT NULL,
	FOREIGN KEY (id_giorno_settimana) REFERENCES giorno_settimana(id_giorno_settimana),
	FOREIGN KEY (id_classe) REFERENCES classe(id_classe),
	FOREIGN KEY (id_docente_personale_scolastico) REFERENCES docente_personale_scolastico(id_docente_personale_scolastico),
	FOREIGN KEY (id_materia) REFERENCES materia(id_materia)
);

insert into giorno_settimana(desc_breve_giorno_settimana)
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

INSERT INTO ruoli (nome_ruolo, descrizione)
VALUES
    ('superuser', 'Amministratore con tutti i permessi'),
    ('user', 'Utente normale con permessi limitati');
