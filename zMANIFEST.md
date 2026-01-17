# MANIFEST:

## 📜 STATUTORY DECREE: THE JACKSONVILLE ECONOMIC FRAMEWORK CONSTITUTION
Version: 1.1 (Leveling Document)

Status: PROVISIONAL - AWAITING RATIFICATION

Scope: Universal Metropolitan Statistical Area (MSA) Scalability and Data Goverence

### 🏛️ ARTICLE I: THE MISSION & CORE DIRECTIVES

Section 1.01: Primary Objective: The framework shall exist to answer one narrow question better than any extant alternative: "What is the real economic stress on households right now?" 




Section 1.02: Narrative Supremacy: The end product is not a "toy dashboard" but an "Economic Intelligence Console" where agent narratives explain results like a human economist.


Section 1.03: The Scalability Mandate:

Geographic Agnosticism: All code must be engineered for universal portability.

Prohibition of Hardcoding: Hardcoding specific city names or FIPS codes in core logic is a Manifest Violation.

Variable Injection: All geography must be passed as variables (e.g., TARGET_MSA) at the script header.

### 📂 ARTICLE II: FILE SYSTEM & NAMING CONVENTION
Section 2.01: Directory Structure:

/scripts: All executable logic and pipeline files.

/docs: Constitutions, Manifesto, and Data Dictionaries.

/modules: Specialized factor sub-folders (e.g., /census, /housing).

Section 2.02: Numerical Execution Order: All files must follow a strict numerical prefix to ensure reproducibility:

00_infra_: Infrastructure, DB connections, and .Renviron audits.

01_ingest_: Raw data acquisition (Bronze Tier).

02_trans_: Data cleaning, joins, and deterministic math (Silver Tier).

03_agent_: Memory retrieval and narrative generation (Gold Tier).

04_ui_: R Shiny interface deployment.

Section 2.03: Case Standard: All filenames and SQL column headers must be lowercase_snake_case.

### 🛢️ ARTICLE III: DATA ARCHITECTURE (THE MEDALLION PROTOCOL)

Section 3.01: Tier 1 (Bronze/Raw): Untouched API output from FRED, Census/ACS, or BLS.


Mandatory Columns: inserted_at (UTC timestamp) and data_source_url.


Section 3.02: Tier 2 (Silver/Metrics): The "Calculated Layer" for metrics like Rent-to-Income or Inflation-adjusted wages.


Section 3.03: Tier 3 (Gold/Synthesis): Highly compressed, normalized tables (0-100 scale) optimized for the Shiny UI.

Section 3.04: Time-Series Governance: Every record must include a data_vintage column (the period measured) and a pull_date (the record creation date).

### ⚖️ ARTICLE IV: EQUALIZATION & QUALITY ASSURANCE (QA)
Section 4.01: County Equalization: Because Duval's population dwarfs Nassau's, all "Stress Scores" must be population-weighted to prevent the urban core from masking outlying counties.


Section 4.02: The Definition of Done (DoD): A factor is only "Done" when:

Data is successfully written to PostgreSQL.

An R script has verified that critical values (e.g., med_rent) are not null or zero.

The primary agent has generated a 200-word plain-English summary of the trend.


### 🔐 ARTICLE V: SECURITY & AUDIT STANDARDS
Section 5.01: The Secret Vault: No API keys or Database passwords shall be written in code; they are accessed strictly via Sys.getenv() from .Renviron.

Section 5.02: Version Control Guardrails: The .gitignore must explicitly block .Renviron, .env, and .Rproj.user.

Section 5.03: Traceability: Every table must have a source_agent_id to identify which script version last modified the data.

### 📈 ARTICLE VI: PHASING & PRODUCT ORDER

Section 6.01: Phase 1 (Foundation): Establish the automated pipeline for "Household Stress".



Section 6.02: Phase 2 (Agentic Depth): Integrate specialized agents like "Skeptical Economist" to challenge assumptions.



Section 6.03: Phase 3 (Synthesis): Deployment of the full Shiny dashboard with map integration and agent narratives.



