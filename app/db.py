import psycopg2
import streamlit as st
 
 
@st.cache_resource
def get_connection():
    return psycopg2.connect(
        host="localhost",
        database="mp_gym",
        user=st.secrets["psql_user"],
        password=st.secrets["db_password"]
    )
 
 
def run_query(query, params=None):
    conn = get_connection()
    cur = conn.cursor()
    cur.execute(query, params)
    return cur.fetchall(), [desc[0] for desc in cur.description]
 
 
def run_insert(query, params=None):
    conn = get_connection()
    cur = conn.cursor()
    cur.execute(query, params)
    conn.commit()