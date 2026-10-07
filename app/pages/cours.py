import streamlit as st
import pandas as pd
import sys, os
 
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
from db import run_query
 
st.set_page_config(page_title="Cours & Séances — MP Gym", layout="wide")
st.title("Séances à venir")
 
rows, cols = run_query("""
    SELECT c.nom_cours, s.date_seance, s.heure_debut, s.heure_fin,
           s.salle, co.nom || ' ' || co.prenom AS coach,
           c.capacite_max,
           COUNT(r.id_reservation) AS places_prises,
           c.capacite_max - COUNT(r.id_reservation) AS places_restantes
    FROM Seance s
    JOIN Cours c ON s.id_cours = c.id_cours
    JOIN Coach co ON c.id_coach = co.id_coach
    LEFT JOIN Reservation r ON s.id_seance = r.id_seance AND r.statut = 'confirmee'
    WHERE s.statut = 'prevue' AND s.date_seance >= CURRENT_DATE
    GROUP BY c.nom_cours, s.date_seance, s.heure_debut, s.heure_fin,
             s.salle, co.nom, co.prenom, c.capacite_max
    ORDER BY s.date_seance, s.heure_debut
""")
st.dataframe(pd.DataFrame(rows, columns=cols), use_container_width=True)