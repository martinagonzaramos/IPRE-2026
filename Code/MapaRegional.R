rm(list=ls())

library(chilemapas)
library(ggplot2)
library(dplyr)
library(readr)    
library(stringr) 
library(readxl)
library(sf)

# Cargar y unir los 4 archivos de datos 
# Asignar cada uno en una variable distinta
df_ohiggins <- read_excel("Output/Ref_temp_summerOH.xlsx")
df_maule    <- read_excel("Output/Ref_temp_summerMaule.xlsx")
df_biobio   <- read_excel("Output/Ref_temp_summerBB.xlsx")
df_nuble    <- read_excel("Output/Ref_temp_summerÑuble.xlsx")

# Unir los datos en una misma tabla
datos_externos <- bind_rows(df_ohiggins, df_maule, df_biobio, df_nuble)

# Aplicar lógica de clasificación 
datos_clasificados <- datos_externos %>% 
  mutate(
    codigo_comuna = str_pad(as.character(com), width = 5, pad = "0"),
    categoria_color = case_when(
      p90_tmax > 30 & p95_tmax > 31 & p99_tmax > 33 ~ "Grupo Crítico", 
      TRUE ~ "Normal"
    )
  )

# Filtrar el mapa para múltiples regiones
# Códigos Regionales: 06 (O'Higgins), 07 (Maule), 08 (Biobío), 16 (Ñuble)
mapa_base <- mapa_comunas %>% 
  filter(codigo_region %in% c("06", "07", "08", "16")) 

# Unir datos c/ nombres
mapa_final <- mapa_base %>% 
  left_join(datos_clasificados, by = "codigo_comuna") %>%
  left_join(codigos_territoriales, by = "codigo_comuna")

# Reparar geometría
mapa_final <- st_as_sf(mapa_final)

# Graficar
ggplot(mapa_final) + 
  geom_sf(aes(fill = categoria_color), color = "white", size = 0.1) +
  
  # Asignar el nombre a cada comuna en el mapa
  geom_sf_text(aes(label = nombre_comuna), size = 1, color = "black", check_overlap = TRUE) +
  
  scale_fill_manual(
    values = c(
      "Grupo Crítico" = "#FFD700",  
      "Normal"        = "#CDCDB4"   
    ),
    na.value = "#FFFFFF",
    name = "Indicadores"
  ) +
  theme_void() +
  labs(title = "Mapa Macro-zona Centro Sur")

# Guardar
ggsave("Output/mapa_macrozona_final.png", width = 12, height = 14, dpi = 300)

