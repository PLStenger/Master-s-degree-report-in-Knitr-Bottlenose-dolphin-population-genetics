### Figure LnPD Structure ###
dat <- read.table("PL+MLMeditLnPD_15repetitions.txt", header=T)

# Tri par valeur de K croissante
dat <- dat[order(dat$K),]

# Création du data.frame contenant, pour chaque valeur de K, la moyenne et l'écart-type des simulations
dfr <- data.frame(K = unique(dat$K),
				mean = tapply(dat$LnPD, dat$K, mean),
				sd = tapply(dat$LnPD, dat$K, sd))

# Plot
gg1 <- qplot(dfr$K, dfr$mean) + scale_x_discrete(limit = c(dfr$K)) + geom_errorbar(aes(x=dfr$K, ymin=dfr$mean-dfr$sd, ymax=dfr$mean+dfr$sd), width=0.1) + geom_line(colour = "blue") + labs(x = "K", y = "LnPD") + theme(legend.position="none")
