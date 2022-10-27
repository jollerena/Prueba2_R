

# PAQUETES A UTILIZAR -----------------------------------------------------


## INSTALACIÓN -------------------------------------------------------------
## Instalación de paquetes a utilizar en el Capítulo 2

#install.packages("tidyverse")
#install.packages("readxl")
#install.packages("haven")
#install.packages("lubridate")
#install.packages("hms")
install.packages("readxl")
install.packages("haven")
install.packages("lubridate")
install.packages("hms")


## CARGA DE PAQUETES -------------------------------------------------------
## Cargando paquetes a utilizar en el Capítulo 2

library(tidyverse)
library(readxl)
library(haven)
library(lubridate)
library(hms)


# IMPORTAR DATOS ----------------------------------------------------------

## CSV FILE ------------------------------------------------------------
## Importando archivos .csv
## únicamente especificando nombre de archivo, escribo la ruta
## realizo asignación para guardar el archivo en un objeto llamado players21

players21 <- read_csv('Datos_R/players_21.csv')



## XLS o XLSX FILE ---------------------------------------------------------
## importar desde Excel
## Podemos especificar el nombre del archivo, hoja y skip
## Guardo el archivo en un objeto llamado vuelos

vuelos <- read_excel("Datos_R/VentasVuelos.xlsx", 
                     sheet = "data", skip = 1)


## SAV y DTA FILE ----------------------------------------------------------------
## importar desde SPSS
## Guardo el archivo en un objeto llamado estres
estres <- read_sav("Datos_R/estres.sav")


## importar desde STATA
## Guardo el archivo en un objeto llamado pasajeros

pasajeros <- read_dta("Datos_R/pasajeros.dta")

view(pasajeros)


# PRÁCTICA 2.1 --------------------------------------------------------------
## 1. Cargar el archivo profesores.xlsx y guardarlo en un objeto llamado profesores
profesores <- read_excel("Datos_R/profesores.xlsx")

## 2. Cargar el archivo `BasePrograma.xlsx` y guardarlo en un objeto llamado baseprograma.

Base_Programa <- read_excel("Datos_R/BasePrograma.xlsx", sheet = "Respuestas")



# ESTRUCTURAS DE DATOS ----------------------------------------------------

## VECTORES ----------------------------------------------------------------
## vector de dimensión 1
x <- 4
is.vector(x) 


## creando vectores con concatenar c()
y <- c(11, 13, 15, 20)
y         
is.vector(y) 


## creando vectores de tipo caracter, elementos en comillas

z <- c("1", "5", "11", "14")
z
is.vector(z)

class(x)
class(y)
class(z)

## operaciones entre vectores de misma dimensión

w <- c(2,5,6,8)
w
class(w)
y + 2*w - 3

## función para conocer la longitud de los vectores
length(y)
length(z)

## indexación para extraer elementos
w
w[2]
w[-4]


## guardo en un objeto el nuevo vector




## DATA.FRAMES -------------------------------------------------------------

## crear un data.frame con vectores previamente creados
nombres <- c("Marcela Cox", "Luis Vargas", "David Mieles")
edades <- c(24,32,27)
seguro <- factor(c("IESS", "BMI", "IESS"))




## guardo el data.frame en el objeto pacientes
pacientes <- data.frame(nombres, edades, seguro)
pacientes


## cambiar el nombre de las columnas del data.frame desde su creación
pacientes2 <- data.frame(N1=nombres, N2=edades, seguro)
pacientes2


## cambiar nombres de columnas de data.frame existente
pacientes
names(pacientes) <- c("Name", "Age", "Insurance")
pacientes


## extraer la edad de David Mieles
pacientes[3,2]

## extraer toda la información de David Mieles
pacientes[3, ]

## consultar los valores de la columna de nombres
pacientes[, 1]
pacientes$Name

## conocer la media de las edades de los pacientes
mean(pacientes$Age)


## FUNCIONES BÁSICAS -------------------------------------------------------

## ¿Cuántas personas llenaron la encuesta?
profesores

dim(profesores)

## estructura de encuesta
str(profesores)

## nombres de columnas de la encuesta
colnames(profesores)

## Visualización de las primeras 5 encuestas
head(profesores)
head(profesores, n = 10)
## Visualización de las últimas 5 encuestas
tail(profesores)

## Total de alumnos con NEE que constan en la encuesta
sum(profesores$`No_Alumnos NEE`)

## Profesor más joven
min(profesores$Edad)

## Profesor de mayor edad
max(profesores$Edad)

## Resumen de la variable No_Alumnos
summary(profesores$No_Alumnos)
summary(profesores)




# TIPOS DE DATOS ----------------------------------------------------------

## NUMÉRICOS ---------------------------------------------------------------

## clase de un vector de 1 elemento
z
x
y
w

