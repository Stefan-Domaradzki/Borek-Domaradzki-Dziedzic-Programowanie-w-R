setwd("C:/Users/ja/Documents/GitHub/Programowanie-w-R/") #Stefan sciezka

list.files()

#install.packages("stringi")
#install.packages("tidyverse")
install.packages("writexl")

library(stringi)
library(tidyverse)
library(writexl)


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
odsetek_afk_plat <- nrow(platinum_raw1)/nrow(platinum_raw)
diamond_raw1 <- diamond_raw[(diamond_raw$combination)=="{}",]
odsetek_afk_diamo <- nrow(diamond_raw1)/nrow(diamond_raw)
master_raw1 <- master_raw[(master_raw$combination)=="{}",]
odsetek_afk_master <- nrow(master_raw1)/nrow(master_raw)
grandmaster_raw1 <- grandmaster_raw[(grandmaster_raw$combination)=="{}",]
odsetek_afk_grand <- nrow(grandmaster_raw1)/nrow(grandmaster_raw)
challenger_raw1 <- challenger_raw[(challenger_raw$combination)=="{}",]
odsetek_afk_chelen <- nrow(challenger_raw1)/nrow(challenger_raw)


# srednia czasu trwania rozgrywki
srednia_sekundy_plat <- mean(platinum_raw$gameDuration)
srednia_minuty_plat <- round(srednia_sekundy_plat/60)
cat(srednia_minuty_plat,"min")
srednia_sekundy_diamo <- mean(diamond_raw$gameDuration)
srednia_minuty_diamo <- round(srednia_sekundy_diamo/60)
cat(srednia_minuty_diamo,"min")
srednia_sekundy_master <- mean(master_raw$gameDuration)
srednia_minuty_master <- round(srednia_sekundy_master/60)
cat(srednia_minuty_master,"min")
srednia_sekundy_master <- mean(master_raw$gameDuration)
srednia_minuty_master <- round(srednia_sekundy_master/60)
cat(srednia_minuty_master,"min")
srednia_sekundy_grand <- mean(grandmaster_raw$gameDuration)
srednia_minuty_grand <- round(srednia_sekundy_grand/60)
cat(srednia_minuty_grand,"min")
srednia_sekundy_chelen <- mean(challenger_raw$gameDuration)
srednia_minuty_chelen <- round(srednia_sekundy_chelen/60)
cat(srednia_minuty_chelen,"min")

#-- nie dziala
#popularnosc bohaterow
library(stringr)
library(dplyr)
library(tidyr)
funkcja_ile_bohaterow <- function(ranga){
  nazwa <- c("")
  ilosc <- c("")
  indeksy <- c("")
  ilosc_bohaterow <- data.frame(nazwa,as.numeric(ilosc))
  for( i in c(1:nrow(ranga)))
{
  wiersz_do_czyszczenia <- ranga[i,8]
  wiersz_do_czyszczenia <- str_split(wiersz_do_czyszczenia, '\\},' ,simplify = TRUE) # w przedstawionych wierszach usuwanie zbednych 
  wiersz_do_czyszczenia <- str_replace(wiersz_do_czyszczenia, "'items':", "")
  wiersz_do_czyszczenia <-str_replace(wiersz_do_czyszczenia, " 'star'", "")
  wiersz_do_czyszczenia <-sub(".*'(.*)'.*", "\\1", wiersz_do_czyszczenia)
  bohaterowie_wektor <- wiersz_do_czyszczenia
  
  for( j in c(1:length(bohaterowie_wektor)))
  {
    if(any(bohaterowie_wektor[j]==ilosc_bohaterow$nazwa))
    {
      indeksy <- which(ilosc_bohaterow == bohaterowie_wektor[j], arr.ind=TRUE)
      ilosc_bohaterow[indeksy[1,1],2] <- as.numeric(ilosc_bohaterow[indeksy[1,1],2]) + 1
    }
    else
    {
      wektor <- c(bohaterowie_wektor[j],1)
      ilosc_bohaterow <- rbind(ilosc_bohaterow,wektor)
    }
  }
}
  return(ilosc_bohaterow)
}
ilosc_platinum <-funkcja_ile_bohaterow(platinum_raw)
ilosc_diamond <-funkcja_ile_bohaterow(diamond_raw)
ilosc_masterow <-funkcja_ile_bohaterow(master_raw)
ilosc_grandmasterow <- funkcja_ile_bohaterow(grandmaster_raw)
ilosc_chellengerow <- funkcja_ile_bohaterow(challenger_raw)



