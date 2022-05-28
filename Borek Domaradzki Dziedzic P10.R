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