class(x)


## clase de la columna edades del dataset pacientes
pacientes
class(pacientes$Age)
## vector de tipo caracter
z
class(z)

## as.numeric()
## cambio de clase caracter a numérico con as.numeric()
as.numeric(z)
class(as.numeric(z))
## parse_number()
## cambio de clase caracter a numérico con parse_number()
class(parse_number(z))
#cambiar coma por punto
parse_number("6'758,56", locale = locale(decimal_mark = ",", grouping_mark = "'"))


## CADENA DE CARACTERES ----------------------------------------------------

## ¿Qué sucede cuando tus datos producidos no entienden UTF-8?
x1 <- "El Ni\xf1o was particularly bad this year"


## Para corregir el problema de codificación de caracteres
guess_encoding(charToRaw(x1))
parse_character(x1, locale = locale(encoding = "Latin1"))

## ¿Cómo encontrar la codificación correcta? 


## indica la clase de un texto



## indica el número de caracteres de una cadena.


## combina dos o más cadenas



## FACTORES ----------------------------------------------------------------

## creamos una variable que registra meses

fc1 <- c("Dic", "Abr", "Ene", "Mar")
class(fc1)


## defino la lista de niveles válidos
niveles_meses <- c("Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic")

## con la función factor() creo el factor
y1 <- factor(fc1, levels = niveles_meses)
class(y1)


## para acceder a los niveles del factor
levels(y1)


## FECHAS Y HORAS ----------------------------------------------------------

## parse_datetime()
## Dato de fecha-hora
fecha1 <- "2010-10-01T2010"



parse_datetime(fecha1)
## [1] "2010-10-01 20:10:00 UTC"



## parse_datetime()
## Si se omite la hora, será determinada como medianoche.
# Si se omite la hora, será determinada como medianoche.
fecha2 <- "20101010"
parse_datetime(fecha2)
## [1] "2010-10-10 UTC"


## parse_date() asume aaaa-mm-dd o aaaa/mm/dd.
fecha3 <- "2010-10-01"
parse_date(fecha3)
## [1] "2010-10-01"


## parse_time() espera la hh:mm:ss, los segundos y el especificador am/pm son opcionales
library(hms)
parse_time("01:10 am")
## 01:10:00
parse_time("20:10:01")
## 20:10:01


## Para obtener la fecha o fecha-hora actual 
today()
## [1] "2022-10-12"
now()
## [1] "2022-10-12 16:32:47 -05"


## DESDE CADENAS DE CARACTERES

ymd("2017-01-31")
## [1] "2017-01-31"
ymd("20170131")
## [1] "2017-01-31"

mdy("01-31-2017")
## [1] "2017-01-31"
mdy("01312017")
## [1] "2017-01-31"
dmy("31-01-2017")
## [1] "2017-01-31"
dmy("31012017")
## [1] "2017-01-31"
mdy_hm("01/31/2017 08:01")
## [1] "2017-01-31 08:01:00 UTC"
ymd_hms("2017-01-31 20:11:59")
## [1] "2017-01-31 20:11:59 UTC"

## DESDE COMPONENTES INDIVIDUALES

ejemplo <- data.frame(anio= c(1994, 1992, 1987),
                      dia= c(21, 02, 15),
                      mes= c(02, 04, 05),
                      hora= c(20, 14, 09),
                      minuto= c(45, 30, 15))
ejemplo
##   anio dia mes hora minuto
## 1 1994  21   2   20     45
## 2 1992   2   4   14     30
## 3 1987  15   5    9     15


## make_date() para crear fecha
## forma fecha que contiene dia, mes y anio
make_date(ejemplo$anio, ejemplo$mes, ejemplo$dia)
## [1] "1994-02-21" "1992-04-02" "1987-05-15"

## make_datetime() para crear fecha-hora
# forma fecha-hora
make_datetime(ejemplo$anio, ejemplo$mes, ejemplo$dia, ejemplo$hora, ejemplo$minuto)
## [1] "1994-02-21 20:45:00 UTC" "1992-04-02 14:30:00 UTC"
## [3] "1987-05-15 09:15:00 UTC"

## DESDE OTROS TIPOS
as_datetime(today())
## [1] "2022-10-12 UTC"
as_date(now())
## [1] "2022-10-12"




# PRÁCTICA 2.2 --------------------------------------------------------------

## 1. Verifica la estructura del data set `profesores` y define el tipo de cada variable
str(profesores)
unique(profesores$Tiempo_impartiendo_docencia)
## 2. Prepare el data set para el análisis verificando que el tipo de dato de cada variable sea el adecuado, corríjalos.



## Fecha: cambio de tipo POSIXct a tipo Date
profesores$Fecha <-  as_date(profesores$Fecha)
str(profesores)

