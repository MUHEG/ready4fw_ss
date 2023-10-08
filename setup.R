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
                        funding_1L_chr = "Software framework development was funded by Orygen, VicHealth, Victoria University and an Australian Government Research Training Program (RTP) Scholarship . The utility mapping study used as a worked example was funded by the National Health and Medical Research Council (NHMRC, APP1076940), Orygen and headspace.",
                        #interval_chr = "three months",
                        keywords_chr = c("open source models","health economics","mental disorders"),
                        outp_formats_chr = "PDF",
                        #sample_desc_1L_chr = "The study sample is fake data that pretends to be young people aged 12 to 25 years who attended Australian primary care services for mental health related needs between November 2019 to August 2020.",
                        title_1L_chr = "A prototype software framework for transparent, reusable and updatable health economic models")
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
                 args_ls$abstract_ls <- list(Summary = "Computers are essential tools for health economists. 
                                                        However, the ethical dimensions of how health economic models are implemented computationally are poorly understood and inadequately fulfilled. 
                                                        We propose six criteria for assessing ethical implementation of computational health economic models (CHEMs) – two each for the three domains of transparency, reusability and updatability. 
                                                        Citeria for assessing CHEM transparency include open access sharing of code and data and clarity about the contributions, assumptions and judgments of model developers. 
                                                        CHEM reusability can be assessed against the criteria of development practices that promote generalisability and transferability and release under liberal terms of use.
                                                        The updatability of CHEMS can be assessed against the criteria of use of technical infrastructure to support model maintenance and quality assuring new releases through retesting and deprecation conventions.
                                                        To facilitate the implementation of CHEMs that meet these criteria, we developed a novel prototype software framework called ready4. 
                                                        Software frameworks are technologies that facilitate collaborative and efficient code development.
                                                        The ready4 framework, comprised of six code libraries in the programming language R, provides a toolkit for authoring modular and open-source CHEMs, supplying CHEMs with data and using CHEMs to undertake reproducible analyses. 
                                                        The ready4 framework supports integrations with existing digital services for collaborative software development and data archiving. 
                                                        We are currently applying the ready4 framework to develop and apply CHEMs in youth mental health. 
                                                        We determined that the first set of CHEMs developed with the ready4 framework wholly met both transparency criteria and both reusability criteria. We further determined that these CHEMs wholly met the updatability criterion relating to model maintenance infrastructure  and partially met the criterion concerning retesting and deprecation. 
                                                        The assessment criteria and the software framework we have developed can inform future work to understand and improve ethical CHEM implementations.",
                                             # Objectives = "We aimed to develop a conceptual and technical framework for implementing open source mental health systems models and illustrate how it can be applicatied to economic topics in youth mental health.",
                                             # Methods = "We created a software development kit in R to support standardised implementation of mental health systems models. As a worked example, we applied the toolkit to develop open source youth mental health utility mapping models, which we assessed against five principles using 17 standards.",
                                             # Results = "Six R packages and a coding style dataset provide a toolkit for implementing mental health models that are TIMELY - Transparent, Iterative, Modular, Epitomising, Licensed and Yielding. The utility mapping models we developed with this toolkit fully met X and partially met Y TIMELY standards.", 
                                            #Conclusion = "",
                                             Code = "Visit https://www.ready4-dev.com for more information about how to find, install and apply the prototype software framework.")
                 args_ls
                 }
               )
X@tables_in_body_lgl <- F
X@figures_in_body_lgl <- F
#X@rmd_fl_nms_ls$PDF <- "TEST"#"Parent_PDF"
# authorData(X) # Update ready4show so that default is to not overwrite Child_RMDs / only overwrite header and abstract
# Pause for interactivity
# Make manual edits of Markdown files
authorReport(X, consent_1L_chr = "Y")
##
##
Y <- X
Y@outp_formats_chr <- "Word"
# Y@tables_in_body_lgl <- F
authorReport(Y, consent_1L_chr = "Y")
# Pause for interactivity
