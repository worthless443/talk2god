#include<iostream>
#include<vector>
#ifdef __MAIN_RANDOM__
extern std::vector<std::string> v_God;
int main() {
	extern int randomsize_ptr_bounded(int);
	std::cout << randomsize_ptr_bounded(v_God.size()) << "\n";
}
#endif
