-- Données générées avec Claude AI

-- ============================================================
-- MP Gym — Données de test
-- ============================================================

-- ============================================================
-- MEMBRES
-- ============================================================
INSERT INTO membre (nom, prenom, email, telephone, date_naissance, date_inscription, adresse, statut) VALUES
('Dupont',    'Alice',   'alice.dupont@email.com',    '0781234567', '1995-03-12', '2023-01-10', '12 rue des Alpes, Genève',       'actif'),
('Martin',    'Bruno',   'bruno.martin@email.com',    '0782345678', '1988-07-24', '2023-02-15', '45 avenue de la Gare, Genève',   'actif'),
('Bernard',   'Clara',   'clara.bernard@email.com',   '0783456789', '2000-11-05', '2023-03-01', '8 chemin du Lac, Genève',        'actif'),
('Leroy',     'David',   'david.leroy@email.com',     '0784567890', '1992-06-18', '2023-03-20', '23 rue de Rive, Genève',         'inactif'),
('Moreau',    'Emma',    'emma.moreau@email.com',     '0785678901', '1997-01-30', '2023-04-05', '67 boulevard Carl-Vogt, Genève', 'actif'),
('Simon',     'Félix',   'felix.simon@email.com',     '0786789012', '1985-09-14', '2023-05-12', '3 rue du Marché, Genève',        'actif'),
('Laurent',   'Gaëlle',  'gaelle.laurent@email.com',  '0787890123', '1993-04-22', '2023-06-01', '14 rue de Carouge, Genève',      'suspendu'),
('Petit',     'Hugo',    'hugo.petit@email.com',      '0788901234', '1990-12-08', '2023-07-18', '56 rue de la Servette, Genève',  'actif'),
('Roux',      'Inès',    'ines.roux@email.com',       '0789012345', '2001-08-17', '2023-08-03', '9 rue Voltaire, Genève',         'actif'),
('Girard',    'Jules',   'jules.girard@email.com',    '0780123456', '1998-02-25', '2023-09-10', '31 avenue Pictet-de-Rochemont',  'actif'),
('Blanc',     'Karine',  'karine.blanc@email.com',    '0781111111', '1986-05-03', '2023-10-01', '18 rue de la Croix-Rouge',       'actif'),
('Favre',     'Lucas',   'lucas.favre@email.com',     '0782222222', '1994-10-19', '2024-01-05', '7 rue des Eaux-Vives, Genève',   'actif');

-- ============================================================
-- ABONNEMENTS
-- ============================================================
INSERT INTO abonnement (nom_abonnement, description, prix, duree_mois, acces_illimite, nb_cours_inclus, statut) VALUES
('Basic',      'Accès salle uniquement, horaires limités',         29.90,  1,  false, 0,    'disponible'),
('Standard',   'Accès salle + 4 cours par mois',                  49.90,  1,  false, 4,    'disponible'),
('Premium',    'Accès illimité salle et tous les cours',           79.90,  1,  true,  NULL, 'disponible'),
('Trimestriel','Accès illimité sur 3 mois, tarif réduit',         199.90, 3,  true,  NULL, 'disponible'),
('Annuel',     'Accès illimité sur 12 mois, meilleur tarif',      699.90, 12, true,  NULL, 'disponible'),
('Étudiant',   'Accès salle + 2 cours, sur justificatif',         24.90,  1,  false, 2,    'disponible'),
('Découverte', 'Offre 1 semaine pour tester la salle',             9.90,  1,  false, 1,    'indisponible');

-- ============================================================
-- COACHS
-- ============================================================
INSERT INTO coach (nom, prenom, email, telephone, specialite, date_embauche, statut) VALUES
('Durand',  'Marc',    'marc.durand@mpgym.ch',   '0791111111', 'Musculation',     '2021-01-15', 'actif'),
('Lefèvre', 'Sophie',  'sophie.lefevre@mpgym.ch','0792222222', 'Yoga',            '2021-03-01', 'actif'),
('Bonnet',  'Antoine', 'antoine.bonnet@mpgym.ch','0793333333', 'Cardio',          '2022-06-10', 'actif'),
('Chevalier','Lucie',  'lucie.chevalier@mpgym.ch','0794444444','CrossFit',        '2022-09-01', 'actif'),
('Morel',   'Romain',  'romain.morel@mpgym.ch',  '0795555555', 'Pilates',         '2023-01-20', 'inactif');

