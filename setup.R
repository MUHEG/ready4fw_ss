# Manual step: Create Data and Data > CSVs directories and add authors and institutes csvs
# if(!dir.exists("Output"))
#   dir.create("Output")
library(ready4)
library(ready4show)
library(bookdown)
library(rticles)
X <- Ready4showSynopsis(#background_1L_chr = "Our study is entirely fictional.",
                        coi_1L_chr = "None declared.",
                        #conclusion_1L_chr = "These fake results are not interesting.",
                        digits_int = 3L,
                        #ethics_1L_chr = "The study was reviewed and granted approval by Awesome University's Human Research Ethics Committee (1111111.1).",
                        funding_1L_chr = "The study was funded by Orygen, VicHealth and Victoria University.",
                        #interval_chr = "three months",
                        keywords_chr = c("open source models","health economics","mental disorders"),
                        outp_formats_chr = "PDF",
                        #sample_desc_1L_chr = "The study sample is fake data that pretends to be young people aged 12 to 25 years who attended Australian primary care services for mental health related needs between November 2019 to August 2020.",
                        title_1L_chr = "A framework for implementing open source models of the systems shaping mental health outcomes in young people")
X <- renewSlot(X,
               "authors_r3", 
               {
                 read.csv("Data/CSVs/Authors.csv") %>% 
                     tibble::as_tibble() %>%
                     ready4show_authors()
               }
               ) 
X <- renewSlot(X,
               "institutes_r3",
               {
                 read.csv("Data/CSVs/Institutes.csv") %>%
                     tibble::as_tibble() %>%
                     ready4show_institutes()

               }) 
X <- renewSlot(X,
               "a_Ready4showPaths@outp_data_dir_1L_chr",
               new_val_xx = ".") #####
authorData(X)
# Pause for interactivity
# Make manual edits of Markdown files
authorReport(X)
# Pause for interactivity
# renewSlot(X,
#           "outp_formats_chr",
#           new_val_xx = "Word") %>%
#   authorReport()