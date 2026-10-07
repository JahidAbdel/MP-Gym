import streamlit as st
 
st.set_page_config(page_title="MP Gym", layout="wide")
 
st.title("MP Gym — Système de gestion")
st.markdown("---")
 
col1, col2, col3, col4 = st.columns(4)
 
with col1:
    st.info("**Membres**\nInscription et gestion des membres")
with col2:
    st.info("**Cours & Séances**\nRéservation et planning")
with col3:
    st.info("**Coachs**\nGestion des coachs")
with col4:
    st.info("**Paiements**\nSuivi des paiements")
 
st.markdown("---")
st.caption("Utilisez le menu à gauche pour naviguer entre les pages.")