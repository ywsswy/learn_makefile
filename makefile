bin2=test
bin3=a.out

obj=main.o class1.o
obj2=test_class1.o

CC=g++
CXXFLAGS=-fPIC -g -O0 -fprofile-arcs -ftest-coverage -lgcov
CFLAGS=-fPIC -g -O0 -fprofile-arcs -ftest-coverage -lgcov

.SUFFIXES: .cpp .cc .c
.cpp.o:
	gcc ${CXXFLAGS} -c $<
.cc.o:
	${CC} ${CXXFLAGS} -c $<
.c.o:
	gcc ${CFLAGS} -c $<

$(bin2):$(obj2)
	gcc ${CXXFLAGS} -o $(bin2) -lstdc++ -lgtest -lgtest_main -lgmock $(test) $?
$(bin3):$(obj)
	gcc -g -O0 -o $(bin3) -lstdc++ $(test) $?
main.o:main.cc
	gcc -g -O0 -c $?
class1.o:class1.cc
	gcc -g -O0 -c $?
test_class1.o:test_class1.cc
	gcc -g -O0 -std=c++11 $(test) -c $?

clean:
	tp a.out test *.o *.gcno *.gcda results t.info 


