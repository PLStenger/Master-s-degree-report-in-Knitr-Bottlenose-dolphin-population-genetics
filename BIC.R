### Figure BIC DAPC ###
library(adegenet)

Ttr <- read.genepop("IndivPL+ML(Medit).gen", quiet = TRUE, ncode=3)
grp <- find.clusters(Ttr, max.n.clust=65, n.pca=200, choose.n.clust=FALSE) 

dfr3 <- data.frame(K=1:length(grp$Kstat), BIC=grp$Kstat)

gg3 <- ggplot(data=dfr3, aes(x=K, y=BIC)) + geom_line(colour="blue")
gg3 <- gg3 + geom_point(pch=21, bg="grey", alpha=.8, colour="black")
gg3 <- gg3 + geom_hline(yintercept=min(dfr3$BIC), lty=2) + geom_vline(xintercept=3, lty=2)
gg3