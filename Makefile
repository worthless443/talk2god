include config.mk
RANDOM=random2
GODWORD=godwords
OBJ_DEP=randomfromptr

all: create_outdir ${GODWORD} ${RANDOM} create_script

create_outdir: 
	@mkdir ${BIN} 2>/dev/null || echo bin exists
$(OBJ_DEP): % : %.o
	$(CXX) -c $@.cc -o ${BIN}/$^
$(RANDOM): $(OBJ_DEP)
	$(CXX) $@.cc ${BIN}/$^.o ${BIN}/$(GODWORD).o -o ${BIN}/$@ 
$(GODWORD): $(OBJ_DEP)
	$(CXX) $@.cc -D__BASED_PTR -D__MAIN__ ${BIN}/$^.o -o ${BIN}/$@ 
	$(CXX) -c $@.cc -D__BASED_PTR -o ${BIN}/${GODWORD}.o
clean:
	rm -rf *.o ${BIN} ${OUTSCRIPT}
	
