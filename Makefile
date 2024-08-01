include config.mk
RANDOM=random2
GODWORD=god
OBJ_DEP=randomfromptr.o godwords.o
FLAGS=-I./

script=l_1 l_2 l_3 l_4 l_5 l_6 l_7 l_8 l_9 l_10 l_11 l_12 l_13 l_14 l_15 l_16 l_17 l_18 l_19 l_20 l_21 l_22
DEF=__MAIN_${BUILD}__

all: $(OBJ_DEP)

ifdef SCRIPT
all: create_outdir ${BUILD} ${script}
else
all: create_outdir ${BUILD}
endif

RANDOM: $(RANDOM)
GOD: bin/$(GODWORD)

create_outdir: 
	@mkdir ${BIN} 2>/dev/null || echo bin exists
$(OBJ_DEP): %.o : %.cc
	$(CXX) -c $^ -o $@ -D${DEF} ${FLAGS}
$(RANDOM): $(OBJ_DEP)
	$(CXX) $@.cc $^ -o $@ -D${DEF} ${FLAGS}
bin/$(GODWORD): $(OBJ_DEP)
	$(CXX) $(patsubst bin/%, god.cc,${@}) -D__BASED_PTR $^ -o $@ -D${DEF} ${FLAGS}
clean:
	rm -rf *.o ${BIN} ${OUTSCRIPT}

l_0:
	 echo "" | tee -a genp
l_1:
	 echo "#!/bin/bash" | tee -a genp
l_2:
	 echo "i=3952" | tee -a genp
l_3:
	 echo "echo "processing - Stage 1"" | tee -a genp
l_4:
	 echo "rawtext=$(while [ ! $i -eq 0 ]; do [ $i -gt 1 ] && printf "%s " $(./bin/godwords);i=$(($i - 1));[ $i -eq 1 ] && echo;done)" | tee -a genp
l_5:
	 echo "_text=$(awk 'BEGIN{ORS="\n";RS=" "}{print}' <<< $rawtext)" | tee -a genp l_6: echo "_pickedword=$(awk "NR==$(./bin/random2){print}" <<< $_text)" | tee -a genp
l_7:
	 echo "i=5" | tee -a genp
l_8:
	 echo "echo "Selected word - $pickedword"" | tee -a genp
l_9:
	 echo "echo "processing - Stage 2"" | tee -a genp
l_10:
	 echo "while true; do" | tee -a genp
l_11:
	 echo "	rawtext=$(while [ ! $i -eq 0 ]; do [ $i -gt 1 ] && printf "%s " $(./bin/godwords);i=$(($i - 1));[ $i -eq 1 ] && echo;done)" | tee -a genp
l_12:
	 echo "	text=$(awk 'BEGIN{ORS="
";RS=" "}{print}' <<< $rawtext)" | tee -a genp
l_13:
	 echo "	B=$(awk "/$_pickedword/{print NR}" <<< $_text)" | tee -a genp
l_14:
	 echo "	n=$(($n+1))" | tee -a genp
l_15:
	 echo "	printf "Searching (%d)" $n" | tee -a genp
l_16:
	 echo "	grep  "$_pickedword" <<< $rawtext 2>/dev/null >/dev/null && break" | tee -a genp
l_17:
	 echo "done" | tee -a genp
l_18:
	 echo "W=$(($n + $(awk 'NR==1{print}'<<< $B)))" | tee -a genp
l_19:
	 echo "printf " Generating Word from God ** "" | tee -a genp
l_20:
	 echo "i=3952" | tee -a genp
l_21:
	 echo "rawtext=$(while [ ! $i -eq 0 ]; do [ $i -gt 1 ] && printf "%s " $(./bin/godwords);i=$(($i - 1));[ $i -eq 1 ] && echo;done)" | tee -a genp
l_22:
	 echo "text=$(awk 'BEGIN{ORS="
";RS=" "}{print}' <<< $rawtext)" | tee -a genp
