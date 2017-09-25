#NETWORK ANALYZER Makefile 
#
#Networkpacket Analyzer configuration for the makefile
#####################################################3
networkpacketanalyzer.o: networkpacketanalyzer.sh
	g++ -c networkpacketanalyzer.sh

networkscan.o: networkscan.sh
	g++ -c networkscan.sh

main: networketpacketanalyzer.sh networkscan.sh
	g++ -o main networketpacketanalyzer.sh networkscan.sh

execute: main
	clear
	date
	main
	gnuplot network.gnuplot
	cp main.sh ~/mlobasso/unix/final
	chmod -R +x ~/mlobasso/unix/final

clean:
	rm *.o


# Next step: add a variable for the compiler

CCC=g++

main.o:	main.cpp
	${CCC} -c main.cpp

networkpacketanalyzer.o: networkscan.sh
	${CCC} -c networkpacketanalyer.sh

main: main.o networkpacketanalyzer.o
	${CCC} -o main main.o networkpacketanalyzer.o
