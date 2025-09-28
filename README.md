# Categorization of Samples (GSE104235) Based on Gene Expression Profiles

## Project Overview
This project focuses on the **categorization of samples** from the **GSE104235 gene expression dataset** based on their gene expression profiles. Using computational and statistical approaches, the project aims to identify patterns and groupings among the samples, helping to uncover potential biological insights.

---

## Project Structure
project/
│── code/ # Scripts for data processing, analysis, and visualization
│── results/ # Processed results including differentially expressed genes
│── plots/ # Visualizations such as volcano plots, MA plots, and clustering figures
│── README.md # Project description and instructions


---

## Data
- **Dataset:** GSE104235 (Gene Expression Omnibus)  
- **Type:** Gene expression profiling data  
- **Source:** GEO database ([GSE104235](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE104235))

---

## Methods
1. **Data Preprocessing**
   - Cleaned raw expression data
   - Handled missing values
   - Normalized gene expression values

2. **Differential Expression Analysis**
   - Identified differentially expressed genes (DEGs) between sample groups
   - Generated **volcano plots** and **MA plots** for visualization

3. **Clustering and Categorization**
   - Grouped samples based on gene expression profiles
   - Applied unsupervised clustering techniques
   - Evaluated patterns and similarities among samples

4. **Visualization**
   - Created plots to represent gene expression differences and sample clustering
   - Saved all figures in the `plots/` folder

---

## Folder Descriptions
- `code/` : Contains all scripts used for data preprocessing, analysis, and visualization
- `results/` : Contains output files such as DEGs, statistical summaries, and processed data
- `plots/` : Contains all graphical outputs like volcano plots, MA plots, and clustering figures

---

## How to Run
1. Clone the repository:
```bash
git clone https://github.com/<your-username>/Minor-Project-GSE104235.git
cd Minor-Project-GSE104235


Install required packages (example for R or Python):

# R example
install.packages(c("DESeq2", "ggplot2", "pheatmap", "Biobase"))

# Python example
pip install pandas numpy matplotlib seaborn scikit-learn


Run the scripts in code/ to reproduce analysis and plots.

Key Findings

Successfully categorized samples based on gene expression profiles.

Identified differentially expressed genes between key sample groups.

Generated visualizations (volcano plots, MA plots, clustering heatmaps) that summarize sample patterns.
