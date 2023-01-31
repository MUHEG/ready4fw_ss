# Manual step: Create Data and Data > CSVs directories and add authors and institutes csvs
library(ready4)
library(ready4show)
library(bookdown)
library(rticles)
X <- Ready4showSynopsis(#background_1L_chr = "Our study is entirely fictional.",
                        coi_1L_chr = "None declared.",
                        #conclusion_1L_chr = "We have identified a number of standards that we believe are appropriate to implementing quality OSHEMs in youth mental health. Most of these standards are probably relevant to OSHEMs in other health conditions, though some such as the copyleft licensing may be less relevant to modellers using different tools. Our framework toolkits can help support standardised approaches to dynamic systems model development that are important for collaborative and interdependent projects. ",
                        digits_int = 3L,
                        ethics_1L_chr = "Framework development did not involve human subject research and was not ethically reviewed. The utility mapping worked example is a previously reported study that was reviewed and granted approval by the University of Melbourne’s Human Research Ethics Committee, and the local Human Ethics and Advisory Group (1645367.1).",
                        funding_1L_chr = "Framework development was funded by Orygen, VicHealth and Victoria University. The utility mapping study used as a worked example was funded by the National Health and Medical Research Council (NHMRC, APP1076940), Orygen and headspace.",
                        #interval_chr = "three months",
                        keywords_chr = c("open source models","health economics","mental disorders"),
                        outp_formats_chr = "PDF",
                        #sample_desc_1L_chr = "The study sample is fake data that pretends to be young people aged 12 to 25 years who attended Australian primary care services for mental health related needs between November 2019 to August 2020.",
                        title_1L_chr = "The ready4 framework for implementing a modular open source health economic model (MOSHEM) in youth mental health that is accountable, reusable and updatable")
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
                 args_ls$abstract_ls <- list(Summary = "Health economists make limited use of the modular and open source approaches to model building that other disciplines use to make large modelling projects more transparent, efficient and sustainable. 
                                             We propose a framework for developing a modular open source health economic model (MOSHEM) in youth mental health called ready4.
                                             The framework includes of set of 20 standards for implementing a MOSHEM that is accountable (seven standards), reusable (nine standards) and updatable (four standards). 
                                             We provide a rationale for each standard.
                                             The framework also includes a modelling toolkit of open access repositories and six R libraries for authoring ready4 modules (data structures and algorithms), supplying those modules with data and using the modules to implement reproducible modelling analyses. 
                                             We describe an early application of the framework to developing utility mapping models that currently meet 18 framework standards. 
                                             We discuss the potential benefits and challenges of extending ready4 in order to undertake and synthesise diverse economic modelling studies in youth mental health and highlight some broader implications for health economists and research funders.",
                                             # Objectives = "We aimed to develop a conceptual and technical framework for implementing open source mental health systems models and illustrate how it can be applicatied to economic topics in youth mental health.",
                                             # Methods = "We created a software development kit in R to support standardised implementation of mental health systems models. As a worked example, we applied the toolkit to develop open source youth mental health utility mapping models, which we assessed against five principles using 17 standards.",
                                             # Results = "Six R packages and a coding style dataset provide a toolkit for implementing mental health models that are TIMELY - Transparent, Iterative, Modular, Epitomising, Licensed and Yielding. The utility mapping models we developed with this toolkit fully met X and partially met Y TIMELY standards.", 
                                             # Conclusion = "Please fund me",
                                             Code = "Visit https://www.ready4-dev.com for more information about how to find, install and apply ready4.")
                 args_ls
                 }
               )
# authorData(X) # Update ready4show so that default is to not overwrite Child_RMDs / only overwrite header and abstract
# Pause for interactivity
# Make manual edits of Markdown files
authorReport(X)
##
##
Y <- X
Y@outp_formats_chr <- "Word"
authorReport(Y)
# Pause for interactivity
