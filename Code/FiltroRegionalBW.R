rm(list=ls())

library(dplyr)

# Cargar base de datos completa
tabla_region <- rio::import(paste0("Code/births_1992_2020.RData")) %>%
  # FILTRAR
  filter(name_reg == "Maule")
  
#Guarda los datos regionales en un archivo excel en la carpeta output
writexl::write_xlsx(tabla_region, "Output/BW_Data_Maule.xlsx")
  