plat_kopia <- ilosc_platinum
diamond_kopia <- ilosc_diamond
master_kopia <- ilosc_masterow
grandmaster_kopia <- ilosc_grandmasterow
challenger_kopia <- ilosc_chellengerow

colnames(plat_kopia) <- c("P_champions", "P_liczba")
colnames(diamond_kopia) <- c("D_champions", "D_liczba")
colnames(master_kopia) <- c("M_champions", "M_liczba")
colnames(grandmaster_kopia) <- c("GM_champions", "GM_liczba")
colnames(challenger_kopia) <- c("C_champions", "C_liczba")



plat_kopia$P_liczba <- as.numeric(plat_kopia$P_liczba)
diamond_kopia$D_liczba <- as.numeric(diamond_kopia$D_liczba)
master_kopia$M_liczba <- as.numeric(master_kopia$M_liczba)
grandmaster_kopia$GM_liczba <- as.numeric(grandmaster_kopia$GM_liczba)
challenger_kopia$C_liczba <- as.numeric(challenger_kopia$C_liczba)



plat_kopia <- na.omit(plat_kopia)
diamond_kopia <- na.omit(diamond_kopia)
master_kopia <- na.omit(master_kopia)
grandmaster_kopia <- na.omit(grandmaster_kopia)
challenger_kopia <- na.omit(challenger_kopia)


plat_kopia <- plat_kopia[order(plat_kopia$P_liczba , decreasing = T),]
diamond_kopia <- diamond_kopia[order(diamond_kopia$D_liczba , decreasing = T),]
master_kopia <- master_kopia[order(master_kopia$M_liczba ,decreasing = T),]
grandmaster_kopia <- grandmaster_kopia[order(grandmaster_kopia$GM_liczba ,decreasing = T),]
challenger_kopia <- challenger_kopia[order(challenger_kopia$C_liczba ,decreasing = T),]
  
plat_kopia <- plat_kopia[c(1:20),]
diamond_kopia <- diamond_kopia[c(1:20),]
master_kopia <- master_kopia[c(1:20),]
grandmaster_kopia <- grandmaster_kopia[c(1:20),]
challenger_kopia <- challenger_kopia[c(1:20),]

plat_kopia <- plat_kopia[order(plat_kopia$P_liczba , decreasing = T),]
diamond_kopia <- diamond_kopia[order(diamond_kopia$D_liczba , decreasing = T),]
master_kopia <- master_kopia[order(master_kopia$M_liczba ,decreasing = T),]
grandmaster_kopia <- grandmaster_kopia[order(grandmaster_kopia$GM_liczba ,decreasing = T),]
challenger_kopia <- challenger_kopia[order(challenger_kopia$C_liczba ,decreasing = T),]

row.names(plat_kopia) <- c(1:20)
row.names(diamond_kopia) <- c(1:20)
row.names(master_kopia) <- c(1:20)
row.names(grandmaster_kopia) <- c(1:20)
row.names(challenger_kopia) <- c(1:20)

bohaterowie_razem <- 0
bohaterowie_razem <- cbind(plat_kopia, diamond_kopia)

bohaterowie_razem <- cbind(bohaterowie_razem, master_kopia)
bohaterowie_razem <- cbind(bohaterowie_razem, grandmaster_kopia)
bohaterowie_razem <- cbind(bohaterowie_razem, challenger_kopia)

write_xlsx(bohaterowie_razem,"bohaterowie razem.xlsx")

#koniec


#konice zmian

###################################################
# Pawel 06.06.2022
# Wygrane w zaleznosci od poziomu 
###################################################

# I-te miejsce na j-tym levelu 

F_level_ranked <- function(rank_level_ranked){
rank_level_ranked_list <- list(1,2,3,4)
for (i in 1:4) {
  for (j in 6:9) {
    rank_level_ranked_list[[i]][j-5] <- length(rank_level_ranked$level[rank_level_ranked$level == j 
                                    & rank_level_ranked$Ranked == i])
  }
}
rank_level_ranked_frame <- as.data.frame(rank_level_ranked_list,row.names = c("Szósty","Siódmy","Ósmy","Dziewiąty")
                                         ,col.names = (c("Pierwsze","Drugie","Trzecie","Czwarte")))
return(rank_level_ranked_frame)
}

