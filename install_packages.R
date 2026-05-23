# Run this script once to install all required packages
# install_packages.R

if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install(c(
  "DESeq2",
  "GEOquery",
  "clusterProfiler",
  "org.Hs.eg.db",
  "EnhancedVolcano"
), ask = FALSE)

install.packages(c(
  "pheatmap",
  "ggplot2",
  "dplyr",
  "RColorBrewer",
  "ggrepel",
  "tibble",
  "rmarkdown"
))

cat("All packages installed successfully!\n")
cat("Now run: rmarkdown::render('analysis.Rmd')\n")
