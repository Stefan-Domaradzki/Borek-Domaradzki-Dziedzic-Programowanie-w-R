setwd("C:/Users/ja/Documents/GitHub/Programowanie-w-R") #Stefan sciezka

list.files()

# Importowanie danych ----


# 26.05.22 Stefan

platinum_raw    <- read.csv("TFT_Platinum_MatchData.csv")
diamond_raw     <- read.csv("TFT_Diamond_MatchData.csv")
master_raw      <- read.csv("TFT_Master_MatchData.csv")
grandmaster_raw <- read.csv("TFT_Grandmaster_MatchData.csv")
challenger_raw  <- read.csv("TFT_Challenger_MatchData.csv")

items <- read.csv("items_id.csv")
items <- items[,1]

# Stefan koniec zmian
