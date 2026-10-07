import streamlit as st
import pandas as pd
import sys, os
 
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
from db import run_query
 
st.set_page_config(page_title="Membres — MP Gym", layout="wide")
st.title("Membres")
 
rows, cols = run_query("""
    SELECT m.id_membre, m.nom, m.prenom, m.email,
           m.telephone, m.date_inscription, m.statut
    FROM Membre m
    ORDER BY m.nom
""")
st.dataframe(pd.DataFrame(rows, columns=cols), use_container_width=True)