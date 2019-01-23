################################################################################
# Load required files                                                          #
############################                                                   #
# Files have been treated to erase unkown symbols in the header of each file   #
################################################################################

pollution_data_folder = "../data_pollution"

# Load station info
station_info <- read.csv(
  paste(pollution_data_folder,'estautomaticas.csv', sep="/"),
  sep=';'
);

# Load Avda Francia
avda_francia <- read.csv(
  paste(pollution_data_folder,'Avda_Francia.csv', sep="/"),
  , sep=';'
);

# Load Boulevar Sur
boulevar_sur <- read.csv(
  paste(pollution_data_folder,'Boulevar_Sur.csv', sep="/"),
  sep=';'
);

# Load Moli del sol
moli_del_sol <- read.csv(
  paste(pollution_data_folder,'Moli_Del_Sol.csv', sep="/"),
  sep=';'
);

# Load Pista de silla
pista_de_silla <- read.csv(
  paste(pollution_data_folder,'Pista_De_Silla.csv', sep="/"),
  sep=';'
);

# Load Universidad Politécnica
universidad_politecnica <- read.csv(
  paste(pollution_data_folder,'Universidad_Politecnica.csv', sep="/"),
  sep=';'
);

# Load Viveros
viveros <- read.csv(
  paste(pollution_data_folder,'Viveros.csv', sep="/"),
  sep=';'
);

###################################################
## Get the minimum distance between two stations ##
## 1,89km  -> 1890m                   945m       ##
###################################################

# Merge data frames
total_data <- merge(avda_francia, boulevar_sur, by="Fecha")

###########
# cambiar la codificación de los carácteres de UTF-8 a el que utiliza la unión europea
# para poder añadir más archivos sin problemas
###########