# ##### Presetting ######
# rm(list = ls()) # Clean variable
# memory.limit(150000)

# Load required libraries
if(!require("tidyverse")) install.packages("tidyverse"); library(tidyverse)
if(!require("Seurat")) install.packages("Seurat"); library(Seurat)


##### Load Dataset #####
  Count.mtx <- read.table("./Input_Dataset/GSE29087/GSE29087_L139_expression_tab.txt/GSE29087_L139_expression_tab.txt",
                          header = FALSE, sep = "\t", stringsAsFactors = FALSE, fill = TRUE) %>%
    dplyr::slice(-c(1:3, 5, 6)) %>%
    dplyr::select(-c(2:7)) %>%
    setNames(c("gene_id", colnames(.)[-1])) %>%
    column_to_rownames("gene_id") %>%
    t() %>%
    as.data.frame(stringsAsFactors = FALSE, row.names = 1)  %>%
    setNames(c("Cell_id", colnames(.)[-1])) %>%
    column_to_rownames("Cell_id") %>%
    t() %>%
    as.matrix()

  ## Trans Character to as.numeric
  Count.mtx_Temp <- apply(Count.mtx, 2, as.numeric)
  ## Add rownames
  rownames(Count.mtx_Temp) <- row.names(Count.mtx)
  Count.mtx <- Count.mtx_Temp %>% as.matrix()
  rm(Count.mtx_Temp)
  ## Check pipline
  # sum(Count.mtx == Count.mtxTTT)