-- ============================================================
-- COURS
-- ============================================================
INSERT INTO cours (nom_cours, description, niveau, capacite_max, duree_minutes, id_coach) VALUES
('Musculation débutant',   'Introduction aux machines et aux poids libres',    'debutant',      15, 60,  1),
('CrossFit intensif',      'Entraînement fonctionnel haute intensité',          'avance',        12, 60,  4),
('Yoga flow',              'Enchaînement de postures en douceur',               'tous niveaux',  20, 60,  2),
('Cardio HIIT',            'Intervalles cardio brûle-graisse',                  'intermediaire', 20, 45,  3),
('Pilates core',           'Renforcement profond du gainage',                   'tous niveaux',  15, 55,  5),
('Musculation avancée',    'Programme force et hypertrophie',                   'avance',        10, 75,  1),
('Yoga relaxation',        'Étirements et respiration, idéal après le sport',   'debutant',      20, 45,  2),
('Cardio endurance',       'Course et vélo pour travailler le souffle',         'intermediaire', 18, 60,  3);

-- ============================================================
-- SÉANCES
-- ============================================================
INSERT INTO seance (id_cours, date_seance, heure_debut, heure_fin, salle, statut) VALUES
-- Semaine passée
(1, CURRENT_DATE - 7, '08:00', '09:00', 'Salle A', 'terminee'),
(3, CURRENT_DATE - 7, '10:00', '11:00', 'Salle B', 'terminee'),
(4, CURRENT_DATE - 6, '07:00', '07:45', 'Salle C', 'terminee'),
(2, CURRENT_DATE - 5, '18:00', '19:00', 'Salle A', 'terminee'),
(5, CURRENT_DATE - 4, '12:00', '12:55', 'Salle B', 'terminee'),
-- Cette semaine
(1, CURRENT_DATE - 1, '08:00', '09:00', 'Salle A', 'terminee'),
(3, CURRENT_DATE - 1, '10:00', '11:00', 'Salle B', 'terminee'),
(6, CURRENT_DATE,     '17:00', '18:15', 'Salle A', 'prevue'),
(7, CURRENT_DATE,     '19:00', '19:45', 'Salle B', 'prevue'),
(4, CURRENT_DATE + 1, '07:00', '07:45', 'Salle C', 'prevue'),
(2, CURRENT_DATE + 2, '18:00', '19:00', 'Salle A', 'prevue'),
(8, CURRENT_DATE + 3, '09:00', '10:00', 'Salle C', 'prevue'),
(5, CURRENT_DATE + 4, '12:00', '12:55', 'Salle B', 'prevue'),
(1, CURRENT_DATE + 5, '08:00', '09:00', 'Salle A', 'prevue'),
(3, CURRENT_DATE + 6, '10:00', '11:00', 'Salle B', 'prevue');

-- ============================================================
-- SOUSCRIPTIONS
-- ============================================================
INSERT INTO souscription (id_membre, id_abonnement, date_debut, date_fin, statut) VALUES
(1,  3, '2024-01-01', '2024-01-31', 'expiree'),
(1,  3, '2026-01-01', '2026-12-31', 'active'),
(2,  2, '2026-05-15', '2026-06-15', 'active'),
(3,  6, '2026-03-01', '2027-03-01', 'active'),
(4,  1, '2024-01-01', '2024-01-31', 'resiliee'),
(5,  4, '2024-01-01', '2024-04-01', 'expiree'),
(5,  3, '2026-04-01', '2027-04-01', 'active'),
(6,  5, '2026-01-01', '2027-01-01', 'active'),
(7,  2, '2024-05-01', '2024-05-31', 'resiliee'),
(8,  3, '2026-06-01', '2027-06-01', 'active'),
(9,  6, '2026-04-01', '2027-04-01', 'active'),
(10, 2, '2026-05-01', '2026-05-31', 'active'),
(11, 4, '2026-04-01', '2026-07-01', 'active'),
(12, 3, '2026-05-05', '2026-06-05', 'active');

