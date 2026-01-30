# IPRE Verano 2026

# "Climate change and urban health: how temperature and city structure relate to preterm birth, 1992-2020"

**Profesora Guía:** Estela Blanco  - College UC y Escuela de Salud Pública, Pontificia Universidad Católica de Chile

**Ayudante de investigación:** Martina González – Estudiante de College en Ciencias Sociales, Pontificia Universidad Católica de Chile

## Descripción General del Proyecto
La siguiente investigación fue enfocada en:
- **Objetivo general**: Contribuir al análisis del impacto de la exposición a las olas de calor sobre el riesgo de un parto prematuro en Chile.
- **Objetivos específicos**:
  1. Determinar la delimitación territorial del proyecto mediante una búsqueda y análisis de información disponible.
  2. Apoyar la preparación, organización y depuración de las bases de datos para los análisis estadísticos del proyecto.
  3. Replicar análisis previo sobre datos disponibles de olas de calor y de parto prematuro en la nueva delimitación territorial definida.
  4. Colaborar en la interpretación de resultados y en la elaboración de reportes parciales.
 
## Origen y Fuentes de los Datos
* `HeatWave_PretermBirth_Chile`- Repertorio original compartido por José Daniel Conejeros, UC https://github.com/ClimChange-NewbornHealth/HeatWave_PretermBirth_Chile
  + `births_1992_2020.RData` - Cleaned birth records
  + `hw_data_1980_2021.RData` - Processed heat wave data

## Estructura y Organización de Archivos
+ `MapaComunal.R`: Código para mapear los resultados obtenidos sobre olas de calor según las comunas específicas que cumplieran con los requisitos establecitos de filtro (p90> 30°C && p95> 31°C && p99> 33°C); Destinado a su uso en una región determinada.

+ `MapaRegional.R`: Código para mapear los resultados obtenidos sobre olas de calor según las comunas específicas que cumplieran con los requisitos establecitos de filtro (p90> 30°C && p95> 31° && p99> 33°C); Destinado a uso multiregional para análisis de perspectiva.

+ `FiltroRegionalBW.R`: Código para filtrar la base de datos original y obtener los datos de nacimiento en una región en específico.
  
+ `FiltroRegionalHW.R`: Código para filtrar la base de datos original y obtener los datos de calor en una región en específico.

+ `CruceDatos/HWxBW.R`: Código para crear una tabla de cruce de datos entre los percentiles de olas de calor y la cantidad de partos normales, y pretérmino, en las comunas especificas de cada región.

## Resultados

## Delimitación Territorial y Caracterización de la Muestra
La investigación se centró en la zona centro-sur de Chile, abarcando las regiones de **O'Higgins, Maule, Bío Bío y Ñuble**.

* **Delimitación Geográfica:** 117 comunas analizadas.
* **Muestra de Nacimientos:** Total de **1,545,781** partos registrados en el periodo 1992-2020 en la zona escogida.
* **Casos de Interés:** 79,162 partos pretérmino.
* **Prevalencia Global:** 5.12%.

## Clasificación Térmica de las Comunas
Se clasificaron las comunas en dos grupos ("Crítica" y "No Crítica") basándose en la exposición a olas de calor durante los meses de calor (noviembre-marzo).

> **Criterio de Inclusión (Comuna Crítica):**
> `p90 >= 30°C` AND `p95 >= 31°C` AND `p99 >= 33°C`

### Distribución de Comunas
| Clasificación | Cantidad | Porcentaje |
| :--- | :---: | :---: |
| **Comuna Crítica** (1) | 62 | 53.0% |
| **No Crítica** (0) | 55 | 47.0% |

### Perfil Térmico por Grupo (Promedios)
Las comunas críticas mostraron una diferencia significativa en sus perfiles de temperatura extrema en comparación con las zonas no críticas.

| Variable | Comuna Crítica (°C) | Comuna No Crítica (°C) | Diferencia |
| :--- | :---: | :---: | :---: |
| **P90** (Tmax) | 31.5 | 25.7 | +5.8 |
| **P95** (Tmax) | 32.3 | 26.7 | +5.6 |
| **P99** (Tmax) | 34.0 | 28.5 | +5.5 |


> **Mapa Zona Geográfica Completa**

