CFLAGS = -g

vxi11_cmd: vxi11_cmd.o vxi11_user.o vxi11_clnt.o vxi11_xdr.o
	g++ $(CFLAGS) -o vxi11_cmd vxi11_cmd.o vxi11_user.o vxi11_clnt.o vxi11_xdr.o

vxi11_cmd.o: vxi11_cmd.c vxi11_user.cc vxi11.h
	g++ $(CFLAGS) -c vxi11_cmd.c -o vxi11_cmd.o

vxi11_user.o: vxi11_user.cc vxi11.h
	g++ $(CLFAGS) -c vxi11_user.cc -o vxi11_user.o 

vxi11.h: vxi11.x
	rpcgen vxi11.x

vxi11_clnt.c: vxi11.x
	rpcgen vxi11.x

vxi11_xdr.c: vxi11.x
	rpcgen vxi11.x

clean:
	rm -f *.o vxi11_cmd vxi11.h vxi11_svc.c vxi11_xdr.c vxi11_clnt.c

install:
	cp -f vxi11_cmd /usr/local/bin/