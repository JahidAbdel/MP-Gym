import streamlit as st
import pandas as pd
import sys, os
 
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
from db import run_query
 
st.set_page_config(page_title="Paiements — MP Gym", layout="wide")
st.title("Paiements")
 
rows, cols = run_query("""
    SELECT p.id_paiement, m.nom || ' ' || m.prenom AS membre,
           a.nom_abonnement, p.montant, p.date_paiement,
           p.moyen_paiement, p.statut
    FROM Paiement p
    JOIN Membre m ON p.id_membre = m.id_membre
    LEFT JOIN Souscription s ON p.id_souscription = s.id_souscription
    LEFT JOIN Abonnement a ON s.id_abonnement = a.id_abonnement
    ORDER BY p.date_paiement DESC
""")
st.dataframe(pd.DataFrame(rows, columns=cols), use_container_width=True)