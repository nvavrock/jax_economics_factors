#Invest America Map

# 🗺️ Project: Mapping Qualifying ZIP Codes for the Dell Gift

[cite_start]This project aims to create an interactive map visualization to highlight U.S. ZIP Codes eligible for the Michael and Susan Dell $250 contribution to "Trump Accounts" (Invest America Act)[cite: 2, 3].

---

## 🎯 Project Goal

[cite_start]The primary goal is to **visually represent the geographic distribution** of eligible ZIP Codes across the United States based on the official income criteria[cite: 11]. This helps parents and analysts quickly identify qualifying areas.



---

## 📝 Eligibility Criteria Summary

The map's underlying data must be filtered based on the official criteria for the Dell contribution:

* [cite_start]**Income Threshold (Map Focus):** A child's residence ZIP Code qualifies if its **median household (or family) income is \$150,000 or less**[cite: 8, 25, 28]. [cite_start]This cutoff was set to target middle- and lower-income communities[cite: 8].
* [cite_start]**Age/Cohort (Exclusion):** The child must be **age 10 or under (born before 2025)**[cite: 3, 9]. [cite_start]Children born in 2025-2028 are excluded because they receive the federal \$1,000 newborn deposit[cite: 9].

[cite_start]The Dell/InvestAmerica fact sheet suggests this criterion will cover approximately **75% of U.S. ZIP Codes**[cite: 4, 12].

---

## 💻 Required Data & Tools

[cite_start]Since an **official, downloadable list** of all qualifying ZIP Codes has **not yet been published**, the map must be built using publicly available demographic data[cite: 3, 5, 25].

| Component | Source/Tool | Purpose |
| :--- | :--- | :--- |
| **Source Data** | U.S. Census Bureau's **American Community Survey (ACS)** 5-year estimates | [cite_start]Provides **Median Household Income by ZCTA** (ZIP Code Tabulation Area), specifically ACS tables like S1901[cite: 15, 18, 19]. |
| **Geographic Data** | ZIP Code Tabulation Area (ZCTA) Shapefiles | Provides the geographic boundaries necessary to draw the ZIP Code regions on the map. |
| **Programming Language** | Python (Recommended) or JavaScript | For data processing and web map creation. |
| **Mapping Libraries** | **Python:** `pandas`, `geopandas`, `folium` (or `plotly/dash`) | To join the income data with the ZCTA shapes and generate an interactive HTML map. |

---

## 🗺️ Project Steps (Pipeline)

1.  [cite_start]**Data Acquisition:** Download the most recent ACS table (e.g., S1901) for Median Household Income by ZCTA[cite: 19].
2.  **Data Cleaning & Joining:** Ensure the income data is correctly joined to the geographic ZCTA shapefile data.
3.  [cite_start]**Filter and Flag:** Create a new binary field (e.g., `Eligible_Status`) in the dataset where the median income is $\le \$150,000$[cite: 25].
4.  **Map Creation:** Generate a **choropleth map** where ZCTAs are colored based on the `Eligible_Status` field (e.g., green for eligible, gray for not eligible).
5.  **Interactivity:** Implement tooltips so users can click or hover over a ZIP Code to see its **median income** and **eligibility status**. [cite_start]Parents can use sites like `data.census.gov` or `CensusReporter` in the meantime to estimate their ZIP's eligibility[cite: 15, 16, 26].

---

## ⚠️ Important Disclaimers

* [cite_start]**Unofficial Estimate:** This map is an **estimate** based on publicly available Census data and the criteria cited in press reports[cite: 15, 20]. [cite_start]It is **not** an official list from TrumpAccounts.gov, InvestAmerica, or the U.S. Treasury[cite: 5].
* [cite_start]**Official Confirmation:** **No official online tool is live yet** to check ZIP eligibility[cite: 14]. [cite_start]Parents must await the **official eligibility tool or list**, which is expected to be released closer to the account launch date (July 4, 2026)[cite: 6, 24, 27].

---

## 📣 Getting Started

To run this project, clone the repository and execute the main processing script.

```bash
git clone [YOUR_REPO_URL]
cd [project-folder]
pip install -r requirements.txt
python map_generator.py