## Tiempo impartiendo docencia: cambio de tipo caracter a factor
profesores$Tiempo_impartiendo_docencia <- factor(profesores$Tiempo_impartiendo_docencia, 
                                                 levels = c("Menos de 3 años", "De 3 a 6 años", "Más de 6 años"))
class(profesores$Tiempo_impartiendo_docencia)
## AD es necesaria: cambio de tipo caracter a factor

profesores$AD_es_necesaria <- factor(profesores$AD_es_necesaria, levels = c(1,2,3,4,5))
class(profesores$AD_es_necesaria)

## AD es necesaria: recodifico los niveles
profesores$AD_es_necesaria <- fct_recode(profesores$AD_es_necesaria, "Totalmente en desacuerdo" = "1",
                                         "En desacuerdo" = "2", "Ni de acuerdo ni en desacuerdo" = "3",
                                         "De acuerdo" = "4", "Totalmente de acuerdo" = "5")
levels(profesores$AD_es_necesaria)



##AD en cualquier asignatura: cambio de tipo caracter a factor
profesores$AD_en_cualquier_asignatura <- factor(profesores$AD_en_cualquier_asignatura, levels = c(1,2,3,4,5))
class(profesores$AD_en_cualquier_asignatura)




##AD en cualquier asignatura: recodifico los niveles
profesores$AD_en_cualquier_asignatura <- fct_recode(profesores$AD_en_cualquier_asignatura, "Totalmente en desacuerdo" = "1",
                                                    "En desacuerdo" = "2", "Ni de acuerdo ni en desacuerdo" = "3",
                                                    "De acuerdo" = "4", "Totalmente de acuerdo" = "5")
levels(profesores$AD_en_cualquier_asignatura)


## Leyes para ANEE: cambio de tipo caracter a factor
profesores$Leyes_para_ANEE <- factor(profesores$Leyes_para_ANEE, levels = c(1,2,3,4,5))
class(profesores$Leyes_para_ANEE)

## Leyes para ANEE: recodifico los niveles
profesores$Leyes_para_ANEE <- fct_recode(profesores$Leyes_para_ANEE, "Totalmente en desacuerdo" = "1",
                                                    "En desacuerdo" = "2", "Ni de acuerdo ni en desacuerdo" = "3",
                                                    "De acuerdo" = "4", "Totalmente de acuerdo" = "5")
levels(profesores$Leyes_para_ANEE)

## Ratio de ANEE: cambio de tipo caracter a factor
profesores$Ratio_de_ANEE <- factor(profesores$Ratio_de_ANEE, levels = c(1,2,3,4,5))
class(profesores$Ratio_de_ANEE)

## Ratio de ANEE: recodifico los niveles
profesores$Ratio_de_ANEE <- fct_recode(profesores$Ratio_de_ANEE, "Totalmente en desacuerdo" = "1",
                                         "En desacuerdo" = "2", "Ni de acuerdo ni en desacuerdo" = "3",
                                         "De acuerdo" = "4", "Totalmente de acuerdo" = "5")
levels(profesores$Ratio_de_ANEE)

## Asistente: cambio de tipo caracter a factor
profesores$Asistente_de_clases <- factor(profesores$Asistente_de_clases, levels = c(1,2,3,4,5))
class(profesores$Asistente_de_clases)

## Asistente: recodifico los niveles
profesores$Asistente_de_clases <- fct_recode(profesores$Asistente_de_clases, "Totalmente en desacuerdo" = "1",
                                       "En desacuerdo" = "2", "Ni de acuerdo ni en desacuerdo" = "3",
                                       "De acuerdo" = "4", "Totalmente de acuerdo" = "5")
levels(profesores$Asistente_de_clases)

## Instrucción: cambio de tipo caracter a factor
profesores$Suficiente_instruccion <- factor(profesores$Suficiente_instruccion, levels = c(1,2,3,4,5))
class(profesores$Suficiente_instruccion)

## Instrucción: recodifico los niveles
profesores$Suficiente_instruccion <- fct_recode(profesores$Suficiente_instruccion, "Totalmente en desacuerdo" = "1",
                                             "En desacuerdo" = "2", "Ni de acuerdo ni en desacuerdo" = "3",
                                             "De acuerdo" = "4", "Totalmente de acuerdo" = "5")
levels(profesores$Suficiente_instruccion)

## 3. Guarde el data set en un archivo excel en su computadora `r_profesores`.
str(profesores)


## para guardar varias hojas en un archivo excel
# Hecho por la profe
library(openxlsx)

write.xlsx(profesores, file = "Datos_R/r_profesores_mod.xlsx")

#Mio

install.packages("writexl")
library("writexl")
write_xlsx(profesores,"r_profesores.xlsx")


## para guardar objeto (menos espacio)
# Hecho por la profe

