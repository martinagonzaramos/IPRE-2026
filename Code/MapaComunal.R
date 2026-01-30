rm(list=ls())

library(chilemapas)
library(ggplot2)
library(dplyr)
library(readr)    
library(stringr) 
library(readxl)
library(sf)

# Cargar archivo
datos_externos <- read_excel("Output/Ref_temp_summerÑuble.xlsx")

# Lógica de clasificación
datos_clasificados <- datos_externos %>% 
  mutate(
    codigo_comuna = str_pad(as.character(com), width = 5, pad = "0"),
    categoria_color = case_when(
      p90_tmax > 30 & p95_tmax > 31 & p99_tmax > 33 ~ "Grupo Crítico", 
      TRUE ~ "Normal"
    )
  )

# Filtrar mapa base
mapa_base <- mapa_comunas %>% 
  filter(codigo_region == "16") 

# Unir con los datos de origen y asignar los nombres de cada comunas
mapa_final <- mapa_base %>% 
  left_join(datos_clasificados, by = "codigo_comuna") %>%
  left_join(codigos_territoriales, by = "codigo_comuna")

# Convertir a objeto espacial
mapa_final <- st_as_sf(mapa_final)

# Graficar
ggplot(mapa_final) + 
  # 1. Capa del mapa (colores)
  geom_sf(aes(fill = categoria_color), color = "white", size = 0.1) +
  
  # Escribir nombre de la comuna en el mapa
  geom_sf_text(aes(label = nombre_comuna), size = 2, color = "black", check_overlap = TRUE) +
  
  scale_fill_manual(
    values = c(
      "Grupo Crítico" = "#FFD700",  
      "Normal"        = "#CDCDB4"   
    ),
    na.value = "#FFFFFF",
    name = "Indicadores"
  ) +
  theme_void() +
  labs(title = "Mapa Región de Ñuble")

# Guardar
ggsave("Output/mapa_ñuble_final.png", width = 12, height = 10, dpi = 300)

  