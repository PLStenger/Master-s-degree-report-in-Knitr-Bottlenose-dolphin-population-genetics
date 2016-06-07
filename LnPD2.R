### Figure LnPD Structure ###
dat <- read.table("LnPdIndivPL.txt", header=T)

# Tri par valeur de K croissante
dat <- dat[order(dat$K),]

# Création du data.frame contenant, pour chaque valeur de K, la moyenne et l'écart-type des simulations
dfrx <- data.frame(K = unique(dat$K),
				mean = tapply(dat$LnPD, dat$K, mean),
				sd = tapply(dat$LnPD, dat$K, sd))

# Plot
<<<<<<< Updated upstream
gg4 <- qplot(dfrx$K, dfrx$mean) + scale_x_discrete(limit = c(dfrx$K)) + geom_errorbar(aes(x=dfrx$K, ymin=dfrx$mean-dfrx$sd, ymax=dfrx$mean+dfrx$sd), width=0.1) + geom_line(colour = "blue") + labs(x = "K", y = "LnPD") + theme(legend.position="none")
=======
gg4 <- qplot(dfrx$K, dfr$mean) + scale_x_discrete(limit = c(dfrx$K)) + geom_errorbar(aes(x=dfrx$K, ymin=dfrx$mean-dfrx$sd, ymax=dfrx$mean+dfr$sd), width=0.1) + geom_line(colour = "blue") + labs(x = "K", y = "LnPD") + theme(legend.position="none")
>>>>>>> Stashed changes
