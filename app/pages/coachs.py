import streamlit as st
import pandas as pd
import sys, os
 
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
from db import run_query
 
st.set_page_config(page_title="Coachs — MP Gym", layout="wide")
st.title("Coachs")
 
rows, cols = run_query("""
    SELECT co.nom, co.prenom, co.email, co.specialite,
           co.date_embauche, co.statut,
           COUNT(DISTINCT c.id_cours) AS nb_cours
    FROM Coach co
    LEFT JOIN Cours c ON co.id_coach = c.id_coach
    GROUP BY co.id_coach, co.nom, co.prenom, co.email,
             co.specialite, co.date_embauche, co.statut
    ORDER BY co.nom
""")
st.dataframe(pd.DataFrame(rows, columns=cols), use_container_width=True)