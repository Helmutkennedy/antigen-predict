#!/usr/bin/env Rscript
library(argparse)
parser <- ArgumentParser(description="Make histograms for bind_pep_alone Rosetta 3.5 scoring results")

args <- parser$parse_args()
wkdir <- getwd()

score_table_0 <- read.table(paste(wkdir, "/preselection/all/score_table.txt", sep=""), header=TRUE, sep="\t")
score_table_1 <- read.table(paste(wkdir, "/round_1/all/score_table.txt", sep=""), header=TRUE, sep="\t")
score_table_2 <- read.table(paste(wkdir, "/round_2/all/score_table.txt", sep=""), header=TRUE, sep="\t")
score_table_3 <- read.table(paste(wkdir, "/round_3/all/score_table.txt", sep=""), header=TRUE, sep="\t")
score_table_4 <- read.table(paste(wkdir, "/round_4/all/score_table.txt", sep=""), header=TRUE, sep="\t")

png(paste(wkdir, "/3QIU_histogram_rnds.png", sep=""), width=4000, height=900, res=300)
par(mfrow=c(1,5), oma=c(0,5,0,0), xpd=NA, mar=c(5, 1, 4, 2) + 0.1, mgp=c(3.5,1,0))

# For xpd canceling xlim on first figure, do xlim by hand for preselection figure
dG_bind_0_raw <- score_table_0$bind_pep_alone
dG_bind_0 <- dG_bind_0_raw[dG_bind_0_raw <= 3500]

hist(dG_bind_0, breaks=seq(-200,5000, by=50), col='blue', lty="blank", xlab=expression(paste(Delta, "G", ""["BIND"], sep= "")),
		main="Preselection", xlim=c(-200,3500), cex.lab=2, cex.main=2)
box(bty="l")
par(xpd=FALSE)
hist(score_table_1$bind_pep_alone, breaks=seq(-200, 5000, by= 50), col='blue', lty="blank", xlab=expression(paste(Delta, "G", ""["BIND"], sep= "")),
     main="Round 1", xlim=c(-200, 3500), cex.lab=2, cex.main=2)
box(bty="l")
hist(score_table_2$bind_pep_alone, breaks=seq(-200,5000, by=50), col='blue', lty="blank", ylab="", xlab=expression(paste(Delta, "G", ""["BIND"], sep= "")),
		main="Round 2", xlim=c(-200,3500), cex.lab=2, cex.main=2)
box(bty="l")
hist(score_table_3$bind_pep_alone, breaks=seq(-200,5000, by=50), col='blue', lty="blank", ylab="", xlab=expression(paste(Delta, "G", ""["BIND"], sep= "")),
		main="Round 3", xlim=c(-200,3500), cex.lab=2, cex.main=2)
box(bty="l")
hist(score_table_4$bind_pep_alone, breaks=seq(-200,5000, by=50), col='blue', lty="blank", ylab="", xlab=expression(paste(Delta, "G", ""["BIND"], sep= "")),
		main="Round 4", xlim=c(-200,3500), cex.lab=2, cex.main=2)
box(bty="l")
dev.off()