library(stylo)

wurzburg.cosine = function(x){
  
  # z-scoring the input matrix of frequencies
  
  x = scale(x)
  
  # computing cosine dissimilarity
  
  y = as.dist( x %*% t(x) / (sqrt(rowSums(x^2) %*% t(rowSums(x^2)))) )
  
  # then, turning it into cosine similarity
  
  z = 1 - y
  
  # getting the results
  
  return(z)
  
}


df = NULL
##########################experiment DF
for(i in 1:40) {
  
  size = i * 500
  cat("current iteration:\t", i, "\n")
  results = classify(sampling="random.sampling", sample.size=size, corpus.lang = "Other", encoding="UTF-8", mwf.min = 200, mwf.max = 200, gui=F, distance.measure="wurzburg.cosine")
  df = rbind(df, data.frame(size, as.numeric(results$success.rate)))
}


plot(df, type="l", main="Wurzburg Cosine Distance (Lemmatized Corpus)", xlab="Sample size", ylab="Success rate")
lines(smoo, col = "blue")
smoo = loess.smooth(df$size, df$as.numeric.results.success.rate)
text(df, labels=df$as.numeric.results.success.rate)
grid(nx = NULL, ny = NULL, col = "gray", lty = "dotted")




# http://minimaxir.com/2015/02/ggplot-tutorial/ - красивые графики
library(ggplot2)
library(scales)
ggplot(df,aes(x=size, y=df$as.numeric.results.success.rate))+geom_point()+geom_smooth()+geom_line() + 
  labs(x = "Sample size", y = "Success rate", title = "Wurzburg Cosine Distance (Lemmatized Corpus)") +
  theme_bw() + scale_y_continuous(breaks = pretty_breaks(n = 10)) +
  theme(axis.text=element_text(size=14), axis.title=element_text(size = 14)) + 
  geom_text(label=df$as.numeric.results.success.rate, size=5)



write.table(df, "Wurzburg_Lemmatized.csv", row.names = F, quote=F, col.names=T, sep=";")