-- ============================================================
-- RÉSERVATIONS
-- ============================================================
INSERT INTO reservation (id_membre, id_seance, date_reservation, statut) VALUES
-- Séances passées
(1,  1, CURRENT_TIMESTAMP - INTERVAL '7 days', 'confirmee'),
(2,  1, CURRENT_TIMESTAMP - INTERVAL '7 days', 'confirmee'),
(3,  2, CURRENT_TIMESTAMP - INTERVAL '7 days', 'confirmee'),
(5,  2, CURRENT_TIMESTAMP - INTERVAL '7 days', 'annulee'),
(6,  3, CURRENT_TIMESTAMP - INTERVAL '6 days', 'confirmee'),
(8,  4, CURRENT_TIMESTAMP - INTERVAL '5 days', 'confirmee'),
(9,  4, CURRENT_TIMESTAMP - INTERVAL '5 days', 'confirmee'),
(10, 5, CURRENT_TIMESTAMP - INTERVAL '4 days', 'confirmee'),
(1,  6, CURRENT_TIMESTAMP - INTERVAL '1 day',  'confirmee'),
(2,  7, CURRENT_TIMESTAMP - INTERVAL '1 day',  'confirmee'),
-- Séances à venir
(1,  8,  CURRENT_TIMESTAMP, 'confirmee'),
(3,  8,  CURRENT_TIMESTAMP, 'confirmee'),
(5,  8,  CURRENT_TIMESTAMP, 'confirmee'),
(2,  8,  CURRENT_TIMESTAMP, 'confirmee'),
(6,  8,  CURRENT_TIMESTAMP, 'confirmee'),
(8,  8,  CURRENT_TIMESTAMP, 'confirmee'),
(9,  8,  CURRENT_TIMESTAMP, 'confirmee'),
(10, 8,  CURRENT_TIMESTAMP, 'confirmee'),
(11, 8,  CURRENT_TIMESTAMP, 'confirmee'),
(12, 8,  CURRENT_TIMESTAMP, 'confirmee'),
(8,  9,  CURRENT_TIMESTAMP, 'confirmee'),
(9,  9,  CURRENT_TIMESTAMP, 'confirmee'),
(2,  10, CURRENT_TIMESTAMP, 'confirmee'),
(6,  10, CURRENT_TIMESTAMP, 'en_attente'),
(10, 11, CURRENT_TIMESTAMP, 'confirmee'),
(11, 12, CURRENT_TIMESTAMP, 'confirmee'),
(12, 13, CURRENT_TIMESTAMP, 'confirmee'),
(1,  14, CURRENT_TIMESTAMP, 'confirmee'),
(5,  15, CURRENT_TIMESTAMP, 'confirmee');

-- ============================================================
-- PAIEMENTS
-- ============================================================
INSERT INTO paiement (id_membre, id_souscription, montant, date_paiement, moyen_paiement, statut) VALUES
(1,  1,  79.90, '2024-01-01', 'carte',    'valide'),
(1,  2,  79.90, '2026-01-01', 'carte',    'valide'),
(2,  3,  49.90, '2026-05-15', 'twint',    'valide'),
(3,  4,  24.90, '2026-03-01', 'carte',    'valide'),
(4,  5,  29.90, '2024-01-01', 'especes',  'rembourse'),
(5,  6,  199.90,'2024-01-01', 'virement', 'valide'),
(5,  7,  79.90, '2026-04-01', 'carte',    'valide'),
(6,  8,  699.90,'2026-01-01', 'virement', 'valide'),
(7,  9,  49.90, '2024-05-01', 'carte',    'refuse'),
(8,  10, 79.90, '2026-06-01', 'twint',    'valide'),
(9,  11, 24.90, '2026-04-01', 'carte',    'valide'),
(10, 12, 49.90, '2026-05-01', 'carte',    'valide'),
(11, 13, 199.90,'2026-04-01', 'virement', 'valide'),
(12, 14, 79.90, '2026-05-05', 'twint',    'valide');
