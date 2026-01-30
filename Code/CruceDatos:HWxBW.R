rm(list=ls())

library(dplyr)
library(readxl)

## Settings ----
source("Code/0.1 Functions.R")
source("Code/0.2 Settings.R")

## Data ---- 
# Cargar base de datos calor correspondiente
hw_data <- read_excel("Output/Heat_Waves_Data_FinalÑuble.xlsx")


# References values
com <- chilemapas::codigos_territoriales 
com_suburb <- unique(com$codigo_comuna[com$codigo_region == "16"]) #cambiar código según región a trabajar
com_suburb <- as.numeric(com_suburb)

ref_temp <- hw_data %>% 
  filter(com %in% com_suburb) %>% 
  filter(month %in% c(11, 12, 1, 2, 3)) %>% 
  group_by(com) %>% 
  summarise(p90_tmax=quantile(tmax, probs = 0.90, digits = 2),
            p95_tmax=quantile(tmax, probs = 0.95, digits = 2),
            p99_tmax=quantile(tmax, probs = 0.99, digits = 2)) %>% 
  ungroup()

#agregar nombres de comunas
nombres_ref <- chilemapas::codigos_territoriales %>% 
  select(codigo_comuna, nombre_comuna) %>% 
  mutate(codigo_comuna = as.numeric(codigo_comuna))

#Unir ambas tablas
ref_temp <- ref_temp %>%
  left_join(nombres_ref, by = c("com" = "codigo_comuna")) %>% 
  rename(name_com = nombre_comuna) %>%  # Asignar mismo nombre comunas archivo BW
  relocate(name_com, .after = com)      

# glimpse(ref_temp)

# ------

# Análisis comunal sobre datos de parto en la región determinada

tabla_resumen <- read_excel("Output/BW_Data_Ñuble.xlsx") %>% #cambiar nombre archivo según región a analizar
  # Agrupar por la columna de comuna
  group_by(name_com) %>% 
  # Calculo de partos por columna
  summarise(
    `Partos Pretérmino` = sum(birth_preterm == 1, na.rm = TRUE),
    `Partos Totales` = n() 
  )

#Unir todo en una misma tabla
ref_temp_final <- ref_temp %>%
  left_join(tabla_resumen, by = "name_com") #Se conectan por el nombre de la comuna

# glimpse(ref_temp_final)

writexl::write_xlsx(ref_temp_final, "Output/HWxBW_Data_Ñuble.xlsx")

