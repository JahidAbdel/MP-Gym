import os
import sys

import pandas as pd
import streamlit as st

sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
from db import run_query


st.set_page_config(page_title="Requetes SQL - MP Gym", layout="wide")
st.title("Requetes SQL")

REQUETES = {
    "1. Seances completes": """
        SELECT s.id_seance, c.nom_cours, s.date_seance, s.heure_debut, s.heure_fin, s.salle,
               co.nom AS nom_coach, co.prenom AS prenom_coach
        FROM Seance s
        JOIN Cours c ON s.id_cours = c.id_cours
        JOIN Coach co ON c.id_coach = co.id_coach
        JOIN Reservation r ON s.id_seance = r.id_seance
        WHERE r.statut = 'confirmee'
        GROUP BY s.id_seance, c.nom_cours, s.date_seance, s.heure_debut, s.heure_fin,
                 s.salle, co.nom, co.prenom, c.capacite_max
        HAVING COUNT(r.id_reservation) >= c.capacite_max
    """,
    "2. Chiffre d'affaires total par mois": """
        SELECT DATE_TRUNC('month', date_paiement) AS mois,
               SUM(montant) AS chiffre_affaires_mensuel
        FROM Paiement
        WHERE statut = 'valide'
        GROUP BY DATE_TRUNC('month', date_paiement)
        ORDER BY mois
    """,
    "3. Membres avec abonnement actif": """
        SELECT m.nom, m.prenom, m.email, a.nom_abonnement, s.date_debut, s.date_fin
        FROM Membre m
        JOIN Souscription s ON m.id_membre = s.id_membre
        JOIN Abonnement a ON s.id_abonnement = a.id_abonnement
        WHERE s.statut = 'active'
        ORDER BY m.nom
    """,
    "4. Nombre de reservations par cours": """
        SELECT c.nom_cours, COUNT(r.id_reservation) AS nb_reservations
        FROM Cours c
        JOIN Seance s ON c.id_cours = s.id_cours
        JOIN Reservation r ON s.id_seance = r.id_seance
        WHERE r.statut = 'confirmee'
        GROUP BY c.nom_cours
        ORDER BY nb_reservations DESC
    """,
    "5. Membres sans reservation": """
        SELECT m.nom, m.prenom, m.email
        FROM Membre m
        LEFT JOIN Reservation r ON m.id_membre = r.id_membre
        WHERE r.id_reservation IS NULL
        ORDER BY m.nom
    """,
    "6. Taux de remplissage des seances a venir": """
        SELECT s.id_seance, c.nom_cours, s.date_seance, s.heure_debut,
               COUNT(r.id_reservation) AS places_prises,
               c.capacite_max,
               ROUND(COUNT(r.id_reservation) * 100.0 / c.capacite_max, 1) AS taux_remplissage
        FROM Seance s
        JOIN Cours c ON s.id_cours = c.id_cours
        LEFT JOIN Reservation r ON s.id_seance = r.id_seance AND r.statut = 'confirmee'
        WHERE s.statut = 'prevue'
        GROUP BY s.id_seance, c.nom_cours, s.date_seance, s.heure_debut, c.capacite_max
        ORDER BY s.date_seance
    """,
    "7. Revenus par type d'abonnement": """
        SELECT a.nom_abonnement,
               COUNT(p.id_paiement) AS nb_paiements,
               SUM(p.montant) AS revenu_total
        FROM Abonnement a
        JOIN Souscription s ON a.id_abonnement = s.id_abonnement
        JOIN Paiement p ON s.id_souscription = p.id_souscription
        WHERE p.statut = 'valide'
        GROUP BY a.nom_abonnement
        ORDER BY revenu_total DESC
    """,
    "8. Nombre de seances animees par coach": """
        SELECT co.nom, co.prenom, co.specialite,
               COUNT(s.id_seance) AS nb_seances
        FROM Coach co
        JOIN Cours c ON co.id_coach = c.id_coach
        JOIN Seance s ON c.id_cours = s.id_cours
        WHERE s.statut = 'terminee'
        GROUP BY co.id_coach, co.nom, co.prenom, co.specialite
        ORDER BY nb_seances DESC
    """,
    "9. Abonnements expirant dans les 30 prochains jours": """
        SELECT m.nom, m.prenom, m.email, a.nom_abonnement, s.date_fin
        FROM Membre m
        JOIN Souscription s ON m.id_membre = s.id_membre
        JOIN Abonnement a ON s.id_abonnement = a.id_abonnement
        WHERE s.statut = 'active'
          AND s.date_fin BETWEEN CURRENT_DATE AND CURRENT_DATE + INTERVAL '30 days'
        ORDER BY s.date_fin
    """,
    "10. Top 3 des membres les plus actifs": """
        SELECT m.nom, m.prenom, COUNT(r.id_reservation) AS nb_reservations
        FROM Membre m
        JOIN Reservation r ON m.id_membre = r.id_membre
        WHERE r.statut = 'confirmee'
        GROUP BY m.id_membre, m.nom, m.prenom
        ORDER BY nb_reservations DESC
        LIMIT 3
    """,
}


choix = st.selectbox("Choisir une requete", list(REQUETES.keys()))

with st.expander("Afficher le SQL"):
    st.code(REQUETES[choix].strip(), language="sql")

rows, cols = run_query(REQUETES[choix])
st.dataframe(pd.DataFrame(rows, columns=cols), use_container_width=True)
