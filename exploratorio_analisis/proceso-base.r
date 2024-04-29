## Process

eps_04 <- load("base2004merged.RData")

prueba <- base2004_combined %>% filter(folio_n20 == 128124421768)


prueba2<- prueba %>% select(folio_n20, hogar2004, npareja2004, nhijos2004, edadi2004)


# Convertir todas las variables a caracteres
prueba2 <- mutate_all(prueba2, as.factor)
# Convertir todas las variables a numérico
prueba2 <- mutate_all(prueba2, as.numeric)


prueba_resumida <- prueba2 %>%
  group_by(folio_n20) %>%
  summarise_all(list(~ first(.[!is.na(.)])))

# Pivotar los datos para tener una sola fila por 'folio_n20'
prueba_consolidada <- prueba_resumida %>%
  pivot_wider(names_from = "variable", values_from = "value")
