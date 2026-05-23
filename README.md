# 📊 RNA-seq Differential Expression Analysis
### COVID-19 vs Healthy Lung Tissue — Using DESeq2 in R

This project performs a complete RNA-seq analysis pipeline comparing gene expression in **SARS-CoV-2 infected** vs **healthy lung cells** — producing publication-quality volcano plots, heatmaps, and PCA plots.

---

## 🤔 What Is RNA-seq Analysis?

When a cell is infected by a virus, it changes which genes it switches on and off.
RNA-seq lets us measure all those changes at once — across thousands of genes simultaneously.

This pipeline answers:
> **"Which human genes become activated or silenced during COVID-19 infection?"**

**Dataset:** [GSE147507](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE147507) — published in *Cell*, 2020  
**Method:** DESeq2 — the gold standard tool for RNA-seq differential expression

---

## 📈 What Figures This Produces

### 1. Volcano Plot
Shows every gene as a dot. Genes that are strongly up/downregulated pop out in red/blue.

### 2. Heatmap
Shows the top 50 differentially expressed genes across all samples — clustered by expression pattern.

### 3. PCA Plot
Shows whether samples cluster correctly by condition — a quality control check before any analysis.

---

## ✅ What You Need First

1. **R** (version 4.2 or higher) → [Download from cran.r-project.org](https://cran.r-project.org/)
2. **RStudio** → [Download from posit.co](https://posit.co/download/rstudio-desktop/)
3. **Internet connection** — to download R packages (first time only)

> 💡 **R** is the programming language. **RStudio** is the app you use to write and run R code.  
> Install R first, then RStudio.

---

## 📥 Step-by-Step Installation

### Step 1 — Download this project

**Option A:**  
Click green **Code** button → **Download ZIP** → unzip it

**Option B (using Git):**
```bash
git clone https://github.com/YOUR_USERNAME/rnaseq-covid19-deseq2.git
cd rnaseq-covid19-deseq2
```

---

### Step 2 — Open the project in RStudio

1. Open RStudio
2. Go to **File → Open Project** (or **File → Open File**)
3. Navigate to the `rnaseq-covid19-deseq2` folder
4. Open `analysis.Rmd`

---

### Step 3 — Install all required packages (ONE TIME ONLY)

In the RStudio **Console** panel (bottom left), paste this and press Enter:

```r
source("install_packages.R")
```

> ⏳ This will take **5–15 minutes** the first time — it's downloading Bioconductor packages.  
> You'll see a lot of text scrolling — that's normal!  
> You only need to do this ONCE.

---

### Step 4 — Create output folders

In the RStudio Console, run:

```r
dir.create("figures")
dir.create("results")
```

---

## ▶️ Running the Analysis

### Option A: Click Knit (easiest!)

At the top of the `analysis.Rmd` file, click the **Knit** button (blue yarn icon).

This will:
- Run the entire pipeline automatically
- Save all figures to the `figures/` folder
- Save result tables to `results/`
- Open a beautiful HTML report in your browser

---

### Option B: Run in the Console

```r
rmarkdown::render("analysis.Rmd")
```

---

### Option C: Run step by step

Click inside any grey code block in `analysis.Rmd` and press **Ctrl+Shift+Enter** to run just that section.  
This is great for learning what each step does.

---

## 📂 File Structure

```
rnaseq-covid19-deseq2/
│
├── analysis.Rmd          ← MAIN FILE — open this in RStudio and Knit it
├── install_packages.R    ← Run this ONCE to install all packages
├── figures/              ← Your plots will appear here after running
│   ├── volcano_plot.png
│   ├── heatmap_top50.png
│   └── pca_plot.png
├── results/              ← Your result tables (CSV) appear here
│   ├── all_DE_results.csv
│   └── significant_DE_genes.csv
└── README.md             ← This guide
```

---

## ❓ Common Problems & Fixes

| Problem | What to do |
|---|---|
| `there is no package called 'DESeq2'` | Run `source("install_packages.R")` in Console |
| `Knit` button is greyed out | Make sure you opened the `.Rmd` file, not a `.R` file |
| Figures not appearing | Make sure you created the `figures/` folder (Step 4 above) |
| Error about BiocManager | Run `install.packages("BiocManager")` first |
| RStudio crashes during install | Restart RStudio and try again — large Bioconductor installs sometimes need a retry |
| `could not find function "ggplot"` | Run `install.packages("ggplot2")` |

---

## 🧬 Biological Background (Why This Matters)

- **DESeq2** models RNA-seq count data using a Negative Binomial distribution — it accounts for the natural variability between biological replicates, which a simple fold-change does not.
- **Volcano plots** combine statistical significance (-log10 p-value) with biological magnitude (log2 fold change) — letting you see *both* dimensions at once.
- **PCA** is used here as quality control: if samples cluster by condition (COVID vs healthy), your experiment worked. If they don't cluster, there may be a batch effect.
- This dataset comes from Blanco-Melo et al., *Cell* 2020 — a landmark paper showing SARS-CoV-2 causes an imbalanced immune response unique among respiratory viruses.

---

## 📖 Key Reference

Blanco-Melo D et al. *Imbalanced Host Response to SARS-CoV-2 Drives Development of COVID-19.* Cell, 181(5):1036–1045, 2020.

---

## 🛠️ Built With

- R 4.2+
- [DESeq2](https://bioconductor.org/packages/DESeq2/) — differential expression
- [ggplot2](https://ggplot2.tidyverse.org/) — volcano plot and PCA
- [pheatmap](https://cran.r-project.org/package=pheatmap) — heatmap
- [GEOquery](https://bioconductor.org/packages/GEOquery/) — data download from NCBI GEO

---

**Author:** [Your Name] | BSc Bioinformatics, [Your University], Peshawar, Pakistan
