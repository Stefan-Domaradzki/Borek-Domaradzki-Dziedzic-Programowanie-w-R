setwd("C:/Users/Stefan/Desktop/Legends of Programming/Borek-Domaradzki-Dziedzic-Programowanie-w-R") #Stefan sciezka

list.files()

#install.packages("stringi")
#install.packages("tidyverse")


library(stringi)
library(tidyverse)

# Importowanie i przygotowanie danych danych ----


# 26.05.22 Stefan

platinum_raw    <- read.csv("TFT_Platinum_MatchData.csv")
diamond_raw     <- read.csv("TFT_Diamond_MatchData.csv")
master_raw      <- read.csv("TFT_Master_MatchData.csv")
grandmaster_raw <- read.csv("TFT_Grandmaster_MatchData.csv")
challenger_raw  <- read.csv("TFT_Challenger_MatchData.csv")


#plik "itmes_id.csv" uprzednio oczyszczony poza r, baza byla produktem skryptu python
#wiec nie bylo sensu oczyszczac jej w R

#do itemow odwolywac sie po ich nr wiersza bo ten jest rowny numeru id
#zamiast 1:56 i osobna kolumna na id

items <- read.csv("items_id.csv")
items <- as.data.frame(items$item_id, row.names = rownames(items))


# Stefan koniec zmian

# 29.05.22 Stefan
for (row in (1:length(platinum_champion_stars))) {
  
}
test_platinum_player_items    <- na.omit(platinum_raw[,c(1,5,8)])

platinum_player_items    <- platinum_raw[,c(1,5,8)]
diamond_player_items     <- diamond_raw[,c(1,5,8)]
master_player_items      <- master_raw[,c(1,5,8)]
grandmaster_player_items <- grandmaster_raw[,c(1,5,8)]
challenger_player_items  <- challenger_raw[,c(1,5,8)]



# Stefan koniec zmian 
#02.06.22 Stefan

#przygotowanie tabeli pod statystyke poziomow postaci


platinum_champion_stars    <- platinum_raw[,c(1,5,8)]
diamond_champion_stars     <- diamond_raw[,c(1,5,8)]
master_champion_stars      <- master_raw[,c(1,5,8)]
grandmaster_champion_stars <- grandmaster_raw[,c(1,5,8)]
challenger_champion_stars  <- challenger_raw[,c(1,5,8)]


for (row in (1:length(platinum_champion_stars[,2]))) {
if (platinum_champion_stars[row,2] == 0) {platinum_champion_stars[row,] <- NA}
}
for (row in (1:length(diamond_champion_stars[,2]))) {
  if (diamond_champion_stars[row,2] == 0) {diamond_champion_stars[row,] <- NA}
}
for (row in (1:length(master_champion_stars[,2]))) {
  if (master_champion_stars[row,2] == 0) {master_champion_stars[row,] <- NA}
}
for (row in (1:length(grandmaster_champion_stars[,2]))) {
  if (grandmaster_champion_stars[row,2] == 0) {grandmaster_champion_stars[row,] <- NA}
}
for (row in (1:length(challenger_champion_stars[,2]))) {
  if (challenger_champion_stars[row,2] == 0) {challenger_champion_stars[row,] <- NA}
}


platinum_champion_stars    <- na.omit(platinum_champion_stars)
diamond_champion_stars     <- na.omit(diamond_champion_stars)
master_champion_stars      <- na.omit(master_champion_stars)
grandmaster_champion_stars <- na.omit(grandmaster_champion_stars)
challenger_champion_stars  <- na.omit(challenger_champion_stars)


platinum_champion_stars    <- platinum_champion_stars %>% add_column(champions_list = NA)
diamond_champion_stars     <- diamond_champion_stars %>% add_column(champions_list = NA)
master_champion_stars      <- master_champion_stars %>% add_column(champions_list = NA)
grandmaster_champion_stars <- grandmaster_champion_stars %>% add_column(champions_list = NA)
challenger_champion_stars  <- challenger_champion_stars %>% add_column(champions_list = NA)

platinum_champion_stars    <- platinum_champion_stars %>% add_column(star_list = NA)
diamond_champion_stars     <- diamond_champion_stars %>% add_column(star_list = NA)
master_champion_stars      <- master_champion_stars %>% add_column(star_list = NA)
grandmaster_champion_stars <- grandmaster_champion_stars %>% add_column(star_list = NA)
challenger_champion_stars  <- challenger_champion_stars %>% add_column(star_list = NA)