wb <- createWorkbook()
addWorksheet(wb, "profesores")
addWorksheet(wb, "pacientes")
addWorksheet(wb, "Base_Programa")

writeData(wb, "profesores", profesores)
writeData(wb, "pacientes", pacientes)
writeData(wb, "Base_Programa", Base_Programa)

saveWorkbook(wb, file = "Datos_R/prueba_r.xlsx", overwrite = TRUE)

# MIO 
install.packages('openxlsx')

library(openxlsx)

r_profesores <- write.xlsx(profesores,".xlsx")
saveWorkbook(r_profesores, 
             file = 'C:/Users/usuario/Desktop/Programa_Estadistica_Aplicada_InvCientifica/Software_manejo_datos/clase2_R/Datos_R/r_profesores.xlsx', 
             overwrite = TRUE)


## guardar en un nuevo objeto el data set corregido
# Hecho por la profe

# Para exportar en SPSS

write_sav(profesores2, "Datos_R/profesores_spss.sav")

# Para exportar en STATA

write_dta(profesores2, "Datos_R/profesores_stata.dta")

# Para exportar en RDS

write_rds(profesores2, "Datos_R/profesores_rds.rds")



# MIO

write.xlsx(profesores, file = "r_profesores2.xlsx",
           sheetName = "Respuestas de formulario 1", append = FALSE)

r_profesores2 <- read_xlsx("C:/Users/usuario/Desktop/Programa_Estadistica_Aplicada_InvCientifica/Software_manejo_datos/clase2_R/r_profesores2.xlsx")


## 4. Extraer la información del 6to encuestado.

profesores2 <- profesores[6,]
view(profesores2)

profesores %>% filter(row_number()==6) %>% View()

## 5. Extraer la siguiente información del 5to encuestado: edad, género 
## y si considera que la atención a la diversidad es necesaria.

profesores3 <- c(profesores[5,2], profesores[5,3], profesores[5,8])
view(profesores3)

profesores %>% filter(row_number()==5) %>% select(c(-Fecha, -Nivel_docencia,
                                                    -Tiempo_impartiendo_docencia,
                                                    -No_Alumnos, -`No_Alumnos NEE`,
                                                    -AD_en_cualquier_asignatura,
                                                    -Leyes_para_ANEE, -Ratio_de_ANEE,
                                                    -Asistente_de_clases, 
                                                    -Suficiente_instruccion,
                                                    -Material_utilizado)) %>% view()
str(profesores)


profesores[5, c(2,3,8)]



# Practice 2.3 ------------------------------------------------------------

## 1. Check the structure of the data set and define the type of each variable.baseprograma

baseprograma <- read_excel("Datos_R/BasePrograma.xlsx", sheet = "Respuestas")

str(baseprograma)

## 2. Prepare the data set for analysis verifying that the data type of each variable 
## is appropriate, correct them.


## Genero: cambio de tipo numerico a factor
baseprograma$Genero <- factor(baseprograma$Genero, levels = c(1,2,3))
class(baseprograma$Genero)

## Genero: recodifico los niveles
baseprograma$Genero <- fct_recode(baseprograma$Genero, "Mujer" = "1",
                                                "LGBTI" = "2", "Hombre" = "3")
levels(baseprograma$Genero)

baseprograma$Genero <- as.character(baseprograma$Genero)

str(baseprograma)

## Tiene mascota: cambio de tipo numerico a factor
unique(baseprograma$`Tiene Mascota`)

baseprograma$`Tiene Mascota` <- factor(baseprograma$`Tiene Mascota`, levels = c(0,1))
class(baseprograma$`Tiene Mascota`)


## Tiene mascota: recodifico los niveles
baseprograma$`Tiene Mascota` <- fct_recode(baseprograma$`Tiene Mascota`, "No tiene mascota" = "0",
                                  "Tiene mascota" = "1")
levels(baseprograma$`Tiene Mascota`)

baseprograma$`Tiene Mascota` <- as.character(baseprograma$`Tiene Mascota`)

str(baseprograma)

## Nivel de Escolaridad: cambio de tipo caracter a factor
unique(baseprograma$`Nivel de Escolaridad`)

baseprograma$`Nivel de Escolaridad` <- factor(baseprograma$`Nivel de Escolaridad`, 
                                              levels = c("Pregrado", "Posgrado", "Colegio"))

str(baseprograma)

colnames(baseprograma)


## 3. Save the co-edited data set to an excel file on your computer.r_programa

library(openxlsx)

write.xlsx(baseprograma, file = "Datos_R/r_programa.xlsx")


## 4. Extract the information of the 5th respondent.

baseprograma[5,] %>% view()


## 5. Extract the height and age of the 9th respondent.

c(baseprograma[9,4], baseprograma[9,5]) %>% view()

baseprograma[9, c(4,5)] %>% view()
