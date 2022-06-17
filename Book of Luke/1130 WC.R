install.packages("tidyverse")
install.packages("tm")
install.packages("wordcloud")
library(tidyverse)
library(tm)
library(wordcloud)
library(ggplot2)
Luke_dat <-  Corpus(DirSource("MINING_LUKE"))
inspect(Luke_dat)

Luke_dat <- Luke_dat %>%
  tm_map(removeNumbers) %>%
  tm_map(removePunctuation) %>%
  tm_map(tolower) %>%
  tm_map(stripWhitespace)
wordcloud(Luke_dat, min.freq = 2, max.words = 150)

Luke_dat_tdm <- TermDocumentMatrix(Luke_dat)
inspect(Luke_dat_tdm)

Luke_dat_tdm <- as.matrix(Luke_dat_tdm)

Luke_dat_freq <- rowSums(Luke_dat_tdm)
Luke_dat_freq

Luke_freq <-  t(as.data.frame(head(Luke_dat_tdm, 20)))

barplot(Luke_freq, legend.text = rownames(Luke_freq))
        