platinum_level_ranked <- F_level_ranked(platinum_raw)
diamond_level_ranked <- F_level_ranked(diamond_raw)
master_level_ranked <- F_level_ranked(master_raw)
grandmaster_level_ranked <- F_level_ranked(grandmaster_raw)
challenger_level_ranked <- F_level_ranked(challenger_raw)

# Wykres pierwszych miejsc w zależności od poziomu 
F_rank_place_level <- function(rank_level_place){
kolor_level_ranked <- brewer.pal(5, "Set2") 
barplot(rank_level_place$Pierwsze, names.arg = rank_level_place[,1], 
        xlab = "Poziom gracza",ylab = "Ilość gier",ylim = c(0,6000), cex.names = 2, col = kolor_level_ranked, main = "Pierwsze miejsca w zależności od poziomu", cex.main = 2, cex.axis = 2, )
legend("topleft",c("Szósty","Siódmy","Ósmy","Dziewiąty"),
       fill = kolor_level_ranked, cex = 2)
}

png("plat_place_level.png", width = 1000, height = 1000)
F_rank_place_level(platinum_level_ranked)
dev.off()
png("diam_place_level.png", width = 1000, height = 1000)
F_rank_place_level(diamond_level_ranked)
dev.off()
png("master_place_level.png", width = 1000, height = 1000)
F_rank_place_level(master_level_ranked)
dev.off()
png("grandmas_place_level.png", width = 1000, height = 1000)
F_rank_place_level(grandmaster_level_ranked)
dev.off()
png("challe_place_level.png", width = 1000, height = 1000)
F_rank_place_level(challenger_level_ranked)
dev.off()

# Wykres łacznych wygranych na danym poziomie w zaleznosci od rangi
# Sumowanie wierszy danych poziomów w zaleznosci od rangi
sumy_level_ranked <- list(1,2,3,4)
for (i in 1:4) {
  sumy_level_ranked[[i]] <- c(platinum_level_ranked_sum <- as.numeric(rowSums(platinum_level_ranked[,1:4])[i]),
                              diamond_level_ranked_sum <- as.numeric(rowSums(diamond_level_ranked[,1:4])[i]),
                              master_level_ranked_sum <- as.numeric(rowSums(master_level_ranked[,1:4])[i]),
                              grandmaster_level_ranked_sum <- as.numeric(rowSums(grandmaster_level_ranked[,1:4])[i]),
                              challenger_level_ranked_sum <- as.numeric(rowSums(challenger_level_ranked[,1:4])[i]))
}

color_rank_ranked_level <- brewer.pal(5, "Spectral")

# Suma miejsc

png("level6_ranked_sum.png", width = 1000, height = 1000)
barplot(sumy_level_ranked[[1]], main = "Suma miejsc od 1 do 4 w zależności od rangi na poziomie szóstym", cex.main = 2,
        names.arg = sumy_level_ranked[[1]], col = color_rank_ranked_level, cex.axis = 2, cex.names = 2)
legend("topright",c("Platyna","Diament","Master","Grandmaster","Challenger"), fill = color_rank_ranked_level, cex = 2)
dev.off()


png("level7_ranked_sum.png", width = 1000, height = 1000)
barplot(sumy_level_ranked[[2]], main = "Suma miejsc od 1 do 4 w zależności od rangi na poziomie siodmym", cex.main = 2,
        names.arg = sumy_level_ranked[[2]], col = color_rank_ranked_level, ylim = c(0,7000), cex.axis = 2,cex.names = 2)
legend("topright",c("Platyna","Diament","Master","Grandmaster","Challenger"), fill = color_rank_ranked_level, cex = 2, 
)
dev.off()


png("level8_ranked_sum.png", width = 1000, height = 1000)
barplot(sumy_level_ranked[[3]], main = "Suma miejsc od 1 do 4 w zależności od rangi na poziomie ósmym", cex.main = 2,
        names.arg = sumy_level_ranked[[3]], col = color_rank_ranked_level,ylim = c(0,35000), cex.axis = 2, cex.names = 2)
legend("topright",c("Platyna","Diament","Master","Grandmaster","Challenger"), fill = color_rank_ranked_level, cex = 2, 
)
dev.off()


