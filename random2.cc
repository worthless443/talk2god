#include<iostream>
#include<vector>
extern std::vector<std::string> v_God;
int main() {
	extern int randomsize_ptr_bounded(int);
	std::cout << randomsize_ptr_bounded(v_God.size()) << "\n";
}
