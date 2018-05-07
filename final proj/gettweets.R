# Get tweets

library(devtools)
library(twitteR)
library(xlsx)

api_key <- 	"fRRy5kI4pa05Xg6OOy5eLsuEO"
api_secret <- "pjkHcyPml3esV461Od8N3klWiyh0hCic0BGgbhZU0nC0NCHJjC"
access_token <- "1476205537-ypZk8VdwMGqJUbTJ0TcXge82zcCe8BFIGgOTjMW"
access_token_secret <- "OzNMWHqK4Tk7NjNulLYs90Xx4Miqo4He5ngiCFqwD9i2J"
setup_twitter_oauth(api_key, api_secret, access_token, access_token_secret)


#############################
tweets_nintendo <- searchTwitter("#nintendo", n = 5000, lang="en",since = '2018-01-01')
tweets_nintendo.df <- twListToDF(tweets_nintendo)
write.csv(tweets_nintendo.df, "tweets_nintendo.csv")

tweets_nintendoswitch <- searchTwitter("#nintendoswitch", n = 3000, lang="en",since = '2018-01-01')
tweets_nintendoswitch.df <- twListToDF(tweets_nintendoswitch)
write.csv(tweets_nintendoswitch.df, "tweets_nintendoswitch.csv")

tweets_SuperMarioOdyssey <- searchTwitter("#SuperMarioOdyssey", n = 1500, lang="en",since = '2018-01-01')
tweets_SuperMarioOdyssey.df <- twListToDF(tweets_SuperMarioOdyssey)
write.csv(tweets_SuperMarioOdyssey.df, "tweets_SuperMarioOdyssey.csv")


tweets_BreathoftheWild <- searchTwitter("#BreathoftheWild", n = 1500, lang="en",since = '2018-01-01')
tweets_BreathoftheWild.df <- twListToDF(tweets_BreathoftheWild)
write.csv(tweets_BreathoftheWild.df, "tweets_BreathoftheWild.csv")


tweets_splatoon <- searchTwitter("#splatoon", n = 1500, lang="en",since = '2017-10-01')
tweets_splatoon.df <- twListToDF(tweets_splatoon)
write.csv(tweets_splatoon.df, "tweets_splatoon.csv")



N <- read.csv('tweets_nintendo.csv', stringsAsFactors=FALSE)
NS <- read.csv('tweets_nintendoswitch.csv', stringsAsFactors=FALSE)
SMO <- read.csv('tweets_SuperMarioOdyssey.csv', stringsAsFactors=FALSE)
BW <- read.csv('tweets_BreathoftheWild.csv', stringsAsFactors=FALSE)
S <- read.csv('tweets_splatoon.csv', stringsAsFactors=FALSE)
Z <- read.csv('tweets_zelda.csv', stringsAsFactors=FALSE)

N$tweets<-'nintendo'
NS$tweets<-'nintendoswitch'
SMO$tweets<-'SuperMarioOdyssey'
BW$tweets<-'BreathoftheWild'
S$tweets<-'splatoon'
Z$tweets <- 'zelda'

NintendoData <- rbind(N, NS, SMO, S,BW,Z)

NintendoData$tweets <- as.factor(NintendoData$tweets)
NintendoData$created <- as.POSIXct(NintendoData$created)

write.csv(NintendoData, "NintendoData.csv")

