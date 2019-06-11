library(tidyverse)
library(useful)

if(!file.exists("severeinjury.csv.zip")){
  download.file("https://www.kaggle.com/jboysen/injured-workers/downloads/injured-workers.zip/1", destfile = "severeinjury.csv.zip")}

unzip("severeinjury.csv.zip")

injuries <- read.csv(file.path("severeinjury.csv"))

str(injuries)
summary(injuries)

injuries1 <- injuries %>% select("ID","Employer","EventDate", "State","NatureTitle","EventTitle","SourceTitle")
str(injuries1)


Employers <- unique(injuries$Employer)
corner(Employers)


injuries %>% filter(Employer %in% Employers) %>% 
  select(Employer, State, EventDate) %>%
  mutate(ID = 1) %>%
  spread(State, ID) %>% select(sample(ncol(.), 100)) %>% 
  as.matrix() %>% t(.) %>%
  image(1:100, 1:100,. , xlab="States", ylab="Employers")
abline(h=0:100+0.5, v=0:100+0.5, col = "grey")   

# edx %>% filter(userId %in% users) %>% 
#   select(userId, movieId, rating) %>%
#   mutate(rating = 1) %>%
#   spread(movieId, rating) %>% select(sample(ncol(.), 100)) %>% 
#   as.matrix() %>% t(.) %>%
#   image(1:100, 1:100,. , xlab="Movies", ylab="Users")
# abline(h=0:100+0.5, v=0:100+0.5, col = "grey")   


injuries %>% 
  dplyr::count(userId) %>% 
  ggplot(aes(n)) + 
  geom_histogram(bins = 30, color = "black") + 
  scale_x_log10() + 
  ggtitle("Users Rating Counts")  
