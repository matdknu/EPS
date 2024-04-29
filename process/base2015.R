##Ajustes previos
##Añadir c14/c15 (otros trabajos o pololos)
rm(list = ls())

library(texreg)
library(dplyr)
library(car)
install.packages("haven")
library(haven)
##Base 2015
setwd ("C:/Users/pasil/OneDrive/Documentos/Fondecyt alejandra/EPS/2015")
base2015_imput <- read_dta("Base Imputaciones EPS2015.dta")

##
base2015 <- base2015_imput %>%
  select(folio_n20, inglab2020 = ytrab_ihd6, neduc2015 = teduc)

##Educ
base2015_educ <- read_dta("CARRERAS.dta")
base2015_educ <- base2015_educ %>%
  select(folio_n20, ncarreras2015 = orden, asiste2015 = a18)

#Parejas e hijos
base2015_indiv <- read_dta("MODULOI_entrevistado.dta")
base2015_indiv <- base2015_indiv %>%
  select(folio_n20,  ecivil2015 = i1, ncasado2015 = i2b1, edadpareja2015 = i5_1, edadconv2015 = i6_2, nhijos2015 = i18, sexoh12015 = i20_1, sexoh22015 = i20_2, sexoh32015 = i20_3, sexoh42015 = i20_4, sexoh52015 = i20_5, añoh12015 = i21_año_1, añoh22015 = i21_año_2, añoh32015 = i21_año_3, añoh42015 = i21_año_4, añoh52015 = i21_año_5, hcasa12015 = i24_1, hcasa22015 = i24_2, hcasa32015 = i24_3, hcasa42015 = i24_4, hcasa52015 = i24_5, discph12015 = i25_1, discph22015 = i25_2, discph32015 = i25_3, discph42015 = i25_4, 
         discph52015 = i25_5)

##Trabajo
base2015_w <- read_dta("MODULOB_historia_laboral.dta")
base2015_w <- base2015_w %>%
  select(folio_n20, nwork2015 = orden, añoiw2015 = b1ia, añotw2015 = b1ta, tipow2015 = b6, catw2015 = b8, contrato2015 =  b9a, hworke2015 = b13, programa2015 = b26)


##Hogar
base2015_hogar <- read_dta("MODULO_hogar.dta")
base2015_hogar$ingnlabe2015 <- rowSums(base2015_hogar[, c("c29m_1", "c29m_2", "c29m_3", "c29m_4", "c29m_5")], na.rm = TRUE)
base2015_hogar <- base2015_hogar %>%
  select(folio_n20, npersona2015 = orden, perteneceh2015 = a2a, parentesco2015 = a5, edadi2015 =  a9, fineduc2015 = a12r, trabajoi2015 = c1, inglabi2015 = c3, ingnlabi2015 = c11a,  pse2015 = f1, ingnlabe2015)

#Modulo E
base2015_E <- read_dta("MODULOE_entrevistado.dta")
base2015_E <- base2015_E %>%
  select(folio_n20, ple2015 = e2)
#D
base2015_D <- read_dta("MODULOD_entrevistado.dta")
base2015_D <- base2015_D %>%
  select(folio_n20, vivienda2015 = d7, montoviv2015 = d8)

##H
base2015_H <- read_dta("MODULOH_entrevistado.dta")
base2015_H <- base2015_H %>%
  select(folio_n20, hogar2015 = h13)

##Expansión 
base2015_exp <- read_dta("FactoresExpansionVIRondaEPS.dta")
base2015_exp <- base2015_exp %>%
  select(folio_n20, factor_EPS2015, factor_PANEL2002_destino, factor_PANEL2004_destino)

#Combinar bases de datos

base2015_combined <- bind_rows(
  mutate(base2015, origen = "base2015"),
  mutate(base2015_D, origen = "base2015_D"),
  mutate(base2015_E, origen = "base2015_E"),
  mutate(base2015_educ, origen = "base2015_educ"),
  mutate(base2015_exp, origen = "base2015_exp"),
  mutate(base2015_H, origen = "base2015_H"),
  mutate(base2015_hogar, origen = "base2015_hogar"),
  mutate(base2015_indiv, origen = "base2015_indiv"),
  mutate(base2015_w, origen = "base2015_w")
)

##Guardar base de datos 
save(base2015_combined, file = "base2015merged.RData")
