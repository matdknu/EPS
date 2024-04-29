library(tidyverse)
library(sjmisc)
library(labeling)
library(sjlabelled)
library(haven)

eps_04 <- load("base2004merged.RData")
eps_06 <- load("base2006merged.RData")
eps_09 <- load("base2009merged.RData")
eps_15 <- load("base2015merged.RData")
eps_20 <- load("base2020mergedconti.RData")
eps_20_1 <- load("base2020mergedpres.RData")
eps_20_2 <- load("base2020mergedreent.RData")



eps_04 <- base2004_combined %>% select(folio_n20,
                                       region2004,
                             fact_exp2004,
                             parentesco2004,
                             sexo2004, 
                             edad2004, 
                             ecivil2004,
                             asiste2004, 
                             neduc2004, 
                             #fineduc -> no está,
                             ncarreras2004, 
                             prueba2004, 
                             ingotros2004,
                             ingnlabe2004,
                             vivienda2004,
                             montoviv2004,
                             ple2004,
                             pse2004,
                             disc2004,
                             disca2004,
                             ncasado2004,
                             hogar2004,
                             npareja2004,
                             edadpareja2004,
                             edadconv2004,
                             vivepareja2004,
                             nhijos2004,
                             sexoh2004,
                             añoh2004, #cambiarle a ano
                             hcasa2004,
                             discph2004,
                             nwork2004,
                             añoiw2004,
                             añotw2004,
                             situationw2004,
                             tipow2004,
                             catw2044, #necesario cambiar el nombre,
                             contrato2004,
                             inglab2044 , #necesario cambiar
                             hworke2004,
                             inact2004,
                             programa2004,
                             npersona2004,
                             perteneceh2004,
                             edadi2004,
                             trabajoi2004,
                             contratoi2004,
                             inglabi2004,
                             hworki2004,
                             ingnlabi2004) %>% mutate(ano = 2004)

eps_06 <- base2006_combined %>% select(folio_n20,
                                       region2006,
                             fact_exp2006,
                             parentesco2006,
                             sexo2006, 
                             edad2006, 
                             ecivil2006,
                             asiste2006, 
                             neduc2006, 
                             #fineduc -> no está,
                             ncarreras2006, 
                             #prueba2006, 
                             ingrotros2006,
                             ingnlabe2006,
                             vivienda2006,
                             montoviv2006,
                             ple2006,
                             pse2006,
                             disc2006,
                             disca2006,
                             ncasado2006,
                             #hogar2006,
                             npareja2006,
                             edadpareja2006,
                             edadconv2006,
                             vivepareja2006,
                             nhijos2006,
                             sexoh2006,
                             añoh2006,
                             hcasa2006,
                             discph2006,
                             nwork2006,
                             añoiw2006,
                             añotw2066, #cambiar el nombre.
                             situationw2006,
                             tipow2066, #cambiar nombre
                             catw2006,
                             contrato2006,
                             inglab2006,
                             hworke2006,
                             inact2006,
                             programa2006,
                             npersona2006,
                             perteneceh2006,
                             edadi2006,
                             trabajoi2006,
                             #contratoi2006 no está,
                             inglabi2006,
                             #hworki2006, no está
                             ingnlabi2006) %>% mutate(ano = 2006) 


# Convertir todas las variables a caracteres
eps_04 <- mutate_all(eps_04, as.factor)
# Convertir todas las variables a numérico
eps_04 <- mutate_all(eps_04, as.numeric)
# Convertir todas las variables a caracteres
eps_06 <- mutate_all(eps_06, as.factor)
# Convertir todas las variables a numérico
eps_06 <- mutate_all(eps_06, as.numeric)

#eps_04 %>% frq (folio_n20)


datos_unidos <- merge(eps_04, eps_06, by = "folio_n20", all.x = TRUE)


