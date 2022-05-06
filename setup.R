# Manual step: Create Data and Data > CSVs directories and add authors and institutes csvs
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
                        title_1L_chr = "A framework for developing open source economic models of mental health systems")
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
               new_val_xx = ".") 
X <- renewSlot(X,
               "abstract_args_ls",
               {
                 args_ls <- X@abstract_args_ls
                 args_ls$abstract_ls <- list(Summary = "There is strong in principle support for open source health economic models, but practical barriers limit their availability. We propose a set of principles and standards for the implementation of open source health economic models that are TIMELY - Transparent, Iterative, Modular, Epitomised and Yielding. We then describe a software framework that we have developed for developing TIMELY models in youth mental health and illustrate this framework with an open source utility mapping project. ",
                                             # Objectives = "We aimed to develop a conceptual and technical framework for implementing open source mental health systems models and illustrate how it can be applicatied to economic topics in youth mental health.",
                                             # Methods = "We created a software development kit in R to support standardised implementation of mental health systems models. As a worked example, we applied the toolkit to develop open source youth mental health utility mapping models, which we assessed against five principles using 17 standards.",
                                             # Results = "Six R packages and a coding style dataset provide a toolkit for implementing mental health models that are TIMELY - Transparent, Iterative, Modular, Epitomised, Licensed and Yielding. The utility mapping models we developed with this toolkit fully met X and partially met Y TIMELY standards.", 
                                             # Conclusion = "Please fund me",
                                             Data = "Data")
                 args_ls
                 }
               )
# authorData(X) # Update ready4show so that default is to not overwrite Child_RMDs / only overwrite header and abstract
# Pause for interactivity
# Make manual edits of Markdown files
authorReport(X)
# Pause for interactivity
