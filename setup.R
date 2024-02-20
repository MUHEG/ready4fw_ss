# Manual step: Create Data and Data > CSVs directories and add authors and institutes csvs
library(ready4)
library(ready4show)
library(bookdown)
library(rticles)
X <- Ready4showSynopsis(#background_1L_chr = "Our study is entirely fictional.",
                        coi_1L_chr = "None declared.",
                        #conclusion_1L_chr = "We have identified criteria that can be used to systematically assess extent to which the computational implementation of health economic models adheres to the ethical goals of transparency, reusability and updatability. We have developed an open-source software framework that can support the ethical computational implementation of economic models in youth mental health. Our framework can be used as a prototype for developing future software frameworks to support ethical implementation of CHEMs.",
                        digits_int = 3L,
                        ethics_1L_chr = "Software framework development did not involve human subject research and was not ethically reviewed. The utility mapping worked example is a previously reported study that was reviewed and granted approval by the University of Melbourne’s Human Research Ethics Committee, and the local Human Ethics and Advisory Group (1645367.1).",
                        funding_1L_chr = "Software framework development was funded by Orygen, VicHealth, Victoria University and an Australian Government Research Training Program (RTP) Scholarship. The utility mapping study used as a worked example was funded by the National Health and Medical Research Council (NHMRC, APP1076940), Orygen and headspace.",
                        #interval_chr = "three months",
                        keywords_chr = c("computational models", "health economics", "mental disorders", "open-source models", "software frameworks"),
                        outp_formats_chr = "PDF",
                        #sample_desc_1L_chr = "The study sample is fake data that pretends to be young people aged 12 to 25 years who attended Australian primary care services for mental health related needs between November 2019 to August 2020.",
                        title_1L_chr = "A prototype software framework for transferable computational health economic models")
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
                 args_ls$abstract_ls <- list(Summary = "To facilitate Computational Health Economic Models (CHEMs) that are Transparent, Reusable and Updatable (TRU), we have developed a prototype software framework in the open-source programming language R.
                                                        The framework comprises six code libraries for authoring CHEMs, supplying CHEMs with data and undertaking analyses with CHEMs. 
                                                        The prototype software framework integrates with services for software development and research data archiving. 
                                                        We used the framework to developed an initial set of utility mapping CHEMs in youth mental health that can be assessed as meeting explicit TRU criteria.
                                                        Our software framework has potential value as a prototype for future tools to support ethical implementation of CHEMs.",
                                             # Objectives = "We aimed to develop a conceptual and technical framework for implementing open source mental health systems models and illustrate how it can be applicatied to economic topics in youth mental health.",
                                             # Methods = "We created a software development kit in R to support standardised implementation of mental health systems models. As a worked example, we applied the toolkit to develop open source youth mental health utility mapping models, which we assessed against five principles using 17 standards.",
                                             # Results = "Six R packages and a coding style dataset provide a toolkit for implementing mental health models that are TIMELY - Transparent, Iterative, Modular, Epitomising, Licensed and Yielding. The utility mapping models we developed with this toolkit fully met X and partially met Y TIMELY standards.", 
                                            #Conclusion = "",
                                             Code = "Visit https://www.ready4-dev.com for more information about how to find, install and apply the prototype software framework and CHEMs developed with it.")
                 args_ls
                 }
               )
X@tables_in_body_lgl <- F
X@figures_in_body_lgl <- F
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
authorReport(Y, consent_1L_chr = "Y")
# Pause for interactivity
# 4554 Wordcount