platinum_champion_stars$star_list    <- stri_extract_all_regex(platinum_champion_stars$champion,    ".star....")
diamond_champion_stars$star_list     <- stri_extract_all_regex(diamond_champion_stars$champion,     ".star....")
master_champion_stars$star_list      <- stri_extract_all_regex(master_champion_stars$champion,      ".star....")
grandmaster_champion_stars$star_list <- stri_extract_all_regex(grandmaster_champion_stars$champion, ".star....")
challenger_champion_stars$star_list  <- stri_extract_all_regex(challenger_champion_stars$champion,  ".star....")
                       
platinum_champion_stars$star_list    <- stri_extract_all_regex(platinum_champion_stars$star_list,    "[0-9]")
diamond_champion_stars$star_list     <- stri_extract_all_regex(diamond_champion_stars$star_list,     "[0-9]")
master_champion_stars$star_list      <- stri_extract_all_regex(master_champion_stars$star_list,      "[0-9]")
grandmaster_champion_stars$star_list <- stri_extract_all_regex(grandmaster_champion_stars$star_list, "[0-9]")
challenger_champion_stars$star_list  <- stri_extract_all_regex(challenger_champion_stars$star_list,  "[0-9]")

# zajecia 2 
#dodawanie kolumn aby rozdzielic ilosc postacni n-gwiazdkowych do nich

platinum_champion_stars    <- platinum_champion_stars    %>% add_column(star_1 = 0)
diamond_champion_stars     <- diamond_champion_stars     %>% add_column(star_1 = 0)
master_champion_stars      <- master_champion_stars      %>% add_column(star_1 = 0)
grandmaster_champion_stars <- grandmaster_champion_stars %>% add_column(star_1 = 0)
challenger_champion_stars  <- challenger_champion_stars  %>% add_column(star_1 = 0)

platinum_champion_stars    <- platinum_champion_stars    %>% add_column(star_2 = 0)
diamond_champion_stars     <- diamond_champion_stars     %>% add_column(star_2 = 0)
master_champion_stars      <- master_champion_stars      %>% add_column(star_2 = 0)
grandmaster_champion_stars <- grandmaster_champion_stars %>% add_column(star_2 = 0)
challenger_champion_stars  <- challenger_champion_stars  %>% add_column(star_2 = 0)

platinum_champion_stars    <- platinum_champion_stars    %>% add_column(star_3 = 0)
diamond_champion_stars     <- diamond_champion_stars     %>% add_column(star_3 = 0)
master_champion_stars      <- master_champion_stars      %>% add_column(star_3 = 0)
grandmaster_champion_stars <- grandmaster_champion_stars %>% add_column(star_3 = 0)
challenger_champion_stars  <- challenger_champion_stars  %>% add_column(star_3 = 0)

#row <- 0 

for (row in c(1:length(platinum_champion_stars[,1]))){
  champion_stars <- platinum_champion_stars[row,5][1]
  champion_stars <- as.numeric(unlist(champion_stars))
  
  #(length(champion_stars))  
  
  #str(champion_stars[1])
  
  champion_stars[c(1:3)]
  
  for(star in c(1:champion_stars)) {
    
      if (champion_stars[star] == 1){
        platinum_champion_stars[row,6] <- platinum_champion_stars[row,6] + 1
      }
    
      else if (champion_stars[star] == 2 ){
        platinum_champion_stars[row,7] <- platinum_champion_stars[row,7] + 1
      } 
    
      else {
        platinum_champion_stars[row,8] <- platinum_champion_stars[row,8] + 1
      }
  }
  print(row)
}

str(platinum_champion_stars[658,2])
is_empty(platinum_champion_stars[658,3])
print("koniec petli")                                        
                       
# Stefan koniec zmian 

# 02.06.2022 lukasz
# ilosc AFK-ow
platinum_raw1 <- platinum_raw[(platinum_raw$combination)=="{}",]
odsetek_afk <- nrow(platinum_raw1)/nrow(platinum_raw)
# srednia czasu trwania rozgrywki
srednia_sekundy <- mean(platinum_raw$gameDuration)
srednia_minuty <- round(srednia_sekundy/60) 
cat(srednia_minuty,"min")
#koniec zmian
