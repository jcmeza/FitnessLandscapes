choices <- 1:15
eye16 <- diag(16)
zero16 <- c()
matrixlist <- list(M1, M2, M3, M4, M5, M6, M7, M8, M9, M10, M11, M12, M13, M14, M15)
mnames <- c("M1", "M2", "M3", "M4","M5","M6","M7","M8",
            "M9","M10","M11","M12","M13", "M14","M15")

winners <- data.frame(value=numeric(16),matrices=character(16))
  
for (i in 1:15) {
  for (j in 1:15) {
    length2 <- list(matrixlist[[i]],matrixlist[[j]])
    R = Reduce(matmult,length2)
    for (gg in 2:16) {
        if (R[gg,1] > winners[gg,1]) {
          winners[gg,1] <- R[gg,1]
          winners[gg,2] <- c(mnames[i],mnames[j])
      }
    }
  }
}