quizdata = read.csv("quizdata.csv")
quizdata
str(quizdata)

quizdata1 <- quizdata[-grep("My favorite web browser is Opera", quizdata $ Favorite),]
quizdata1
quizdata1 <- quizdata1[-grep("My favorite TV Show is The New Girl", quizdata1 $ Favorite),]
quizdata1
quizdata1 <- quizdata1[-grep( "My favorite web browser is Chrome", quizdata1 $ Favorite),]
quizdata1
quizdata1 <- quizdata1[-grep( "My favorite TV Show is The Big Bang Theory", quizdata1 $ Favorite),]
quizdata1
quizdata1 <- quizdata1[-grep( "My favorite web browser is Firefox", quizdata1 $ Favorite),]
quizdata1
quizdata1<- quizdata1[-grep( "My favorite color is yellow", quizdata1 $ Favorite),]
quizdata1
df<-as.data.frame(quizdata1)
df
install.packages("plyr")
library(plyr)
ddply(df,.(Favorite),function(x) data.frame(Favorite=x$Favorite[1],User=sum(x$User)))
library(ggplot2)
plot <- ggplot(data = df, aes(x = Favorite, y = User, fill=Favorite))
plot <- plot + geom_bar(stat="identity")
plot <- plot + xlab("Favorite Color") + ylab("Number of user") + ggtitle("Popularity of color")
plot
