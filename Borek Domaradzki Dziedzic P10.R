setwd("C:/Users/ja/Documents/GitHub/Programowanie-w-R/") #Stefan sciezka

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


for (row in (1:length(platinum_raw[,5]))) {
  if (platinum_raw[row,5] == 0) {platinum_raw[row,] <- NA}
}
for (row in (1:length(diamond_raw[,2]))) {
  if (diamond_raw[row,5] == 0) {diamond_raw[row,] <- NA}
}
for (row in (1:length(master_raw[,2]))) {
  if (master_raw[row,5] == 0) {master_raw[row,] <- NA}
}
for (row in (1:length(grandmaster_raw[,2]))) {
  if (grandmaster_raw[row,5] == 0) {grandmaster_raw[row,] <- NA}
}
for (row in (1:length(challenger_raw[,2]))) {
  if (challenger_raw[row,5] == 0) {challenger_raw[row,] <- NA}
}


platinum_raw    <- na.omit(platinum_raw)
diamond_raw     <- na.omit(diamond_raw)
master_raw     <- na.omit(master_raw)
grandmaster_raw <- na.omit(grandmaster_raw)
challenger_raw  <- na.omit(challenger_raw)



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

             
# Stefan koniec zmian 

#05.06 Stefan #testowanie zliczania

#t_champion_stars[1] <- 2
#t_champion_stars
#str(t_champion_stars[[1]])


#?stri_split()
    
#t_champion_stars <- stri_split(t_champion_stars, "")
#(t_champion_stars <- as.numeric(champion_stars))
#t_champion_stars


#Stefan koniec zmian

#06.06 Stefan funkcje

countstars <- function(rank_champion_star) {for (row in c(1:length(rank_champion_star[,1]))){ 
  if(!is.na(rank_champion_star[row,5])) {
    
    champion_stars <- rank_champion_star[row,5][1]
    champion_stars <- as.numeric(strsplit(champion_stars[[1]],''))
    #length(champion_stars)
    #str(champion_stars)
    
    
    for(star in c(1:length(champion_stars))) {
      
      if (champion_stars[star] == 1){
        rank_champion_star[row,6] <- rank_champion_star[row,6] + 1
      }
      
      else if (champion_stars[star] == 2 ){
        rank_champion_star[row,7] <- rank_champion_star[row,7] + 1
      } 
      
      else {
        rank_champion_star[row,8] <- rank_champion_star[row,8] + 1
      }
      
    }
  }
  #print(row)
}
  
  print("end of loop")
  return(rank_champion_star)
}

platinum_champion_stars    <- countstars(platinum_champion_stars)
diamond_champion_stars     <- countstars(diamond_champion_stars)
master_champion_stars      <- countstars(master_champion_stars)
grandmaster_champion_stars <- countstars(grandmaster_champion_stars)
challenger_champion_stars  <- countstars(challenger_champion_stars)

?aggregate

stars_mean_rank <- function(rank_champion_star){
   rank_champion_star <- platinum_champion_stars
   m1 <- aggregate(rank_champion_star["star_1"],     rank_champion_star["Ranked"], mean)
   m2 <- aggregate(rank_champion_star["star_2"],     rank_champion_star["Ranked"], mean)
   m3 <- aggregate(rank_champion_star["star_3"],     rank_champion_star["Ranked"], mean)
  
   
   (df2 <- as.data.frame(m2[,2]))
   (df3 <- as.data.frame(m3[,2]))  
   
   rank_star_means <- as.data.frame(m1)
   rank_star_means <- cbind(rank_star_means, as.data.frame(m2[,2]))
   rank_star_means <- cbind(rank_star_means, as.data.frame(m3[,2]))
  
   colnames(rank_star_means) <- c("Ranked", "1 star", "2 star", "3 star")
   return(rank_star_means)
}
  
(plat_star_means        <- stars_mean_rank(platinum_champion_stars))
(diamond_star_means     <- stars_mean_rank(diamond_champion_stars))
(master_star_means      <- stars_mean_rank(master_champion_stars))
(grandmaster_star_means <- stars_mean_rank(grandmaster_champion_stars))
(challenger_star_means  <- stars_mean_rank(challenger_champion_stars))
#koniec zmian



# 02.06.2022 lukasz
# ilosc AFK-ow
platinum_raw1 <- platinum_raw[(platinum_raw$combination)=="{}",]
odsetek_afk <- nrow(platinum_raw1)/nrow(platinum_raw)
# srednia czasu trwania rozgrywki
srednia_sekundy <- mean(platinum_raw$gameDuration)
srednia_minuty <- round(srednia_sekundy/60) 
cat(srednia_minuty,"min")
#koniec zmian
