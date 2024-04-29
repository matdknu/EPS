##Ajustes previos
##Añadir c14/c15 (otros trabajos o pololos)
rm(list = ls())

library(texreg)
library(dplyr)
library(car)
install.packages("haven")
library(haven)


##Continuación
#Fijar directorio
setwd ("C:/Users/pasil/OneDrive/Documentos/Fondecyt alejandra/EPS/2020")
base2020_CONTI <- read_dta("MODULO_Entrevistado_VIVOS_in.dta")
base2020_CONTI$ingnlabe2020 <- rowSums(base2020_CONTI[, c("c30m_1", "c30m_2", "c30_3", "c30m_4", "c30m_5")], na.rm = TRUE)
base2020_CONTI <- base2020_CONTI %>%
  select(folio_n20, sexo2020 = a8, edad2020 = a9, parentesco2020 = a5, asiste2020 = a11, neduc2020 = a12_n, codeduc2020 = CINE_P_1dig, fineduc2020 = a12_r_cod1, situationw2020 = b2a_ed, situationwcod2020 = b2a_so,  ecivil2020 = i1, nhijos2020 = i18, ingotros2020 = c34_ed,
         vivienda2020 = d7, pse2020 = f1, ingnlabe2020 )
base2020_CONTI_w <- read_dta("MODULO_Historia Laboral_VIVOS_in.dta")
base2020_CONTI_w <- base2020_CONTI_w %>%
  select(folio_n20, nwork2020 = orden, b2a_ED, b2a_SO, añoiw2020 = b2a_inicio_a, añotw2020 = b2a_termino_a, catw2020 = b8, contrato2020 = b9a, inglab2020 = b12, hwore2020 = b13, situationwcod2020 = cise)

base2020_CONTI_hogar <- read_dta("MODULO_Hogar_VIVOS_in.dta")
base2020_CONTI_hogar <- base2020_CONTI_hogar %>%
  select(folio_n20, npersona2020 = orden, perteneceh2020 = a2a, edadi2020 = a9)

##Combinar base de datos 2020 continuación

base2020_combinedcont <- bind_rows(
  mutate(base2020_CONTI, origen = "base2020_CONTI"),
  mutate(base2020_CONTI_hogar, origen = "base2020_CONTI_hogar"),
  mutate(base2020_CONTI_w, origen = "base2020_CONTI_w"),
 
)

##Guardar base de datos 
save(base2020_combinedcont, file = "base2020mergedconti.RData")





##PRESENCIAL/Falta f1 de Modulo F

##Pareja
setwd ("C:/Users/pasil/OneDrive/Documentos/Fondecyt alejandra/EPS/2020/presencial")
base2020_indiv <- read_dta("MODULO_I_Parejas_in.dta")
base2020_indiv <- base2020_indiv %>%
  select(folio_n20, npareja2020 = orden, edadpareja2020 = i5, edadconv2020= i6,  vivepareja2020 = i9)
base2020_indiv2 <- read_dta("MODULO_I_Entrevistado_in.dta")
base2020_indiv2 <- base2020_indiv2 %>%
  select(folio_n20, ecivilp2020 = i1, ncasado2020 = i2b)

#Hijos
base2020_h <- read_dta("MODULO_I_Hijos_in.dta")
base2020_h <- base2020_h %>%
  select(folio_n20, nhijos2020 = orden, sexoh2020 = i20, añoh2020 = i21_anio, hcasa2020 = i24, discph2020 = i25 )

##Entrevistado
base2020_entrevistado <- read_dta("MODULO_A_Entrevistado_in.dta")
base2020_entrevistado <- base2020_entrevistado %>%
  select(folio_n20, sexo2020 = a8, edad2020 = a9, parentesco2020 = a5, asiste2020 = a11, ncarreras2020 = max_carreras, neduc2020 = a12_n_ed, codneduc2020 = CINE_P_1dig,
         fineduc2020 = a12_r )

##Trabajo
base2020_laboral <- read_dta("MODULO_B_Historia_Laboral_in.dta")
base2020_laboral <- base2020_laboral %>%
  select(folio_n20, nwork2020 = orden, añoiw2020 = b2_a_inicio_anio, añotw2020= b2_a_termino_anio, situationw2020 = b2a_ED, situationwcod2020 = b2a_SO, tipow2020 = b6, catw2020 =cise, contrato2020 =b9_a,
         inglab2020= b12, hwoke2020 = b13, programa2020 = b26)
##Hogar
base2020_hogar <- read_dta("MODULO_Hogar_in.dta")
base2020_hogar <- base2020_hogar %>%
  select(folio_n20, npersona2020 = orden, perteneceh2020 = a2_a, edadi2020 = a9_ed, inglabi2020 = c3_ED)


#Salud
base2020_salud <- read_dta("MODULO_E_Entrevistado_in.dta")
base2020_salud <- base2020_salud %>%
  select(folio_n20, pse2020 = e2)

base2020_D <- read_dta("MODULO_D_Entrevistado_in.dta")
base2020_D <- base2020_D %>%
  select(folio_n20, viviendap2020 = d7, montoviv2020 = d8_a_ed)

base2020_C <- read_dta("MODULO_C_Entrevistado_in.dta")
base2020_C <- base2020_C %>%
  select(folio_n20, ingotros2020 = c11_ed, ingnlabe2020 = c34_ed )


##Combinar base de datos 2020 presencial

base2020_combinedpres <- bind_rows(
  mutate(base2020_C, origen = "base2020_C"),
  mutate(base2020_D, origen = "base2020_D"),
  mutate(base2020_entrevistado, origen = "base2020_entrevistado"),
  mutate(base2020_h, origen = "base2020_h"),
  mutate(base2020_hogar, origen = "base2020_hogar"),
  mutate(base2020_indiv, origen = "base2020_indiv"),
  mutate(base2020_indiv2, origen = "base2020_indiv2"),
  mutate(base2020_laboral, origen = "base2020_laboral"),
  mutate(base2020_salud, origen = "base2020_salud")
)

##Guardar base de datos 
save(base2020_combinedpres, file = "base2020mergedpres.RData")
summary(base2006_combined)

##Reentrevista
setwd ("C:/Users/pasil/OneDrive/Documentos/Fondecyt alejandra/EPS/2020/reentrevista")


base2020_reent <- read_dta("MODULO_Entrevistado_VIVOS_in.dta")
base2020_reent <- base2020_reent %>%
  select(folio_n20, sexo2020 = a8, edad2020 = a9, parentesco2020 = a5, vivienda2020 = d7)

base2020_reent_lab <- read_dta("MODULO_Historia Laboral_VIVOS_in.dta")
base2020_reent_lab <- base2020_reent_lab %>%
  select(folio_n20, situationw2020 = b2a, añoiw2020 = b2a_inicio_a, añotw2020 = b2a_termino_a, tipow2020 = b8, contrato2020 = b9a, inglabe2020 = b12, hworke2020 = b13, situacionw2020 = cise )

base2020_reent_hogar <- read_dta("MODULO_Hogar_VIVOS_in.dta")
base2020_reent_hogar <- base2020_reent_hogar %>%
  select(folio_n20, npersona2020 = orden, perteneceh2020 = a2a, edadi2020 = a9 )

##Combinar base de datos 2020 continuación

base2020_combinedreent <- bind_rows(
  mutate(base2020_reent, origen = "base2020_reent"),
  mutate(base2020_reent_hogar, origen = "base2020_reent_hogar"),
  mutate(base2020_reent_lab, origen = "base2020_reent_lab"),
  
)

##Guardar base de datos 
save(base2020_combinedreent, file = "base2020mergedreent.RData")