png("level9_ranked_sum.png", width = 1000, height = 1000)
barplot(sumy_level_ranked[[4]], main = "Suma miejsc od 1 do 4 w zależności od rangi na poziomie dziewiątym", cex.main = 2,
        names.arg = sumy_level_ranked[[4]], col = color_rank_ranked_level,ylim = c(0,20000), cex.axis = 2, cex.names = 2)
legend("topright",c("Platyna","Diament","Master","Grandmaster","Challenger"), fill = color_rank_ranked_level, cex = 2, 
)
dev.off()

F_Combination <- function(combination_rank){
  
  rank_combination <- data.frame(Lp. = c(1:nrow(combination_rank)))
  rank_combination$Blasters <- as.numeric(unlist(stri_extract_all_regex(stri_extract_all_regex(combination_rank$combination,".'Blaster':...."),"[0-9]")))
  rank_combination$Chrono <- as.numeric(unlist(stri_extract_all_regex(stri_extract_all_regex(combination_rank$combination,".'Chrono':...."),"[0-9]")))
  rank_combination$Cybernetic <- as.numeric(unlist(stri_extract_all_regex(stri_extract_all_regex(combination_rank$combination,".'Cybernetic':...."),"[0-9]")))
  rank_combination$Celestials <- as.numeric(unlist(stri_extract_all_regex(stri_extract_all_regex(combination_rank$combination,".'Set3_Celestial':....")," [0-9]")))
  rank_combination$Dark_Star <- as.numeric(unlist(stri_extract_all_regex(stri_extract_all_regex(combination_rank$combination,". 'DarkStar':."),"[0-9]")))
  rank_combination$Mech_Pilot <- as.numeric(unlist(stri_extract_all_regex(stri_extract_all_regex(combination_rank$combination,". 'MechPilot':...."),"[0-9]")))
  rank_combination$Rebel <- as.numeric(unlist(stri_extract_all_regex(stri_extract_all_regex(combination_rank$combination,". 'Rebel':...."),"[0-9]")))
  rank_combination$Space_Pirate <- as.numeric(unlist(stri_extract_all_regex(stri_extract_all_regex(combination_rank$combination,". 'SpacePirate':...."),"[0-9]")))
  rank_combination$Star_Guardian <- as.numeric(unlist(stri_extract_all_regex(stri_extract_all_regex(combination_rank$combination,". 'StarGuardian':...."),"[0-9]")))
  rank_combination$Valkyrie <- as.numeric(unlist(stri_extract_all_regex(stri_extract_all_regex(combination_rank$combination,". 'Valkyrie':...."),"[0-9]")))
  rank_combination$Void <- as.numeric(unlist(stri_extract_all_regex(stri_extract_all_regex(combination_rank$combination,". 'Set3_Void':....")," [0-9]")))
  rank_combination$Blademaster <- as.numeric(unlist(stri_extract_all_regex(stri_extract_all_regex(combination_rank$combination,". 'Set3_Blademaster':....")," [0-9]")))
  rank_combination$Brawler <- as.numeric(unlist(stri_extract_all_regex(stri_extract_all_regex(combination_rank$combination,". 'Set3_Brawler':....")," [0-9]")))
  rank_combination$Demolitionist <- as.numeric(unlist(stri_extract_all_regex(stri_extract_all_regex(combination_rank$combination,". 'Demolitionist':...."),"[0-9]")))
  rank_combination$Infiltrator <- as.numeric(unlist(stri_extract_all_regex(stri_extract_all_regex(combination_rank$combination,". 'Infiltrator':...."),"[0-9]")))
  rank_combination$Mystic <- as.numeric(unlist(stri_extract_all_regex(stri_extract_all_regex(combination_rank$combination,". 'Set3_Mystic':....")," [0-9]")))
  rank_combination$Mercenary <- as.numeric(unlist(stri_extract_all_regex(stri_extract_all_regex(combination_rank$combination,". 'Mercenary':...."),"[0-9]")))
  rank_combination$Mana_Reaver <- as.numeric(unlist(stri_extract_all_regex(stri_extract_all_regex(combination_rank$combination,". 'ManaReaver':...."),"[0-9]")))
  rank_combination$Protector <- as.numeric(unlist(stri_extract_all_regex(stri_extract_all_regex(combination_rank$combination,". 'Protector':...."),"[0-9]")))
  rank_combination$Sniper <- as.numeric(unlist(stri_extract_all_regex(stri_extract_all_regex(combination_rank$combination,". 'Sniper':...."),"[0-9]")))
  rank_combination$Sorcerer <- as.numeric(unlist(stri_extract_all_regex(stri_extract_all_regex(combination_rank$combination,". 'Set3_Sorcerer':....")," [0-9]")))
  rank_combination$Starship <- as.numeric(unlist(stri_extract_all_regex(stri_extract_all_regex(combination_rank$combination,". 'Starship':...."),"[0-9]")))
  rank_combination$Vanguard <- as.numeric(unlist(stri_extract_all_regex(stri_extract_all_regex(combination_rank$combination,". 'Vanguard':.."),"[0-9]")))
  rank_combination$Rank <- as.numeric(combination_rank$Ranked)
  rank_combination$Level <- as.numeric(combination_rank$level)
  rank_combination$GameDuration <- as.numeric(combination_rank$ingameDuration)
  rank_combination <- rank_combination[-c(1,1)]
  rank_combination[is.na(rank_combination)] <- 0
  
  rank_combination_all <- data.frame(matrix(ncol=1,nrow=nrow(rank_combination), dimnames=list(NULL, "Kombinacja")))
  for (i in 1:nrow(rank_combination)) {
    for(j in 1:(length(rank_combination)-3)){
      #Blasters
      if(rank_combination[i,1] >= 5){
        rank_combination_all[i,] <- "Blaster"
        break
      }
      #Blademaster + celestial
      else if(rank_combination[i,12] >= 3 && rank_combination[i,4] >= 4){
        rank_combination_all[i,] <- "Blademaster_Celestial"
        break
      }
      #infiltrators
      else if(rank_combination[i,15] >= 6){
        rank_combination_all[i,] <- "Infiltrators"
        break
      } 
      #Chrono
      else if(rank_combination[i,2] >= 6){
        rank_combination_all[i,] <- "Chrono"
        break
      } 
      #Cybernetic
      else if(rank_combination[i,3] >= 6){
        rank_combination_all[i,] <- "Cybernetic"
        break
      } 
      #Celestials
      else if(rank_combination[i,4] >= 6){
        rank_combination_all[i,] <- "Celestials"
        break
      }
      #Dark stars
      else if(rank_combination[i,5] >= 6){
        rank_combination_all[i,] <- "Dark_Star"
        break
      }
      #Mecha + infiltrators
      else if(rank_combination[i,6] >= 3 && rank_combination[i,15] >= 4){
        rank_combination_all[i,] <- "Mecha_Infiltrators"
        break
      } 
      #Rebel
      else if(rank_combination[i,7] >= 6){
        rank_combination_all[i,] <- "Rebel"
        break
      } 
      #Spacepirates
      else if(rank_combination[i,8] >= 4){
        rank_combination_all[i,] <- "Spacepirates"
        break
      } 
      #Starguardians
      else if(rank_combination[i,9] >= 6){
        rank_combination_all[i,] <- "Starguardians"
        break
      } 
      #Blademasters
      else if(rank_combination[i,12] >= 6){
        rank_combination_all[i,] <- "Blademasters"
        break
      } 
      #Brawlers + blasters
      else if(rank_combination[i,13] >= 4 && rank_combination[i,1] >=4 ){
        rank_combination_all[i,] <- "Brawlers_Blasters"
        break
      } 
      #Mystic + Vanguards
      else if(rank_combination[i,15] >= 4 && rank_combination[i,23] >= 4){
        rank_combination_all[i,] <- "Mystic_Vanguards"
        break
      } 
      #Mystic + protectors
      else if(rank_combination[i,16] >= 4 && rank_combination[i,19] >= 4){
        rank_combination_all[i,] <- "Mystic_Protectors"
        break
      } 
      #Sorcerer + mecha
      else if(rank_combination[i,19] >= 4 && rank_combination[i,6] >= 3){
        rank_combination_all[i,] <- "Mecha_Sorcerers"
        break
      }
      #Sorcerer
      else if(rank_combination[i,19] >= 6){
        rank_combination_all[i,] <- "Sorcerer"
        break
      }
      #Blademaster + chrono
      else if(rank_combination[i,12] >= 3 && rank_combination[i,2] >= 4){
        rank_combination_all[i,] <- "Blademaster_Chrono"
        break
      } 
      else {
        rank_combination_all[i,] <- "Other"
        break
      }
    }  
  }
  
  rank_combination_all$Czas <- round(rank_combination$GameDuration)
  rank_combination_all$Poziom <- rank_combination$Level
  rank_combination_all$Miejsce <- rank_combination$Rank
  return(rank_combination_all)
}

