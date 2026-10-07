create table membre(
    id_membre serial primary key,
    nom varchar(50) not null,
    prenom varchar(50) not null,
    email varchar(100) not null unique,
    telephone varchar(20), 
    date_naissance date,
    date_inscription date not null,
    adresse varchar(150),
    statut varchar(20) not null
        check (statut in ('actif', 'inactif', 'suspendu'))
);


create table abonnement(
    id_abonnement serial primary key,
    nom_abonnement varchar(50) not null,
    description text,
    prix numeric(8, 2) not null check (prix >= 0),
    duree_mois int not null check (duree_mois > 0),
    acces_illimite boolean not null,
    nb_cours_inclus int check (nb_cours_inclus >= 0),
    statut varchar(50) not null
        check (statut in ('disponible', 'indisponible'))
);


create table souscription(
    id_souscription serial primary key,
    id_membre int not null,
    id_abonnement int not null,
    date_debut date not null,
    date_fin date not null,
    statut varchar(20) not null 
        check (statut in ('active', 'expiree', 'resiliee')),
    constraint fk_membre 
        foreign key (id_membre) 
        references membre(id_membre),
    constraint fk_abonnement 
        foreign key (id_abonnement) 
        references abonnement(id_abonnement),
    constraint check_dates 
        check (date_fin >= date_debut)
);


create table coach(
    id_coach serial primary key,
    nom varchar(50) not null,
    prenom varchar(50) not null,
    email varchar(100) not null unique,
    telephone varchar(20),
    specialite varchar(50) not null,
    date_embauche date,
    statut varchar(50) not null
        check (statut in ('actif', 'inactif'))
);


create table cours (
    id_cours serial primary key,
    nom_cours varchar(80) not null,
    description text,
    niveau varchar(20) not null 
        check (niveau in ('debutant', 'intermediaire', 'avance', 'tous niveaux')),
    capacite_max integer not null check (capacite_max > 0),
    duree_minutes integer not null check (duree_minutes > 0),
    id_coach integer not null,
    constraint fk_cours_coach foreign key (id_coach) references coach(id_coach)
);


create table seance (
    id_seance serial primary key,
    id_cours integer not null,
    date_seance date not null,
    heure_debut time not null,
    heure_fin time not null,
    salle varchar(50) not null,
    statut varchar(20) not null default 'prevue' 
        check (statut in ('prevue', 'annulee', 'terminee')),
    constraint fk_seance_cours foreign key (id_cours) references cours(id_cours),
    constraint check_heures check (heure_fin > heure_debut)
);


create table reservation (
    id_reservation serial primary key,
    id_membre integer not null,
    id_seance integer not null,
    date_reservation timestamp not null default current_timestamp,
    statut varchar(20) not null default 'confirmee' 
        check (statut in ('confirmee', 'annulee', 'en_attente')),
    constraint fk_res_membre foreign key (id_membre) references membre(id_membre),
    constraint fk_res_seance foreign key (id_seance) references seance(id_seance),
    constraint uq_reservation unique (id_membre, id_seance)
);


create table paiement (
    id_paiement serial primary key,
    id_membre integer not null,
    id_souscription integer,
    montant numeric(8, 2) not null check (montant >= 0),
    date_paiement date not null default current_date,
    moyen_paiement varchar(30) not null 
        check (moyen_paiement in ('carte', 'especes', 'virement', 'twint')),
    statut varchar(20) not null default 'valide' 
        check (statut in ('valide', 'refuse', 'rembourse')),
    constraint fk_pay_membre foreign key (id_membre) references membre(id_membre),
    constraint fk_pay_souscription foreign key (id_souscription) references souscription(id_souscription)
);
