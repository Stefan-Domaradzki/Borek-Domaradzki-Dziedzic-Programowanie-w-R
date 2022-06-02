setwd("C:/Users/ja/Documents/GitHub/Programowanie-w-R") #Stefan sciezka

list.files()

install.packages("stringi")
install.packages("tidyverse")


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

platinum_player_items    <- platinum_raw[,c(1,5,8)]
diamond_player_items     <- diamond_raw[,c(1,5,8)]
master_player_items      <- master_raw[,c(1,5,8)]
grandmaster_player_items <- grandmaster_raw[,c(1,5,8)]
challenger_player_items  <- challenger_raw[,c(1,5,8)]


#pole testowe usunac
a.1 <- platinum_player_items[c(1,2),]
str(a.1)

a.1 <- a.1 %>%
  add_column(items = NA)

a.1$champion <- stri_extract_all_regex(a.1$champion, "\\[.\\]")
a.1$champion <- stri_extract_all_regex(a.1$champion, "\\[..\\]" | "\\[.\\]" )

b.1 <- stri_trans_char('id.1', '1', as.character(items[1]))

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

                       
                                              
                       
# Stefan koniec zmian 


