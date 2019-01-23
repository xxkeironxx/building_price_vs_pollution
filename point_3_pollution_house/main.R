################################################################################
# To execute this file use:
#    souce("prepare_data.R")
################################################################################
#################################
# Preparing data
#################################
message("Setting up program..", appendLF=FALSE)
# Setting variables
idealista_data_folder = "../data_idealista/"
pollution_data_folder = "../data_pollution/"

# Load required files
viveros <- read.csv(
  paste(idealista_data_folder,'viveros.csv', sep=""),
  header=TRUE,
  sep=";"
);

avd_francia <- read.csv(
  paste(idealista_data_folder,'avd_francia.csv', sep=""),
  header=TRUE,
  sep=";"
);

boulevar_sur <- read.csv(
  paste(idealista_data_folder,'boulevar_sur.csv', sep=""),
  header=TRUE,
  sep=";"
);

universidad_politecnica <- read.csv(
  paste(idealista_data_folder,'universidad_politecnica.csv', sep=""),
  header=TRUE,
  sep=";"
);

moli_del_sol <- read.csv(
  paste(idealista_data_folder,'moli_del_sol.csv', sep=""),
  header=TRUE,
  sep=";"
);

pista_de_silla <- read.csv(
  paste(idealista_data_folder,'pista_de_silla.csv', sep=""),
  header=TRUE,
  sep=";"
);

idealista <- rbind(viveros, avd_francia, boulevar_sur, universidad_politecnica, moli_del_sol, pista_de_silla)

# Remove properties to anonimize data
idealista$propertyCode <- NULL
idealista$operation <- NULL
idealista$address <- NULL
idealista$province <- NULL
idealista$municipality <- NULL
idealista$district <- NULL
idealista$country <- NULL
idealista$neighborhood <- NULL
idealista$latitude <- NULL
idealista$longitude <- NULL
idealista$showAddress <- NULL
idealista$url <- NULL
idealista$hasPlan <- NULL
idealista$has3DTour <- NULL
idealista$has360 <- NULL
idealista$suggestedTexts_title <- NULL
idealista$suggestedTexts_subtitle <- NULL
idealista$thumbnail <- NULL
idealista$X <- NULL

# Typing logical values
idealista$hasLift <- as.logical(idealista$hasLift)
idealista$newDevelopment <- as.logical(idealista$newDevelopment)
idealista$hasVideo <- as.logical(idealista$hasVideo)
idealista$exterior <- as.logical(idealista$exterior)

# Typing factor values
idealista$point <- as.factor(idealista$point)
idealista$propertyType <- as.factor(idealista$propertyType)
idealista$detailedType_typology <- as.factor(idealista$detailedType_typology)
idealista$status <- as.factor(idealista$status)

# Typing integer values
idealista$numPhotos <- as.integer(idealista$numPhotos)
idealista$floor <- as.integer(idealista$floor)
idealista$price <- as.integer(idealista$price)
idealista$size <- as.integer(idealista$size)
idealista$rooms <- as.integer(idealista$rooms)
idealista$bathrooms <- as.integer(idealista$bathrooms)
idealista$distance <- as.integer(idealista$distance)
idealista$priceByArea <- as.integer(idealista$priceByArea)

# Removing values without 'hasLift' value
idealista <- idealista[!is.na(idealista$hasLift),]
# Updating factor "" to "unknown"
levels(idealista$status)<-c("unknown", "good", "newdevelopment", "renew")

message("done. All data is accesible in data.frame 'idealista'")




pollution_average <- read.csv(
  paste(pollution_data_folder,'average2016.csv', sep=""),
  header=TRUE,
  sep=";"
);

pollution_average$X <- NULL
names(pollution_average)<-c("cont","viveros","avd_francia","boulevar_sur","universidad_politecnica","moli_del_sol","pista_de_silla")


Ozono <- c(0)
NO <- c(0)
NO2 <- c(0)
PM10 <- c(0)
NOx <- c(0)

idealista <- cbind(idealista, Ozono, NO, NO2, PM10, NOx)

idealista[idealista$point=="viveros",]$Ozono <- pollution_average$viveros[1]
idealista[idealista$point=="avd_francia",]$Ozono <- pollution_average$avd_francia[1]
idealista[idealista$point=="boulevar_sur",]$Ozono <- pollution_average$boulevar_sur[1]
idealista[idealista$point=="universidad_politecnica",]$Ozono <- pollution_average$universidad_politecnica[1]
idealista[idealista$point=="moli_del_sol",]$Ozono <- pollution_average$moli_del_sol[1]
idealista[idealista$point=="pista_de_silla",]$Ozono <- pollution_average$pista_de_silla[1]

