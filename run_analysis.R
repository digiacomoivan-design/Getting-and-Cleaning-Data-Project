# run_analysis.R

library(dplyr)

# Scarico e scompatto il dataset
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, "dataset.zip")
unzip("dataset.zip")

# Leggo il file features.txt contenente i nomi delle colonne
features <- read.table("UCI HAR Dataset/features.txt")

# Leggo il file activity_labels.txt contenente le etichette delle attività
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))

# Leggo i dati di addestramento (soggetto, misurazioni, etichette delle attività)
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Leggo i dati di test (soggetto, misurazioni, etichette delle attività)
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Metto insieme training e test
x_merged <- rbind(x_train, x_test)
y_merged <- rbind(y_train, y_test)
subject_merged <- rbind(subject_train, subject_test)

# Assegno i nomi delle colonne
colnames(x_merged) <- features[,2]
colnames(y_merged) <- "activity"
colnames(subject_merged) <- "subject"

# Unisco i dataset
merged <- cbind(subject_merged, y_merged, x_merged)

# Estraggo solo le misure di media e deviazione standard
mean_std <- grepl("mean\\(\\)|std\\(\\)", features[,2])
tidy <- merged[, c(TRUE, TRUE, mean_std)]

# Sostituisco i codici delle attività con i nomi
tidy$activity <- activities[tidy$activity, 2]

# Modifico i nomi delle variabili in modo che siano più leggibili
names(tidy) <- names(tidy) %>%
  gsub("^t", "Time", .) %>%
  gsub("^f", "Frequency", .) %>%
  gsub("Acc", "Accelerometer", .) %>%
  gsub("Gyro", "Gyroscope", .) %>%
  gsub("Mag", "Magnitude", .) %>%
  gsub("BodyBody", "Body", .) %>%
  gsub("-mean\\(\\)", "Mean", .) %>%
  gsub("-std\\(\\)", "StandardDeviation", .) %>%
  gsub("Freq\\(\\)", "Frequency", .) %>%
  gsub("gravity", "Gravity", .)


# Creo il dataset finale con la media per soggetto e attività
finalData <- tidy %>%
  group_by(subject, activity) %>%
  summarise_all(mean)


# Ordino il dataset finale
finalData <- finalData[order(finalData$subject, finalData$activity),]

# Memorizzo il dataset finale su file
write.table(finalData, "tidy_data.txt", row.name=FALSE)