![O'Higgins](https://github.com/martinagonzaramos/IPRE--Enero2026-/blob/main/Anexos/Mapacompleto.png)

> *Mapas individuales de cada región estarán expuestos al final en sección Anexos y en carpeta de repositorio de mismo nombre*

Se derivan las siguientes conclusiones principales en base a dispersión territorial:

* Las comunas identificadas como críticas se concentran casi exclusivamente en el valle central. Se presenta una hipótesis sobre la estructura geomorfológica de la depresión intermedia y un posible rol como un amplificador de olas de calor. Las capitales regionales y la mayor parte de la población urbana interior están expuestas a temperaturas extremas sistemáticamente superiores (en promedio **+5.5°C** en eventos P99) respecto a las zonas costeras.

## Asociación con Partos Pretérmino
Se analizó la tasa de partos pretérmino en función de la clasificación térmica de la comuna de residencia materna.

* **Total Partos en Zonas Críticas:** 737,384
* **Total Partos en Zonas No Críticas:** 808,397

**Tasas de Prematuridad Observadas:**

| Grupo | Total Partos | Partos Pretérmino | Tasa (%) |
| :--- | :---: | :---: | :---: |
| **No Crítica** | 808,397 | 42,366 | **5.24%** |
| **Crítica** | 737,384 | 36,796 | **4.99%** |


* En el análisis descriptivo, las comunas expuestas a mayores temperaturas extremas ("Críticas") presentaron una tasa de partos pretérmino levemente inferior (4.99%) respecto a las comunas con temperaturas más moderadas (5.24%). Esto sugiere la presencia de factores de confusión (e.g., densidad urbana, nivel socioeconómico, ubicación costera) que requieren un ajuste multivariable en etapas posteriores del análisis.
* La identificación de 62 comunas que superan sistemáticamente los umbrales de seguridad térmica constituye una señal para crear un enfoque regional genérico hacia estrategias territorialmente diferenciadas, que priorice un control de riesgo de embarazos en los meses de calor, específicamente en las zonas del valle central identificadas.


## Anexos
### I. Tabla Cruce de datos HWxBW

> **Leyenda**
> + `Comuna`: Comuna a la cual pertenecen los valores presentados.
> + `p90_tmax`: Percentil 90. Umbral de calor frecuente.
> + `p95_tmax`: Percentil 95. Eventos de calor inusuales.
> + `p99_tmax`: Percentil 99. Olas de calor extremo.
> + `Comuna crítica`: Indica si cumple con los criterios de inclusión de temperaturas extremas en meses de calor. (1 = Sí / 0 = No)
> + `Partos Pretérmino`: Cantidad total de partos prematuros en la comuna.
> + `Partos Totales`: Cantidad total de partos en la comuna.
> + `%`: Valor porcentaje de Tasa de partos pretérmino en la comuna. (En relación a partos totales)

| Comuna              | p90_tmax | p95_tmax | p99_tmax | Comuna crítica | Partos Pretérmino | Partos Totales | %   |
|---------------------|----------|----------|----------|----------------|-------------------|----------------|-----|
| Rancagua            | 30.7     | 31.5     | 33.1     | 1              | 5111              | 102101         | 5.0 |
| Codegua             | 26.7     | 27.5     | 29.1     | 0              | 226               | 4845           | 4.7 |
| Coinco              | 32.2     | 33.0     | 34.4     | 1              | 130               | 2560           | 5.1 |
| Coltauco            | 30.7     | 31.5     | 33.0     | 1              | 339               | 7141           | 4.7 |
| Donihue             | 30.6     | 31.4     | 32.9     | 1              | 394               | 7963           | 4.9 |
| Graneros            | 31.4     | 32.2     | 33.8     | 1              | 669               | 13567          | 4.9 |
| Las Cabras          | 31.4     | 32.2     | 33.8     | 1              | 382               | 8298           | 4.6 |
| Machali             | 19.5     | 20.4     | 21.9     | 0              | 848               | 16339          | 5.2 |
| Malloa              | 30.1     | 30.9     | 32.2     | 1              | 212               | 4994           | 4.2 |
| Mostazal            | 26.3     | 27.1     | 28.7     | 0              | 491               | 9704           | 5.1 |
| Olivar              | 32.0     | 32.8     | 34.2     | 1              | 260               | 5704           | 4.6 |
| Peumo               | 31.6     | 32.4     | 33.9     | 1              | 233               | 5712           | 4.1 |
| Pichidegua          | 32.6     | 33.4     | 34.9     | 1              | 319               | 6678           | 4.8 |
| Quinta de Tilcoco   | 32.3     | 33.1     | 34.5     | 1              | 206               | 4608           | 4.5 |
| Rengo               | 26.5     | 27.2     | 28.7     | 0              | 1128              | 23931          | 4.7 |
| Requinoa            | 27.5     | 28.2     | 29.7     | 0              | 496               | 10306          | 4.8 |
| San Vicente         | 32.2     | 32.9     | 34.3     | 1              | 743               | 16418          | 4.5 |
| Pichilemu           | 26.3     | 27.0     | 28.5     | 0              | 255               | 4960           | 5.1 |
| La Estrella         | 31.8     | 32.5     | 34.2     | 1              | 49                | 927            | 5.3 |
| Litueche            | 27.9     | 28.7     | 30.3     | 0              | 115               | 2029           | 5.7 |
| Marchihue           | 31.5     | 32.3     | 33.9     | 1              | 104               | 2410           | 4.3 |
| Navidad             | 25.1     | 25.8     | 27.4     | 0              | 74                | 1568           | 4.7 |
| Paredones           | 28.8     | 29.7     | 31.3     | 0              | 80                | 2082           | 3.8 |
| San Fernando        | 21.5     | 22.3     | 23.7     | 0              | 1726              | 30899          | 5.6 |
| Chepica             | 32.0     | 32.7     | 34.1     | 1              | 280               | 5213           | 5.4 |
| Chimbarongo         | 31.4     | 32.1     | 33.4     | 1              | 721               | 13510          | 5.3 |
| Lolol               | 31.6     | 32.4     | 33.8     | 1              | 110               | 2152           | 5.1 |
| Nancagua            | 32.3     | 33.0     | 34.3     | 1              | 389               | 6642           | 5.9 |
| Palmilla            | 32.8     | 33.5     | 35.0     | 1              | 217               | 4047           | 5.4 |
| Peralillo           | 32.8     | 33.6     | 35.2     | 1              | 192               | 3632           | 5.3 |
| Placilla            | 31.9     | 32.6     | 34.0     | 1              | 169               | 2788           | 6.1 |
| Pumanque            | 31.7     | 32.5     | 34.0     | 1              | 50                | 911            | 5.5 |
| Santa Cruz          | 32.1     | 32.8     | 34.3     | 1              | 734               | 13614          | 5.4 |
| Talca               | 32.7     | 33.4     | 34.6     | 1              | 4626              | 90964          | 5.1 |
| Constitucion        | 26.2     | 27.0     | 28.5     | 0              | 914               | 21981          | 4.2 |
| Curepto             | 29.9     | 30.8     | 32.4     | 1              | 153               | 3435           | 4.5 |
| Empedrado           | 27.8     | 28.7     | 30.3     | 0              | 69                | 1578           | 4.4 |
| Maule               | 32.6     | 33.4     | 34.6     | 1              | 607               | 12535          | 4.8 |
| Pelarco             | 31.7     | 32.4     | 33.7     | 1              | 169               | 3565           | 4.7 |
| Pencahue            | 32.1     | 32.9     | 34.3     | 1              | 136               | 2825           | 4.8 |
| Rio Claro           | 31.1     | 31.8     | 33.1     | 1              | 247               | 4834           | 5.1 |
| San Clemente        | 23.9     | 24.9     | 26.4     | 0              | 791               | 16309          | 4.9 |
| San Rafael          | 32.9     | 33.6     | 34.8     | 1              | 146               | 2716           | 5.4 |
| Cauquenes           | 30.6     | 31.5     | 33.1     | 1              | 675               | 16883          | 4.0 |
| Chanco              | 23.8     | 24.5     | 25.9     | 0              | 141               | 3650           | 3.9 |
| Pelluhue            | 22.0     | 22.8     | 24.2     | 0              | 96                | 2243           | 4.3 |
| Curico              | 25.2     | 26.0     | 27.5     | 0              | 3019              | 58707          | 5.1 |
| Hualane             | 32.0     | 32.8     | 34.3     | 1              | 148               | 3453           | 4.3 |
| Licanten            | 26.5     | 27.2     | 28.8     | 0              | 123               | 2555           | 4.8 |
| Molina              | 24.5     | 25.3     | 26.9     | 0              | 818               | 16738          | 4.9 |
| Rauco               | 32.1     | 32.8     | 34.1     | 1              | 180               | 3403           | 5.3 |
| Romeral             | 23.6     | 24.5     | 26.0     | 0              | 286               | 5193           | 5.5 |
| Sagrada Familia     | 32.6     | 33.2     | 34.6     | 1              | 321               | 6239           | 5.1 |
| Teno                | 30.1     | 30.8     | 32.3     | 1              | 499               | 10321          | 4.8 |
| Vichuquen           | 27.2     | 28.0     | 29.6     | 0              | 65                | 1561           | 4.2 |
| Linares             | 27.4     | 28.3     | 29.8     | 0              | 1853              | 37702          | 4.9 |
| Colbun              | 24.8     | 26.0     | 27.8     | 0              | 400               | 7421           | 5.4 |
| Longavi             | 28.6     | 29.4     | 31.0     | 0              | 616               | 11216          | 5.5 |
| Parral              | 29.6     | 30.5     | 32.1     | 1              | 858               | 16480          | 5.2 |
| Retiro              | 32.5     | 33.3     | 34.8     | 1              | 338               | 7079           | 4.8 |
| San Javier          | 32.3     | 33.1     | 34.5     | 1              | 792               | 17062          | 4.6 |
| Villa Alegre        | 32.2     | 33.0     | 34.2     | 1              | 257               | 5213           | 4.9 |
| Yerbas Buenas       | 31.9     | 32.6     | 33.9     | 1              | 346               | 6496           | 5.3 |
| Concepcion          | 27.8     | 29.0     | 31.1     | 0              | 5512              | 97323          | 5.7 |
| Coronel             | 25.6     | 26.7     | 28.5     | 0              | 2395              | 44369          | 5.4 |
| Chiguayante         | 27.2     | 28.5     | 30.6     | 0              | 1658              | 25612          | 6.5 |
| Florida             | 29.8     | 31.0     | 33.1     | 1              | 198               | 3535           | 5.6 |
| Hualqui             | 29.8     | 31.0     | 33.3     | 1              | 485               | 8371           | 5.8 |
| Lota                | 26.5     | 27.6     | 29.8     | 0              | 978               | 21018          | 4.7 |
| Penco               | 27.3     | 28.4     | 30.6     | 0              | 971               | 18659          | 5.2 |
| San Pedro de la Paz | 25.4     | 26.4     | 28.4     | 0              | 2627              | 38493          | 6.8 |
| Santa Juana         | 29.4     | 30.6     | 32.9     | 1              | 291               | 5148           | 5.7 |
| Talcahuano          | 24.4     | 25.3     | 27.3     | 0              | 4521              | 86363          | 5.2 |
| Tome                | 26.6     | 27.7     | 29.6     | 0              | 914               | 20613          | 4.4 |
| Hualpen             | 24.2     | 25.2     | 27.1     | 0              | 1143              | 18423          | 6.2 |
| Lebu                | 20.1     | 20.7     | 22.2     | 0              | 518               | 11152          | 4.6 |
| Arauco              | 23.4     | 24.2     | 26.0     | 0              | 898               | 15037          | 6.0 |
| Canete              | 23.8     | 24.9     | 27.2     | 0              | 704               | 14260          | 4.9 |
| Contulmo            | 25.4     | 26.6     | 29.5     | 0              | 134               | 2327           | 5.8 |
| Curanilahue         | 25.6     | 26.7     | 28.9     | 0              | 761               | 14791          | 5.1 |
| Los Alamos          | 23.3     | 24.3     | 26.4     | 0              | 422               | 8540           | 4.9 |
| Tirua               | 22.1     | 23.0     | 25.6     | 0              | 227               | 4531           | 5.0 |
| Los Angeles         | 30.9     | 32.1     | 34.1     | 1              | 4470              | 83455          | 5.4 |
| Antuco              | 24.4     | 25.7     | 27.9     | 0              | 70                | 1523           | 4.6 |
| Cabrero             | 31.2     | 32.3     | 34.2     | 1              | 494               | 10457          | 4.7 |
| Laja                | 31.4     | 32.6     | 34.6     | 1              | 474               | 9760           | 4.9 |
| Mulchen             | 28.1     | 29.4     | 31.8     | 0              | 606               | 12502          | 4.8 |
| Nacimiento          | 29.8     | 31.0     | 33.0     | 1              | 533               | 11987          | 4.4 |
| Negrete             | 31.2     | 32.4     | 34.5     | 1              | 156               | 3614           | 4.3 |
| Quilaco             | 26.2     | 27.7     | 29.8     | 0              | 60                | 1230           | 4.9 |
| Quilleco            | 27.8     | 29.0     | 31.2     | 0              | 160               | 3478           | 4.6 |
| San Rosendo         | 31.2     | 32.3     | 34.5     | 1              | 52                | 1497           | 3.5 |
| Santa Barbara       | 26.5     | 27.8     | 30.1     | 0              | 297               | 6804           | 4.4 |
| Tucapel             | 26.5     | 27.6     | 29.7     | 0              | 202               | 5030           | 4.0 |
| Yumbel              | 31.2     | 32.3     | 34.3     | 1              | 376               | 7102           | 5.3 |
| Alto Biobio         | 24.7     | 26.1     | 28.6     | 0              | 104               | 2545           | 4.1 |
| Chillan             | 31.9     | 32.9     | 34.7     | 1              | 3629              | 74520          | 4.9 |
| Bulnes              | 31.6     | 32.6     | 34.5     | 1              | 395               | 8502           | 4.6 |
| Chillan Viejo       | 32.0     | 33.0     | 34.9     | 1              | 406               | 8223           | 4.9 |
| El Carmen           | 28.4     | 29.4     | 31.5     | 0              | 236               | 4945           | 4.8 |
| Pemuco              | 29.9     | 30.9     | 32.9     | 1              | 155               | 3059           | 5.1 |
| Pinto               | 24.9     | 26.1     | 28.0     | 0              | 182               | 3818           | 4.8 |
| Quillon             | 31.3     | 32.3     | 34.4     | 1              | 236               | 5258           | 4.5 |
| San Ignacio         | 31.0     | 32.0     | 33.9     | 1              | 244               | 5370           | 4.5 |
| Yungay              | 28.6     | 29.7     | 31.8     | 0              | 294               | 6443           | 4.6 |
| Quirihue            | 28.5     | 29.5     | 31.2     | 0              | 168               | 4244           | 4.0 |
| Cobquecura          | 23.6     | 24.5     | 26.2     | 0              | 63                | 1578           | 4.0 |
| Coelemu             | 27.9     | 28.9     | 30.9     | 0              | 290               | 6495           | 4.5 |
| Ninhue              | 31.2     | 32.2     | 34.0     | 1              | 80                | 1673           | 4.8 |
| Portezuelo          | 31.0     | 32.0     | 33.7     | 1              | 79                | 1847           | 4.3 |
| Ranquil             | 30.3     | 31.4     | 33.3     | 1              | 83                | 1732           | 4.8 |
| Treguaco            | 28.5     | 29.5     | 31.3     | 0              | 80                | 1656           | 4.8 |
| San Carlos          | 31.9     | 32.8     | 34.5     | 1              | 1080              | 20427          | 5.3 |
| Coihueco            | 26.9     | 27.9     | 29.9     | 0              | 476               | 9791           | 4.9 |
| Niquen              | 31.9     | 32.7     | 34.3     | 1              | 201               | 3481           | 5.8 |
| San Fabian          | 25.6     | 26.9     | 28.9     | 0              | 65                | 1287           | 5.1 |
| San Nicolas         | 32.2     | 33.1     | 34.9     | 1              | 168               | 3273           | 5.1 |

### II. Mapas Regionales de comunas críticas

![O'Higgins](https://github.com/martinagonzaramos/IPRE--Enero2026-/blob/main/Anexos/OHigginsmap.png)
![Maule](https://github.com/martinagonzaramos/IPRE--Enero2026-/blob/main/Anexos/Maulemap.png)
![Bío Bío](https://github.com/martinagonzaramos/IPRE--Enero2026-/blob/main/Anexos/Bi%CC%81oBi%CC%81omap.png)
![Ñuble](https://github.com/martinagonzaramos/IPRE--Enero2026-/blob/main/Anexos/N%CC%83ublemap.png)

## Contacto
Para consultas, contactar a Martina González [mgonzr@uc.cl](mailto:mgonzr@uc.cl) y/o Estela Blanco [estela.blanco@uc.cl](mailto:estela.blanco@uc.cl)
