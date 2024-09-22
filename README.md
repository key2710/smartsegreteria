# smartsegreteria
Webapplication per facilitare il lavoro delle segreterie scolastiche

#Informazioni di installazione - PHPDOTENV
  #Premessa
    Ho scelto di utilizzare PHPDOTENV per la gestione delle variabili d'ambiente. Questo mi permette di NON scrivere i miei dati sensibili all'interno dei file PHP ma di poterli importare da un ambiente precedentemente configurato. Mi spiego meglio.
    Definisco in ambiente le seguenti variabili d'ambiente
    DB_HOST=localhost
    DB_NAME=mydatabase
    DB_USER=ilmiousername
    DB_PASSWORD=lapassworddelmiousername
    All'interno del file PHP che si occuperà della connessione al DB non scriverò più i dati sensibili "ilmiousername" e "lapassworddelmiousername" bensì le variabili d'ambiente dove questi sono stati mermorizzati e cioè "DB_USER" e "DB_PASSWORD". Questo mi permette di condividere un progetto e lavorare con un team senza condividere i dati sensibili di connessione essendo questi non più cablati nel sorgente ma presenti nell'ambiente della macchina host

  #Installazione
    Per poter installare PHPDOTENV è innanzi tutto necessario avere, su ambiente linux, il gestore dei pacchetti PHP COMPOSER. Si tratta di un gestore che si occupa di gestire le librerie e installarle e tenerle aggiornate. Installiamo COMPOSER
    1) Aggiornare apt con i seguenti comandi, questo ci garantisce che il gestore dei pacchetti apt sia aggiornato alla ultima release
      sudo apt update
      sudo apt upgrade
    2) Utilizzare apt per installare le dipendenze necessarie a composer. php-cli serve a eseguire comandi php direttamente nel terminale e al di fuori di un server web. php-mbstring invece è un gestore che permette di utilizzare stringhe con codifiche più complesse di UTF-8. Composer e PHPDOTENV funzionano con le stringhe multibyte e necessitano quindi di questa libreria
      sudo apt install php-cli php-mbstring unzip curl

    
