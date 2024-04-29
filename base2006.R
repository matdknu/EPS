##Base 2006
rm(list = ls())
#setwd ("C:/Users/pasil/OneDrive/Documentos/Fondecyt alejandra/EPS/2006")
base2006_entrevistado <- read_dta("entrevistado.dta")

base2006_entrevistado$ingnlabe2006 <- rowSums(base2006_entrevistado[, c("c19_1", "c19_2", "c19_3", "c19_4", "c19_5", "c19_6")], na.rm = TRUE)
base2006_entrevistado <- base2006_entrevistado %>%
  select(region2006= region, fact_exp2006 = factor_EPS06, folio_n20, parentesco2006 = a5, sexo2006 = a8, edad2006 = a9, asiste2006 = a11, neduc2006 = a12n, ncarreras2006 = a13, ingrotros2006 = c15,
         vivienda2006 = d7, montoviv2006 = d8, ple2006 = e1, ncasado2006 = i2b, ingnlabe2006) 

#Pareja
base2006_pareja <- read_dta("historiaindividual.dta")
base2006_pareja <- base2006_pareja %>%
  select(folio_n20, npareja2006 = orden, edadpareja2006 = i5, edadconv2006 = i6, vivepareja2006 =  i9, nhijos2006 = i17) 


#Hijos
base2006_h <- read_dta("hijos.dta")
base2006_h <- base2006_h %>%
  select(folio_n20, nhijos2006 = orden, sexoh2006 = i20, añoh2006 = i21a, hcasa2006 = i24, discph2006 = i25) 

#Trabajo
base2006_w <- read_dta("historialaboral.dta")
base2006_w <- base2006_w %>%
  select(folio_n20, nwork2006 = orden, añoiw2006 = b1ia, añotw2066 = b1ta, situationw2006 = b2, tipow2066 = b6, catw2006 = b8, contrato2006 = b9, inglab2006 = b12, hworke2006 =  b13, 
         inact2006 = b25, programa2006 = b26) 

##Hogar 
base2006_hogar <- read_dta("hogar.dta")
base2006_hogar <- base2006_hogar %>%
  select(folio_n20, npersona2006 = orden, perteneceh2006 = a2a, ecivil2006 = a5b, edadi2006 = a9, trabajoi2006 = c1, inglabi2006 = c3, ingnlabi2006 = c15)

#Salud
base2006_s <- read_dta("salud.dta")
base2006_s <- base2006_s %>%
  select(folio_n20, pse2006 = f1, disc2006 = f37, disca2006 = f39a)


##Combinar base de datos 2006

base2006_combined <- bind_rows(
  mutate(base2006_entrevistado, origen = "base2006_entrevistado"),
  mutate(base2006_pareja, origen = "base2006_pareja"),
  mutate(base2006_h, origen = "base2006_h"),
  mutate(base2006_w, origen = "base2006_w"),
  mutate(base2006_hogar, origen = "base2006_hogar"),
  mutate(base2006_s, origen = "base2006_s")
)

##Guardar base de datos 
save(base2006_combined, file = "base2006merged.RData")
summary(base2006_combined)

