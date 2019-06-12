library(tidyverse)
library(useful)
library(dplyr)

if(!file.exists("severeinjury.csv.zip")){
  download.file("https://www.kaggle.com/jboysen/injured-workers/downloads/injured-workers.zip/1", destfile = "severeinjury.csv.zip")}

unzip("severeinjury.csv.zip")

injuries <- read.csv(file.path("severeinjury.csv"))

str(injuries)
summary(injuries)

unique(injuries$State)

injuries1 <- injuries %>% filter(State == "FLORIDA" & Amputation == TRUE)%>%
                                   select("ID","EventDate","NatureTitle","EventTitle","SourceTitle")

injuries_noNA <- na.omit(injuries1)
str(injuries_noNA)




glimpse(injuries1)

pairs(injuries1)

class(injuries)

unique(injuries1$EventDate)
unique(injuries1$NatureTitle)
unique(injuries$EventTitle)
unique(injuries$SourceTitle)




injuries1 %>% 
  dplyr::count(State) %>%
  ggplot(aes(n)) +
  geom_histogram(bin = 30, color = "blue") +
  scale_x_log10() +
  ggtitle("Severe Injuries by State")


Amputation_Injuries <- injuries %>%
  group_by(EventTitle) %>%
  dplyr::count() %>%
  top_n(10) %>%

plot(Amputation_Injuries)

injuries %>%
  mutate(month = format(EventDate, "%m"), year = format(EventDate, "%Y")) %>%
  group_by(State,month, year) %>%
  summarise(total = count(state))

Nature_Injuries <- injuries1 %>%
  group_by(NatureTitle) %>%
  dplyr::count()  %>%
  filter(n > 100) 

Nature_Injuries  
Amputation_Injuries %>% Amputation_Injuries[Amputation = TRUE]