##Ajustes previos
##Añadir c14/c15 (otros trabajos o pololos)
rm(list = ls())

library(texreg)
library(dplyr)
library(car)
install.packages("haven")
library(haven)


#Fijar directorio
#setwd ("C:/Users/pasil/OneDrive/Documentos/Fondecyt alejandra/EPS/2009")
base2009 <- read_dta("entrevistado.dta")
base2009$ingnlabe2009 <- rowSums(base2009[, c("c19_01", "c19_02", "c19_03", "c19_04", "c19_05", "c19_06")], na.rm = TRUE)
base2009_entrevistado <- base2009 %>%
  select(folio_n20, parentesco2009 = a5, region2009 = a6a, sexo2009 = a8, edad2009 = a9, asiste2006 = a11, neduc2009 = a12n, ingotros2009 = c15, ingnlabe2009, vivienda2009 = d7, montoviv2009 = d8, psl2009 = e1, trabajoi2009 = hist_independiente, trabajoi22009 = hist_dependiente)
str(base2009_entrevistado$psl2009)
##Expansión
base2009_exp <- read_dta("factor_EPS09.dta")
base2009_exp <- base2009_exp %>%
  select(fact_exp200 = factor_EPS09)

##Trabajo 
base2009_w <- read_dta("hlaboral.dta")
base2009_w <- base2009_w %>%
  select(folio_n20, nwork2009 = orden, añoiw2009 = b1ia, añotw2009 =  b1ta, situationw2009 = b2, tipow2006 = b6, catw2009 = b8, contratow2009 = b9b, inglab2009 = b12, howrke2009 = b13,
         inact2009 = b25, programa2009 = b26)

##Hogar 
base2009_hogar <- read_dta("hogar.dta")
base2009_hogar <- base2009_hogar %>%
  select(folio_n20, npersona2009 = orden, perteneceh2009 = a2a, edadi2009 = a9, inglabi2009 = c3, ingnlabi2009 = c15b, pse2009 =  f1, disc2009 = f35, discpa2009 = f37)


##Educación 
base2009_educ <- read_dta("carreras.dta")
base2009_educ <- base2009_educ %>%
  select(folio_n20, ncarreras2009 = orden)


##Pareja
base2009_indiv <- read_dta("hindividual.dta")
base2009_indiv <- base2009_indiv %>%
  select(folio_n20, npareja2009 = orden, ecivil2009 = i1, ncasado2009 = i2_2, edadpareja2009 = i5_01, edadconv2009 = i6_01, vivepareja2009 = i9)


##Hijos
base2009_h <- read_dta("hijos.dta")
base2009_h <- base2009_h %>%
  select(folio_n20, nhijos2009 = orden, sexoh2009 = i20, añoh2009 = i21_02, hcasa2009 = i24 , discph2009 = i25)


#Combinar bases de datos

base2009_combined <- bind_rows(
  mutate(base2009_entrevistado, origen = "base2009_entrevistado"),
  mutate(base2009_educ, origen = "base2009_educ"),
  mutate(base2009_exp, origen = "base2009_exp"),
  mutate(base2009_indiv, origen = "base2009_indiv"),
  mutate(base2009_h, origen = "base2009_h"),
  mutate(base2009_w, origen = "base2009_w"),
  mutate(base2009_hogar, origen = "base2009_hogar")
)
summary(base2009_combined)
##Guardar base de datos 
save(base2009_combined, file = "base2009merged.RData")




