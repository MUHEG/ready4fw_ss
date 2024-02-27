# Manual step: Create Data and Data > CSVs directories and add authors and institutes csvs
library(ready4)
library(ready4show)
library(bookdown)
library(rticles)
X <- Ready4showSynopsis(#background_1L_chr = "Our study is entirely fictional.",
                        coi_1L_chr = "None declared.",
                        #conclusion_1L_chr = "We have identified criteria that can be used to systematically assess extent to which the computational implementation of health economic models adheres to the ethical goals of transparency, reusability and updatability. We have developed an open-source software framework that can support the ethical computational implementation of economic models in youth mental health. Our framework can be used as a prototype for developing future software frameworks to support ethical implementation of CHEMs.",
                        digits_int = 3L,
                        ethics_1L_chr = "Software framework development did not involve human subject research and was not ethically reviewed. The utility mapping modules were originally developed to implement a previously reported study that was reviewed and granted approval by the University of Melbourne’s Human Research Ethics Committee, and the local Human Ethics and Advisory Group (1645367.1).",
                        funding_1L_chr = "Software framework development was funded by Orygen, VicHealth, Victoria University and an Australian Government Research Training Program (RTP) Scholarship to Matthew Hamilton. The utility mapping study to which utility mapping modules were applied was funded by the National Health and Medical Research Council (NHMRC, APP1076940), Orygen and headspace.",
                        #interval_chr = "three months",
                        keywords_chr = c("adolescence", "computational models", "health economics", "mental disorders", "open-source models", "software frameworks"),
                        outp_formats_chr = "PDF",
                        #sample_desc_1L_chr = "The study sample is fake data that pretends to be young people aged 12 to 25 years who attended Australian primary care services for mental health related needs between November 2019 to August 2020.",
                        title_1L_chr = "A prototype software framework for transferable computational health economic models and its early application in youth mental health")
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
                 args_ls$abstract_ls <- list(Summary = "We are developing an economic model to explore multiple topics in Australian youth mental health policy. 
                                                        We want that model to be readily transferable to other jurisdictions.
                                                        We developed a software framework for authoring transparent, reusable and updatable Computational Health Economic Models (CHEMs) (the software files that implement health economic models).
                                                        We specified framework user requirements of a template CHEM module that facilitates modular model implementations, a simple programming syntax and tools for authoring new CHEM modules, supplying CHEMs with data, reporting reproducible CHEM analyses, searching for CHEM modules and maintaining a CHEM project website.
                                                        We implemented the framework as six development version code libraries in the programming language R that integrate with online services for software development and research data archiving. 
                                                        We used the framework to author five development version R libraries of CHEM modules focused on utility mapping in youth mental health. 
                                                        These modules provide tools for variable validation, dataset description, multi-attribute instrument scoring, construction of mapping models, reporting of mapping studies and making out of sample predictions.
                                                        We assessed these CHEM module libraries as mostly meeting transparency, reusability and updatability criteria that we have previously developed, but requiring more detailed documentation and unit testing of individual modules.
                                                        Our software framework has potential value as a prototype for future tools to support the development of transferable CHEMs.",
                                             
                                             # , we aim for it to meet six explicit transparency, reusability and updatability (TRU) criteria.
                                             # These criteria are: (T1) open access software files; (T2) easily identifiable developer contributions and judgments; (R1) programming practices promote selective reuse; (R2) permissions for derivative works; (U1) maintenance infrastructure; and (U2) systematic retesting and deprecation.
                                             # Objectives = "We aimed to develop a conceptual and technical framework for implementing open source mental health systems models and illustrate how it can be applicatied to economic topics in youth mental health.",
                                             # Methods = "We created a software development kit in R to support standardised implementation of mental health systems models. As a worked example, we applied the toolkit to develop open source youth mental health utility mapping models, which we assessed against five principles using 17 standards.",
                                             # Results = "Six R packages and a coding style dataset provide a toolkit for implementing mental health models that are TIMELY - Transparent, Iterative, Modular, Epitomising, Licensed and Yielding. The utility mapping models we developed with this toolkit fully met X and partially met Y TIMELY standards.", 
                                            #Conclusion = "",
                                             Code = "Visit https://www.ready4-dev.com for more information about how to find, install and apply the prototype software framework.")
                 args_ls
                 }
               )
X@tables_in_body_lgl <- T
X@figures_in_body_lgl <- T
#X@rmd_fl_nms_ls$PDF <- "TEST"#"Parent_PDF"
# authorData(X) # Update ready4show so that default is to not overwrite Child_RMDs / only overwrite header and abstract
# Pause for interactivity
# Make manual edits of Markdown files
#authorReport(X, consent_1L_chr = "Y") # For Preprint
params_ls <- list(X = X)
#params_ls$X@figures_in_body_lgl <- params_ls$X@tables_in_body_lgl <- F
rmarkdown::render(paste0("Markdown/Manuscript/Parent_",
                         "PDF",#
                         "/",
                         "Springer",#
                         ".Rmd"),
                  output_format = NULL,
                  params = params_ls,
                  output_file = "Submission.pdf",
                  output_dir = "Reports/Manuscript")
## For Tex Export - Copy Tex and image files into new folder and then remove all "../Data/images/" parts of paths
##
##
Y <- X
Y@outp_formats_chr <- "Word"
# Y@tables_in_body_lgl <- F
Y@tables_in_body_lgl <- Y@figures_in_body_lgl <- F
authorReport(Y, consent_1L_chr = "Y")
# Pause for interactivity
# 4554 Wordcount
