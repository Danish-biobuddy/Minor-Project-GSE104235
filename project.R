

# Load your counts data and metadata
counts_data <- read.csv("GSE104235_expr_matrix.csv", row.names = 1)
meta_data <- read.csv("GSE104235_metadata.csv", row.names = 1)

# Ensure the column names in counts_data match the row names in meta_data
all(colnames(counts_data) %in% rownames(meta_data))
all(colnames(counts_data) == rownames(meta_data)) # Check if they are in the same order

#ensure the value in counts_data shoulb be integers , not in decimal.
# Create the DESeqDataSet object
dds <- DESeqDataSetFromMatrix(countData = counts_data,
                              colData = meta_data,
                              design = ~`developmental.stage.ch1`)


resultsNames(dds)

#By default, DESeq2 always compares each non-reference group vs. the reference.
#Since "middle aged adult" is the first level, it is taken as reference automatically.

res_older <- results(dds1, name = "developmental.stage.ch1_older.adult_vs_middle.aged.adult")
summary(res_older)

res_young <- results(dds1, name = "developmental.stage.ch1_young.adult_vs_middle.aged.adult")
summary(res_young)

res_older_vs_young <- results(dds1, contrast = c("developmental.stage.ch1", "older adult", "young adult"))
summary(res_older_vs_young)

'''Interpretation:

Positive LFC = up in older adults

Negative LFC = down in older adults'''

#Order results by adjusted p-value

res_older <- res_older[order(res_older$padj), ]
res_young <- res_young[order(res_young$padj), ]
res_older_vs_young <- res_older_vs_young[order(res_older_vs_young$padj), ]

#Keep only significant genes (padj < 0.05):

sig_older <- subset(res_older, padj < 0.05)
sig_young <- subset(res_young, padj < 0.05)
sig_older_vs_young <- subset(res_older_vs_young, padj < 0.05)

# all results
write.csv(as.data.frame(res_older), "DEG_older_vs_middle.csv")
write.csv(as.data.frame(res_young), "DEG_young_vs_middle.csv")
write.csv(as.data.frame(res_older_vs_young), "DEG_older_vs_young.csv")

# only significant results (padj < 0.05)
write.csv(as.data.frame(sig_older), "DEG_older_vs_middle_sig.csv")
write.csv(as.data.frame(sig_young), "DEG_young_vs_middle_sig.csv")
write.csv(as.data.frame(sig_older_vs_young), "DEG_older_vs_young_sig.csv")