eps_09 <- base2009_combined %>% select(folio_n20,
                             region2009,#fact_exp2009,
                             parentesco2009,
                             sexo2009, 
                             edad2009, 
                             ecivil2009,
                             #asiste2009, 
                             neduc2009, 
                             #fineduc -> no está,
                             ncarreras2009, 
                             #prueba2009, 
                             ingotros2009,
                             ingnlabe2009,
                             vivienda2009,
                             montoviv2009,
                             #ple2009,
                             pse2009,
                             disc2009, #renombrar a
                             discpa2009,
                             ncasado2009,
                             #hogar2009,
                             npareja2009,
                             edadpareja2009,
                             edadconv2009,
                             vivepareja2009,
                             nhijos2009,
                             sexoh2009,
                             añoh2009,
                             hcasa2009,
                             discph2009,
                             nwork2009,
                             añoiw2009,
                             añotw2009, #cambiar el nombre.
                             situationw2009,
                             tipow2006, #cambiar nombre
                             catw2009,
                             contratow2009,
                             #contrato2009,
                             inglab2009,
                             howrke2009,
                             inact2009,
                             programa2009,
                             npersona2009,
                             perteneceh2009,
                             edadi2009,
                             trabajoi2009,
                             #contratoi2009# no está,
                             inglabi2009,
                             #hworki2009, no está
                             ingnlabi2009)



base2015_combined$factor_EPS2015

eps_15 <- base2015_combined %>% rename(ncasado2015 = ncasadp2015,
                                       npersona2015 = nperson2015)%>%  select(folio_n20,
                                       #region2009, no aparece.
                                       factor_EPS2015,
                                       parentesco2015,
                                       sexoh12015, 
                                      # edad2015,  
                                       ecivil2015,
                                       asiste2015, 
                                       #neduc2015, no aparece. 
                                       fineduc2015,
                                       ncarreras2015, 
                                      # prueba2015, 
                                      # ingotros2015,
                                      # ingnlabe2015,
                                       vivienda2015,
                                       montoviv2015,
                                       #ple2015,
                                       pse2015,
                                       #disc2015, #renombrar a
                                       #discpa2015,
                                      discph12015,
                                      discph22015,
                                      discph32015,
                                      discph42015,
                                      discph52015,
                                       ncasado2015,
                                       hogar2015,
                                     #  npareja2015,
                                       edadpareja2015,
                                       edadconv2015,
                                      # vivepareja2015,
                                       nhijos2015,
                                       sexoh12015,
                                     sexoh22015,
                                     sexoh32015,
                                     sexoh42015,
                                     sexoh52015,
                                       añoh12015,
                                     añoh22015,
                                     añoh32015,
                                     añoh42015,
                                     añoh52015,
                                     añoiw2015,
                                     añotw2015,
                                     hcasa12015,
                                     hcasa22015,
                                     hcasa32015,
                                     hcasa42015,
                                     hcasa52015,
                                     discph12015,
                                     discph22015,
                                     discph32015,
                                     discph42015,
                                     discph52015,
                                       nwork2015,
                                       añoiw2015,
                                       añotw2015, #cambiar el nombre
                                       tipow2015, #cambiar nombre
                                       catw2015,
                                       contrato2015,
                                       #contratow2015,
                                     inglab2020,
                                     inglabi2015,
                                     ingnlabi2015,
                                     hworke2015,
                                     #  inact2015,
                                       programa2015,
                                       npersona2015,
                                       perteneceh2015,
                                       edadi2015,
                                       trabajoi2015,
                                      # contratoi2015,
                                       inglabi2015,
                                       #hworki2015, no está
                                       ingnlabi2015)

eps_20 <- base2020_combined %>% rename(ncasado2015 = ncasadp2015,
                                       npersona2015 = nperson2015)%>%  select(folio_n20,
                                                                              #region2009, no aparece.
                                                                              factor_EPS2015,
                                                                              parentesco2015,
                                                                              sexoh12015, 
                                                                              # edad2015,  
                                                                              ecivil2015,
                                                                              asiste2015, 
                                                                              #neduc2015, no aparece. 
                                                                              fineduc2015,
                                                                              ncarreras2015, 
                                                                              # prueba2015, 
                                                                              # ingotros2015,
                                                                              # ingnlabe2015,
                                                                              vivienda2015,
                                                                              montoviv2015,
                                                                              #ple2015,
                                                                              pse2015,
                                                                              #disc2015, #renombrar a
                                                                              #discpa2015,
                                                                              discph12015,
                                                                              discph22015,
                                                                              discph32015,
                                                                              discph42015,
                                                                              discph52015,
                                                                              ncasado2015,
                                                                              hogar2015,
                                                                              #  npareja2015,
                                                                              edadpareja2015,
                                                                              edadconv2015,
                                                                              # vivepareja2015,
                                                                              nhijos2015,
                                                                              sexoh12015,
                                                                              sexoh22015,
                                                                              sexoh32015,
                                                                              sexoh42015,
                                                                              sexoh52015,
                                                                              añoh12015,
                                                                              añoh22015,
                                                                              añoh32015,
                                                                              añoh42015,
                                                                              añoh52015,
                                                                              añoiw2015,
                                                                              añotw2015,
                                                                              hcasa12015,
                                                                              hcasa22015,
                                                                              hcasa32015,
                                                                              hcasa42015,
                                                                              hcasa52015,
                                                                              discph12015,
                                                                              discph22015,
                                                                              discph32015,
                                                                              discph42015,
                                                                              discph52015,
                                                                              nwork2015,
                                                                              añoiw2015,
                                                                              añotw2015, #cambiar el nombre
                                                                              tipow2015, #cambiar nombre
                                                                              catw2015,
                                                                              contrato2015,
                                                                              #contratow2015,
                                                                              inglab2020,
                                                                              inglabi2015,
                                                                              ingnlabi2015,
                                                                              hworke2015,
                                                                              #  inact2015,
                                                                              programa2015,
                                                                              npersona2015,
                                                                              perteneceh2015,
                                                                              edadi2015,
                                                                              trabajoi2015,
                                                                              # contratoi2015,
                                                                              inglabi2015,
                                                                              #hworki2015, no está
                                                                              ingnlabi2015)



