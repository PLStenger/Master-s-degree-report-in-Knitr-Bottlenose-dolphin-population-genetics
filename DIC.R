### Figure DIC TESS ###
dat <- read.table("PLMLMedit_DIC_15repetitions.txt", head = TRUE)

# Tri par valeur de K croissante
dat <- dat[order(dat$Kmax),]

# Création du data.frame contenant, pour chaque valeur de K, la moyenne et l'écart-type des simulations
dfr2 <- data.frame(K = unique(dat$Kmax),
				mean = tapply(dat$DIC, dat$Kmax, mean),
				sd = tapply(dat$DIC, dat$Kmax, sd))

gg2 <- qplot(dfr2$K, dfr2$mean) + scale_x_discrete(limit = c(dfr2$K)) + geom_errorbar(aes(x=dfr2$K, ymin=dfr2$mean-dfr2$sd, ymax=dfr2$mean+dfr2$sd), width=0.1) + geom_line(colour = "blue") + labs(x = "K", y = "DIC") + theme(legend.position="none")
