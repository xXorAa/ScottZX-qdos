CC = qcc
SCOTT_SRCS = ScottZX.c qdos.c
SCOTT_EXE = ScottZX

${SCOTT_EXE} : ${SCOTT_OBJS}
	${CC} -o ${SCOTT_EXE} ${SCOTT_SRCS}

.c.o :
	qcc -o $@ -c $<

clean :
	-rm ${SCOTT_OBJS} ${SCOTT_EXE} ScottZX_qdos.zip ScottZX_qdos.img

ADAMSGAMES = 0readme.txt adv01.dat adv02.dat adv03.dat adv04.dat adv05.dat \
			 adv06.dat adv07.dat adv08.dat adv09.dat adv10.dat adv11.dat \
			 adv12.dat adv13.dat adv14a.dat adv14b.dat quest1.dat quest2.dat \
			 sampler1.dat

deploy : ${SCOTT_EXE}
	curl -O http://www.ifarchive.org/if-archive/scott-adams/games/scottfree/AdamsGames.zip
	unzip AdamsGames.zip
	curl -O http://www.dilwyn.me.uk/pe/ptrgen206.zip
	unzip ptrgen206.zip ptr.gen
	curl -O http://www.dilwyn.me.uk/tk/sigext30mod.zip
	unzip sigext30mod.zip sigext30.rext
	qlzip -Q2 ScottZX_qdos.zip BOOT ScottZX ptr.gen sigext30.rext ${ADAMSGAMES}
	qltools ScottZX_qdos.img -fdd ScottZX
	qltools ScottZX_qdos.img -w BOOT ScottZX ptr.gen sigext30.rext ${ADAMSGAMES}
	-rm AdamsGames.zip ${ADAMSGAMES} ptr.gen ptrgen206.zip sigext30.rext sigext30mod.zip
