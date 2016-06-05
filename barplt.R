### Barplot ###
structure.plot <- function(data, col=NULL, space=0, horiz=TRUE, col.seg=rgb(0.204,0.204,0.204,alpha=0.25), lwd.seg=.5, col.pop=1,lwd.pop=1.5, col.frame=1, axis=TRUE, ...) {
	nclust <- dim(data)[2] - 1
	pst <- pos.tick(data[,1])  # Position of tick martks
	lab <- unique(data[,1])    # Label for each population
	col <- if (is.null(col)) heat.colors(nclust) else col
	if (horiz) {
		par(...)
		barplot(t(as.matrix(data[,-1])),col=col,border=FALSE,space=space,axes=F,names.arg=rep(NA,nrow(data)),horiz=horiz,...)
		segments(0,cumsum(table(data[,1])),1,cumsum(table(data[,1])),lwd=lwd.pop,col=col.pop)
		segments(0,1:(nrow(data)-1),1,1:(nrow(data)-1),lwd=lwd.seg,col=col.seg)
		rect(0,0,1,nrow(data),border=col.frame,lwd=lwd.pop)
		if (axis) axis(side=2,at=pst,labels=lab,las=1)
		} else {
		par(...)
		barplot(t(as.matrix(data[,-1])),col=col,border=FALSE,space=0,axes=F,names.arg=rep(NA,nrow(data)),horiz=horiz,...)
		segments(cumsum(table(data[,1])),0,cumsum(table(data[,1])),1,col=col.pop,lwd=lwd.pop)
		segments(1:(nrow(data)-1), 0, 1:(nrow(data)-1), 1, lwd=lwd.seg,col=col.seg)
		rect(0,0,nrow(data),1,border=col.frame,lwd=lwd.pop)
		if (axis) axis(side=1,at=pst,labels=lab)}
}

pos.tick <- function(fac) {

	eff.pop <- table(fac)
	npop <- length(eff.pop)
	ps.tick <- numeric(npop)
	ps.tick[1] <- cumsum(eff.pop[1])/2

	for (i in 2:npop) {
		ps.tick[i] <- max(cumsum(eff.pop[1:(i-1)])) + eff.pop[i]/2
		}
		
	return(ps.tick)
}
