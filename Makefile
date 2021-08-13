CC = qcc
SCOTT_OBJS = ScottZX.o qdos.o
SCOTT_EXE = ScottZX

${SCOTT_EXE} : ${SCOTT_OBJS}
	qcc -o ${SCOTT_EXE} ${SCOTT_OBJS}

.c.o :
	qcc -o $@ -c $<

clean :
	-rm ${SCOTT_OBJS} ${SCOTT_EXE} ScottZX_qdos.zip

deploy : ${SCOTT_EXE}
	curl -o ScottZX_qdos.zip http://www.ifarchive.org/if-archive/scott-adams/games/scottfree/AdamsGames.zip
	qlzip -Q2 ScottZX_qdos.zip ScottZX