platinum_combination <- F_Combination(platinum_raw)
diamond_combination <- F_Combination(diamond_raw)
master_combination <- F_Combination(master_raw)
grandmaster_combination <- F_Combination(grandmaster_raw)
challenger_combination <- F_Combination(challenger_raw)

######

#Wykres popularności
F_combination_popularity <- function(combination_popularity, popularity_name)
{
  rank_combination_popularity_table <- sort(table(combination_popularity$Kombinacja
                                                  [combination_popularity$Kombinacja != "Other"]),decreasing = TRUE)
  
  # Zamiana tabeli na ramke
  rank_combination_popularity <- as.data.frame(rank_combination_popularity_table)
  colnames(rank_combination_popularity) <- c("Kombinacja","Ilosc")
  
  
  # Utworzenie większej palety do wykresu 
  colourCount <- nrow(rank_combination_popularity)
  getPalette <- colorRampPalette(brewer.pal(9, "Set1"))
  
  barplot(rank_combination_popularity$Ilosc, horiz = TRUE, las=1, cex.names = 1.3, names.arg = rank_combination_popularity$Ilosc
          ,xlim = c(0,15000), col=getPalette(colourCount), main = popularity_name, cex.main = 2, cex.axis = 2)
  legend("topright",legend = rank_combination_popularity[,1], cex = 2, fill=getPalette(colourCount))
}

