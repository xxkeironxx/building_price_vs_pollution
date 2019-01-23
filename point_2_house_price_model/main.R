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

#################################
# Creating plots and pictures
#################################
images_folder='../images/'

library("lattice")

# If there is a previous version of the variable, erase it
if(length(search()[search()=="idealista"]))
  detach(name=idealista, force=TRUE)

attach(idealista)
forplot <- make.groups(
  point                   = data.frame(value=point,                 point, status, price),
  #numPhotos               = data.frame(value=numPhotos,             point, status, price),
  #floor                   = data.frame(value=floor,                 point, status, price),
  propertyType            = data.frame(value=propertyType,          point, status, price),
  #size                    = data.frame(value=size,                  point, status, price),
  #exterior                = data.frame(value=exterior,              point, status, price),
  #rooms                   = data.frame(value=rooms,                 point, status, price),
  #bathrooms               = data.frame(value=bathrooms,             point, status, price),
  #distance                = data.frame(value=distance,              point, status, price),
  #hasVideo                = data.frame(value=hasVideo,              point, status, price),
  status                  = data.frame(value=status,                point, status, price)
  #newDevelopment          = data.frame(value=newDevelopment,        point, status, price),
  #hasLift                 = data.frame(value=hasLift,               point, status, price),
  #priceByArea             = data.frame(value=priceByArea,           point, status, price),
  #detailedType_typology   = data.frame(value=detailedType_typology, point, status, price)    
)
message("Creating general plot..", appendLF=FALSE)
png(paste(images_folder,"general.png", sep=""))
plot(idealista$price, idealista$forplot);
general_plot <- xyplot(price~value|which, data=forplot,scales=list(relation="free"));
print(general_plot)
dev.off()
message("done")

message("Creating distance plot..", appendLF=FALSE)
png(paste(images_folder,"distance.png", sep=""))
plot(idealista$distance,idealista$price, xlab="distance from environmental station", ylab="price",);
dev.off()
message("done")

message("Creating size plot..", appendLF=FALSE)
png(paste(images_folder,"size.png", sep=""))
plot(idealista$size, idealista$price, xlab="size", ylab="price");
dev.off()
message("done")

message("Creating priceByArea plot..", appendLF=FALSE)
png(paste(images_folder,"priceByArea.png", sep=""))
plot(idealista$priceByArea, idealista$price, xlab="priceByArea", ylab="price");
dev.off()
message("done")

message("Creating rooms plot..", appendLF=FALSE)
png(paste(images_folder,"rooms.png", sep=""))
plot(idealista$rooms, idealista$price, xlab="rooms", ylab="price");
dev.off()
message("done")

message("Creating bathrooms plot..", appendLF=FALSE)
png(paste(images_folder,"bathrooms.png", sep=""))
plot(idealista$bathrooms, idealista$price, xlab="bathrooms", ylab="price");
dev.off()
message("done")

message("Creating floor plot..", appendLF=FALSE)
png(paste(images_folder,"floor.png", sep=""))
plot(idealista$floor, idealista$price, xlab="floor", ylab="price");
dev.off()
message("done")

message("Creating propertyType plot..", appendLF=FALSE)
png(paste(images_folder,"propertyType.png", sep=""))
plot(idealista$propertyType, idealista$price, xlab="propertyType", ylab="price");
dev.off()
message("done")

message("Creating hasLift plot..", appendLF=FALSE)
png(paste(images_folder,"hasLift.png", sep=""))
plot(idealista$hasLift, idealista$price, xlab="hasLift", ylab="price");
dev.off()
message("done")

message("Creating hasVideo plot..", appendLF=FALSE)
png(paste(images_folder,"hasVideo.png", sep=""))
plot(idealista$hasVideo, idealista$price, xlab="hasVideo", ylab="price");
dev.off()
message("done")

message("Creating newDevelopment plot..", appendLF=FALSE)
png(paste(images_folder,"newDevelopment.png", sep=""))
plot(idealista$newDevelopment, idealista$price, xlab="newDevelopment", ylab="price");
dev.off()
message("done")

message("Creating exterior plot..", appendLF=FALSE)
png(paste(images_folder,"exterior.png", sep=""))
plot(idealista$exterior, idealista$price, xlab="exterior", ylab="price");
dev.off()
message("done")

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
  idealista$priceByArea
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
    price ~ priceByArea + size + rooms + bathrooms + floor + numPhotos + distance,
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