eps_15 <- base2015_combined %>% rename(ncasado2015 = ncasadp2015,
                                       npersona2015 = nperson2015)%>%  select(folio_n20,
                                       #region2009, no aparece.
                                       factor_EPS2015,
                                       parentesco2015,
                                       sexoh12015, 
                                      # edad2015,  
                                       ecivil2015,
                                       asiste2015, 
                                       #neduc2015, no aparece. 
                                       fineduc2015,
                                       ncarreras2015, 
                                      # prueba2015, 
                                      # ingotros2015,
                                      # ingnlabe2015,
                                       vivienda2015,
                                       montoviv2015,
                                       #ple2015,
                                       pse2015,
                                       #disc2015, #renombrar a
                                       #discpa2015,
                                      discph12015,
                                      discph22015,
                                      discph32015,
                                      discph42015,
                                      discph52015,
                                       ncasado2015,
                                       hogar2015,
                                     #  npareja2015,
                                       edadpareja2015,
                                       edadconv2015,
                                      # vivepareja2015,
                                       nhijos2015,
                                       sexoh12015,
                                     sexoh22015,
                                     sexoh32015,
                                     sexoh42015,
                                     sexoh52015,
                                       añoh12015,
                                     añoh22015,
                                     añoh32015,
                                     añoh42015,
                                     añoh52015,
                                     añoiw2015,
                                     añotw2015,
                                     hcasa12015,
                                     hcasa22015,
                                     hcasa32015,
                                     hcasa42015,
                                     hcasa52015,
                                     discph12015,
                                     discph22015,
                                     discph32015,
                                     discph42015,
                                     discph52015,
                                       nwork2015,
                                       añoiw2015,
                                       añotw2015, #cambiar el nombre
                                       tipow2015, #cambiar nombre
                                       catw2015,
                                       contrato2015,
                                       #contratow2015,
                                     inglab2020,
                                     inglabi2015,
                                     ingnlabi2015,
                                     hworke2015,
                                     #  inact2015,
                                       programa2015,
                                       npersona2015,
                                       perteneceh2015,
                                       edadi2015,
                                       trabajoi2015,
                                      # contratoi2015,
                                       inglabi2015,
                                       #hworki2015, no está
                                       ingnlabi2015)


eps_20_cont <- base2020_combinedcont
eps_20_pres <- base2020_combinedpres
eps_20_rent <- base2020_combinedreent




saveRDS(eps_04, "eps_04.rds")
saveRDS(eps_06, "eps_06.rds")
saveRDS(eps_09, "eps_09.rds")
saveRDS(eps_15, "eps_15.rds")
saveRDS(eps_20_cont, "eps_20_cont.rds")
saveRDS(eps_20_pres, "eps_20_pres.rds")
saveRDS(eps_20_rent, "eps_20_rent.rds")

# Guardar como archivos DTA
write_dta(eps_04, "eps_04.dta")
write_dta(eps_06, "eps_06.dta")
write_dta(eps_09, "eps_09.dta")
write_dta(eps_15, "eps_15.dta")
write_dta(eps_20_cont, "eps_20_cont.dta")
write_dta(eps_20_pres, "eps_20_pres.dta")
write_dta(eps_20_rent, "eps_20_rent.dta")


