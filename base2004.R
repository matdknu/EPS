
##Ajustes previos
##Añadir c14/c15 (otros trabajos o pololos)
rm(list = ls())

library(texreg)
library(dplyr)
library(car)
install.packages("haven")
library(haven)


#setwd ("C:/Users/pasil/OneDrive/Documentos/Fondecyt alejandra/EPS/2004")
##Individual
base2004_entrevistado <- read_dta("entrevistado.dta")

base2004_entrevistado$ingnlabe2004 <- rowSums(base2004_entrevistado[, c("c19_01", "c19_02", "c19_03", "c19_04", "c19_05", "c19_06", "c19_07")], na.rm = TRUE)
base2004_entrevistado <- base2004_entrevistado %>%
  select( region2004 = region, fact_exp2004 = fact_exp, folio_n20, parentesco2004 = a4b, 
          sexo2004 = a5, edad2004 = a6 , ecivil2004 = a7, asiste2004 = a9, neduc2004 = a10n,
          ncarreras2004 = a11, prueba2004 = a29, ingotros2004 = c14, ingnlabe2004, 
          vivienda2004 = d7, montoviv2004 = d8,ple2004 = e1, pse2004 = f1, disc2004 = f31, disca2004 = f32, 
          ncasado2004 = i4, hogar2004 = h13)


##Base de datos pareja
base2004_pareja <- read_dta("h_individual.dta")
base2004_pareja <- base2004_pareja %>%
  select(npareja2004 = orden, edadpareja2004 = i6, edadconv2004 = i7, vivepareja2004= i9, folio_n20)


##Hijos del hogar
base2004_h <- read_dta("hijos.dta")
base2004_h <- base2004_h %>%
  select(nhijos2004= orden, sexoh2004 = i19, añoh2004 = i20_02, hcasa2004= i23, discph2004 = i24 , folio_n20)


##Trabajo
base2004_w <- read_dta("h_laboral.dta")
base2004_w <- base2004_w %>%
  select(nwork2004 = orden, añoiw2004= b1ia, añotw2004 = b1ta, situationw2004 = b2, tipow2004 =  b5, catw2044= b7, contrato2004= b8,  inglab2044= b11, hworke2004 = b12, inact2004 = b24, programa2004 = b25,  folio_n20)




##Hogar
base2004_hogar <- read_dta("hogar.dta")
base2004_hogar <- base2004_hogar %>%
  select(npersona2004 = orden, perteneceh2004 = a2, edadi2004 = a6, trabajoi2004 = c1, contratoi2004= c2, inglabi2004 = c3, hworki2004 = c5, ingnlabi2004 = c14, folio_n20)
summary(base2004_hogar)


#Combinar bases de datos

base2004_combined <- bind_rows(
  mutate(base2004_entrevistado, origen = "base2004_entrevistado"),
  mutate(base2004_pareja, origen = "base2004_pareja"),
  mutate(base2004_h, origen = "base2004_h"),
  mutate(base2004_w, origen = "base2004_w"),
  mutate(base2004_hogar, origen = "base2004_hogar")
)
summary(base2004_combined)
##Guardar base de datos 
save(base2004_combined, file = "base2004merged.RData")



