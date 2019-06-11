
if(!file.exists("severeinjury.csv.zip")){
  download.file("https://www.kaggle.com/jboysen/injured-workers/downloads/injured-workers.zip/1", destfile = "severeinjury.csv.zip")}

unzip("severeinjury.csv.zip")

