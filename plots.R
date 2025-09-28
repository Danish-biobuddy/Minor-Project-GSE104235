# ================================
# R script: volcano_ma_plots.R
# ================================

# Load required libraries
library(ggplot2)

# --- Function to create Volcano Plot ---
make_volcano <- function(data, comp_name, outdir="plots") {
  if(!dir.exists(outdir)) dir.create(outdir)
  
  p <- ggplot(data, aes(x = log2FoldChange, y = -log10(pvalue))) +
    geom_point(aes(color = padj < 0.05 & abs(log2FoldChange) > 1), alpha = 0.6) +
    scale_color_manual(values = c("gray", "red")) +
    theme_minimal() +
    labs(title = paste("Volcano Plot -", comp_name),
         x = "log2 Fold Change",
         y = "-log10(p-value)") +
    theme(plot.title = element_text(hjust = 0.5))
  
  ggsave(filename = file.path(outdir, paste0("Volcano_", comp_name, ".png")), plot = p, width = 6, height = 5)
  ggsave(filename = file.path(outdir, paste0("Volcano_", comp_name, ".pdf")), plot = p, width = 6, height = 5)
}

# --- Function to create MA Plot ---
make_ma <- function(data, comp_name, outdir="plots") {
  if(!dir.exists(outdir)) dir.create(outdir)
  
  p <- ggplot(data, aes(x = baseMean, y = log2FoldChange)) +
    geom_point(aes(color = padj < 0.05), alpha = 0.6) +
    scale_x_log10() +
    scale_color_manual(values = c("gray", "blue")) +
    theme_minimal() +
    labs(title = paste("MA Plot -", comp_name),
         x = "Mean Expression (log10)",
         y = "log2 Fold Change") +
    theme(plot.title = element_text(hjust = 0.5))
  
  ggsave(filename = file.path(outdir, paste0("MA_", comp_name, ".png")), plot = p, width = 6, height = 5)
  ggsave(filename = file.path(outdir, paste0("MA_", comp_name, ".pdf")), plot = p, width = 6, height = 5)
}

# --- Main script ---
# Replace with your actual CSV file paths
files <- list(
  comp1 = "DEG_older_vs_middle_sig.csv",
  comp2 = "DEG_young_vs_middle_sig.csv",
  comp3 = "DEG_older_vs_young_sig.csv"
)

for (comp in names(files)) {
  cat("Processing:", comp, "\n")
  df <- read.csv(files[[comp]], header = TRUE)
  
  # Ensure required columns exist
  if(!all(c("log2FoldChange", "pvalue", "padj", "baseMean") %in% colnames(df))) {
    stop(paste("File", files[[comp]], "must contain columns: log2FoldChange, pvalue, padj, baseMean"))
  }
  
  make_volcano(df, comp)
  make_ma(df, comp)
}

cat("✅ All plots saved in 'plots/' folder\n")

# read results
res1 <- read.csv("DEG_older_vs_middle_sig.csv")

# remove NAs
res1 <- res1[!is.na(res1$padj), ]

# top 20 genes by padj
top_genes <- res1[order(res1$padj), ][1:20, ]

# save to CSV
write.csv(top_genes, "TopGenes.csv", row.names = FALSE)

# view in console
top_genes[, c("X", "log2FoldChange", "padj")]
