# 📊 PostgreSQL Database Project Plan: US Demographic Data

## 🎯 Project Goal
To create a PostgreSQL database to store and track population data, starting with age brackets and city counts for all 50 U.S. states.

## 🏛️ Credible Data Source: U.S. Census Bureau API

The **U.S. Census Bureau** is the primary, credible source for this data. It offers an **API (Application Programming Interface)** for programmatically accessing and updating the datasets.

### API Access Requirements
* **API Key:** You must register for a free API key on the Census Bureau Developer website. This key is required for all data calls.
* **Update Frequency:** Data is generally updated on an **annual** basis (Population Estimates Program - PEP and American Community Survey - ACS 1-Year Estimates). A monthly update for age-bracket breakdowns will be challenging to source from a single government API.

### Relevant Datasets
1.  **Population by Age Bracket and State:**
    * **Dataset Focus:** Population Estimates Program (PEP) or American Community Survey (ACS) 1-Year Estimates.
    * **Example Variable Types:** Variables will be codes representing specific age groups (e.g., population under 5 years, population 65 years and over).
2.  **City Counts (Places):**
    * **Dataset Focus:** Population Estimates Program (PEP) for Incorporated Places and Minor Civil Divisions.
    * **Variable:** Population variable (e.g., `POP`).
    * **Geography:** `place:*` within `state:*`.

---

## 🏗️ PostgreSQL Database Design

The database will begin with two main tables:

### 1. State Age Population (`state_age_pop`)

This table stores estimated population counts for specific age brackets within each state.

| Column Name | Data Type | Description |
| :--- | :--- | :--- |
| **id** | `SERIAL PRIMARY KEY` | Unique identifier. |
| **state_fips** | `CHAR(2)` | State FIPS code (e.g., '01'). Crucial for geographic joining. |
| **state_name** | `VARCHAR(50)` | Full name of the state. |
| **age_group** | `VARCHAR(20)` | The specific age bracket (e.g., '0-4', '65+'). |
| **population** | `INT` | The estimated population count for that age group. |
| **data_vintage** | `INT` | The year the estimate is for (e.g., 2024). |

#### Example SQL for Table Creation:
```sql
CREATE TABLE state_age_pop (
    id SERIAL PRIMARY KEY,
    state_fips CHAR(2) NOT NULL,
    state_name VARCHAR(50) NOT NULL,
    age_group VARCHAR(20) NOT NULL,
    population INT NOT NULL,
    data_vintage INT NOT NULL,
    UNIQUE (state_fips, age_group, data_vintage)
);

### 2. City Population (`city_pop`)

This table stores the total population count for each city or place.

| Column Name | Data Type | Description |
| :--- | :--- | :--- |
| **id** | `SERIAL PRIMARY KEY` | Unique identifier. |
| **state_fips** | `CHAR(2)` | State FIPS code. |
| **place_fips** | `CHAR(5)` | Place FIPS code (Unique city identifier). |
| **city_name** | `VARCHAR(100)` | Name of the city/place. |
| **population** | `INT` | The estimated total population count. |
| **data_vintage** | `INT` | The year the estimate is for (e.g., 2024). |

#### Example SQL for Table Creation:
```sql
CREATE TABLE city_pop (
    id SERIAL PRIMARY KEY,
    state_fips CHAR(2) NOT NULL,
    place_fips CHAR(5) NOT NULL,
    city_name VARCHAR(100) NOT NULL,
    population INT NOT NULL,
    data_vintage INT NOT NULL,
    UNIQUE (state_fips, place_fips, data_vintage
    );