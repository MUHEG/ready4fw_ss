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
                        title_1L_chr = "A framework for implementing open source economic models of the systems shaping mental health outcomes in young people")
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
                 args_ls$abstract_ls <- list(Background = "Open source approaches have the scope to improve the transparency, quality and decision utility of health economic models of mental health systems. ",
                                             Objectives = "We aimed to develop a conceptual and technical framework for implementing open source mental health systems models and illustrate how it can be applicatied to economic topics in youth mental health.",
                                             Methods = "We created a software development kit in R to support standardised implementation of open source computational models. We applied this toolkit to developing open source models to map youth mental health measures to health utility, which we assessed against five principles using 17 standards.",
                                             Results = "Six R packages and a coding style dataset provide a toolkit for implementing mental health models that TIMELY - Transparent, Iterative, Modular, Epitomised, Licensed and Yielding. We used this toolkit to develop utility mapping models that fully met X and partially met Y TIMELY standards.", 
                                             Conclusion = "Please fund me",
                                             Data = "Data")
                 args_ls
                 }
               )
authorData(X)
# Pause for interactivity
# Make manual edits of Markdown files
authorReport(X)
# Pause for interactivity
