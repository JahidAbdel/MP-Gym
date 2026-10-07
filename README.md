# MP Gym — Groupe 16
**Abdel Jahid, William Bassolé, Bryan Pascal**

Application de gestion d'une salle de sport : membres, abonnements, coachs, cours et paiements.

---

## Prérequis

- Python 3.10+
- PostgreSQL installé et en cours d'exécution
- `pip` pour installer les dépendances Python

---

## Installation depuis le terminal

### 1. Cloner le repo

```bash
git clone https://github.com/JahidAbdel/MP-Gym.git
cd MP-Gym
```


### 2. Créer un environnement virtuel

**MacOs:**
```bash
python3 -m venv .venv
source .venv/bin/activate
```
**Windows (Powershell):**
```bash
python3 -m venv .venv
.\.venv\Scripts\activate
```


### 3. Installer les dépendances Python

```bash
pip install -r requirements.txt
```


### 4. Configurer le mot de passe

Créer le fichier `.streamlit/secrets.toml` et mettez dans le fichier votre utilisateur et mot de passe:

```toml
psql_user = "votre_user_postgres"
db_password = "votre_mdp_postgres"
```


### 5. Créer la base de données

```bash
psql -U <votre_utilisateur> -d postgres -c "CREATE DATABASE mp_gym;"
psql -U <votre_utilisateur> -d mp_gym -f sql/schema.sql
psql -U <votre_utilisateur> -d mp_gym -f sql/insert_data.sql
```

---

## Lancement

```bash
streamlit run app/main.py
```

L'application contient une page **Requetes SQL** permettant d'executer les 10 requetes d'interrogation demandees dans les consignes du projet.

Les fichiers SQL principaux sont:

- `sql/schema.sql` : creation des tables, cles et contraintes;
- `sql/insert_data.sql` : insertion des donnees de test;
- `sql/queries.sql` : liste des 10 requetes SQL non triviales.
