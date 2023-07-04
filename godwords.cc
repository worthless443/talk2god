#include<string>
#include<random>
#include<sstream>
#include<iostream>
#include<fstream>
#include<cstdlib>
#include<vector>

#include<time.h>
#ifndef GOD_SOURCE 
#define GOD_SOURCE "/etc/godwords_uniq"
#endif 

// copied code from stackoverflow :(
size_t getrandom(int s,int e) {
    std::random_device dev;
    std::mt19937 rng(dev());
    std::uniform_int_distribution<std::mt19937::result_type> dist6(s,e); 
    return dist6(rng);
}

void read_Godwords(const char *fn, std::string &buffer) {
	std::ifstream file;
	file.open(fn);
	file >> buffer;
	file.close();
}

auto vectorize_god(std::string God) {
	std::vector<std::string> v_GodWors;
	std::stringstream str(God);
	std::string parse;
	while(std::getline(str,parse,',')) v_GodWors.push_back(parse);
	return v_GodWors;
}

template<class T>
auto get_GodWords(T v, int count) {
	srand(time(0));
	std::stringstream strm;
#ifdef __BASED_PTR
	extern int randomsize_ptr_bounded(int);
	strm << v[randomsize_ptr_bounded( v.size())];
	return strm.str();
#else
	while(--count>0) {
		strm << v[(std::rand() % (v.size()))] << " ";
	}
	return strm.str();
#endif
}

#ifdef  __BASED_PTR
const char *endl = " ";
#else
const char *endl = "\n";
#endif
static std::vector<std::string> parse_holy_to_arr() {
	std::string God;
	read_Godwords(GOD_SOURCE, God);
	auto v_God = vectorize_god(God);
	return v_God;
}
auto v_God = parse_holy_to_arr();

#ifdef __MAIN__
int main(int argc, char **argv) {
	auto Godstr = get_GodWords(v_God,argc > 1 ? std::atoi(*(argv+1)) : 69);
	std::cout << Godstr;
}
#endif
