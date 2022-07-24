A <- apply(res.textual$cont.table[____("A_",rownames(res.textual$cont.table)),], FUN = ____, 2)
P <- apply(res.textual$cont.table[____("P_",rownames(res.textual$cont.table)),], FUN = ____, 2)
V <- apply(res.textual$cont.table[____("V_",rownames(res.textual$cont.table)),], FUN = ____, 2)
instrument.why <- rbind(A,P,V)
instrument.why
#
A <- apply(res.textual$cont.table[grep("A_",rownames(res.textual$cont.table)),], FUN = sum, 2)
P <- apply(res.textual$cont.table[grep("P_",rownames(res.textual$cont.table)),], FUN = sum, 2)
V <- apply(res.textual$cont.table[grep("V_",rownames(res.textual$cont.table)),], FUN = sum, 2)
instrument.why <- rbind(A,P,V)
instrument.why