idealista[idealista$point=="viveros",]$NO <- pollution_average$viveros[2]
idealista[idealista$point=="avd_francia",]$NO <- pollution_average$avd_francia[2]
idealista[idealista$point=="boulevar_sur",]$NO <- pollution_average$boulevar_sur[2]
idealista[idealista$point=="universidad_politecnica",]$NO <- pollution_average$universidad_politecnica[2]
idealista[idealista$point=="moli_del_sol",]$NO <- pollution_average$moli_del_sol[2]
idealista[idealista$point=="pista_de_silla",]$NO <- pollution_average$pista_de_silla[2]

idealista[idealista$point=="viveros",]$NO2 <- pollution_average$viveros[3]
idealista[idealista$point=="avd_francia",]$NO2 <- pollution_average$avd_francia[3]
idealista[idealista$point=="boulevar_sur",]$NO2 <- pollution_average$boulevar_sur[3]
idealista[idealista$point=="universidad_politecnica",]$NO2 <- pollution_average$universidad_politecnica[3]
idealista[idealista$point=="moli_del_sol",]$NO2 <- pollution_average$moli_del_sol[3]
idealista[idealista$point=="pista_de_silla",]$NO2 <- pollution_average$pista_de_silla[3]


idealista[idealista$point=="viveros",]$PM10 <- pollution_average$viveros[4]
idealista[idealista$point=="avd_francia",]$PM10 <- pollution_average$avd_francia[4]
idealista[idealista$point=="boulevar_sur",]$PM10 <- pollution_average$boulevar_sur[4]
idealista[idealista$point=="universidad_politecnica",]$PM10 <- pollution_average$universidad_politecnica[4]
idealista[idealista$point=="moli_del_sol",]$PM10 <- pollution_average$moli_del_sol[4]
idealista[idealista$point=="pista_de_silla",]$PM10 <- pollution_average$pista_de_silla[4]


idealista[idealista$point=="viveros",]$NOx <- pollution_average$viveros[5]
idealista[idealista$point=="avd_francia",]$NOx <- pollution_average$avd_francia[5]
idealista[idealista$point=="boulevar_sur",]$NOx <- pollution_average$boulevar_sur[5]
idealista[idealista$point=="universidad_politecnica",]$NOx <- pollution_average$universidad_politecnica[5]
idealista[idealista$point=="moli_del_sol",]$NOx <- pollution_average$moli_del_sol[5]
idealista[idealista$point=="pista_de_silla",]$NOx <- pollution_average$pista_de_silla[5]




#################################
# Correlation matrix
#################################
message("Creating the correlation matrix..", appendLF=FALSE)
idealista_correlation <- data.frame(idealista$numPhotos,
  idealista$floor,
  idealista$price,
  idealista$size,
  idealista$rooms,
  idealista$bathrooms,
  idealista$distance,
  idealista$priceByArea,
  idealista$Ozono,
  idealista$NO,
  idealista$NO2,
  idealista$PM10,
  idealista$NOx
)

correlation_matrix <- cor(idealista_correlation)

write.table(correlation_matrix, "correlation_matrix.csv", sep=";")
message("done")

#################################
# Creating the model
#################################
message("Creating the model..", appendLF=FALSE)

sampleRows  <-  sample(1:nrow(idealista), size=0.25* nrow(idealista))
train   <-  idealista[-sampleRows,]
test    <-  idealista[sampleRows,]

linearModel <- lm(
    price ~ priceByArea + size + rooms + bathrooms + floor + numPhotos + distance
    + Ozono + NO + NO2 + PM10 + NOx,
    train
)

# Regression tree (CART) from the rpart package (set the parameter method to anova in order to produce a CART tree)
#library("rpart")
#regressionTree <- rpart(
  #price ~ priceByArea + size + rooms + bathrooms + floor + numPhotos + distance,
  #train
#)

# Neural network from the nnet package (set the parameters skip and linout-numerical output- to TRUE and size-hidden units- to 12).
#library("nnet")
#neuralNetwork <- nnet(
  #price ~ priceByArea + size + rooms + bathrooms + floor + numPhotos + distance,
  #train,
  #skip = TRUE,
  #linout = TRUE,
  #size = 12
#)
message("done")

#plotcp(regressionTree)

sink('model_summary.txt')
print(summary(linearModel))
sink()

#summary(regressionTree)
#summary(neuralNetwork)
library("Metrics")

predict_linearModel <- predict(linearModel,test)
#predict_regressionTree <- predict(regressionTree,test)
#predict_neuralNetwork <- predict(neuralNetwork,test)

rmse_value <- rmse(test$price, predict_linearModel)
#rmse(test$price, predict_regressionTree)
#rmse(test$price, predict_neuralNetwork)

mae_value <- mae(test$price, predict_linearModel)
#mae(test$price, predict_regressionTree)
#mae(test$price, predict_neuralNetwork)

model_validation <- data.frame(rmse_value, mae_value)
write.table(model_validation, file="model_validation.txt")