CC=g++
CXXFLAGS=-fPIC -g -O0 -std=c++11 -fprofile-arcs -ftest-coverage -lgcov -lgtest -lgmock -lstdc++ -lgtest_main -lpthread

bin2=test
bin=a.out

obj2=test_class1.o class1.o
obj=main.o class1.o

.SUFFIXES: .cpp .cc .c
.cpp.o:
	${CC} ${CXXFLAGS} -c $<
.cc.o:
	${CC} ${CXXFLAGS} -c $<
.c.o:
	${CC} ${CFLAGS} -c $<

$(bin2):$(obj2)
	${CC} -o $@ ${CXXFLAGS} $?
$(bin):$(obj)
	${CC} -o $@ ${CXXFLAGS} $?
check:
	make ${bin2}
	./${bin2}
	lcov --directory . --capture --output-file t.info
	lcov --remove t.info "/usr*" -o t.info
	genhtml -o results t.info
clean:
	tp ${bin} ${bin2} *.o *.gcno *.gcda results t.info 