png("plat_comb_popularity.png",width = 1000, height = 1000)
F_combination_popularity(platinum_combination, "Popularność kombinacji - Platyna")
dev.off()
png("diam_comb_popularity.png",width = 1000, height = 1000)
F_combination_popularity(diamond_combination, "Popularność kombinacji - Diamond")
dev.off()
png("master_comb_popularity.png",width = 1000, height = 1000)
F_combination_popularity(master_combination, "Popularność kombinacji - Master")
dev.off()
png("grandmas_comb_popularity.png",width = 1000, height = 1000)
F_combination_popularity(grandmaster_combination, "Popularność kombinacji - Grandmaster")
dev.off()
png("chall_comb_popularity.png",width = 1000, height = 1000)
F_combination_popularity(challenger_combination, "Popularność kombinacji - Challenger")
dev.off()

F_combination_winrate <- function(combination_winrate,rank_name){
  rank_winrate_popularity_table <- sort(table(combination_winrate$Kombinacja[combination_winrate$Kombinacja != "Other" 
                                                                             & combination_winrate$Miejsce == 1]),decreasing = TRUE)
  
  # Zamiana tabeli na ramke
  rank_winrate_popularity <- as.data.frame(rank_winrate_popularity_table)
  colnames(rank_winrate_popularity) <- c("Kombinacja","Ilosc")
  
  
  # Utworzenie większej palety do wykresu 
  colourCount <- nrow(rank_winrate_popularity)
  getPalette <- colorRampPalette(brewer.pal(9, "Set1"))
  
  barplot(rank_winrate_popularity$Ilosc, horiz = TRUE, las=1, cex.names = 1.3, names.arg = rank_winrate_popularity$Ilosc
          ,xlim = c(0,2000), col=getPalette(colourCount), main = rank_name, cex.main = 2, cex.axis = 2)
  legend("topright",legend = rank_winrate_popularity[,1], cex = 2, fill=getPalette(colourCount))
}


png("plat_winrate_comb.png",width = 1000, height = 1000)
F_combination_winrate(platinum_combination,"Wygrane kombinacji - Platyna")
dev.off()
png("diam_winrate_comb.png",width = 1000, height = 1000)
F_combination_winrate(diamond_combination, "Wygrane kombinacji - Diamond")
dev.off()
png("master_winrate_comb.png",width = 1000, height = 1000)
F_combination_winrate(master_combination, "Wygrane kombinacji - Master")
dev.off()
png("grandmas_winrate_comb.png",width = 1000, height = 1000)
F_combination_winrate(grandmaster_combination, "Wygrane kombinacji - Grandmaster")
dev.off()
png("chall_winrate_comb.png",width = 1000, height = 1000)
F_combination_winrate(challenger_combination, "Wygrane kombinacji - Challenger")
dev.off()


##################################
# koniec zmian
##################################
