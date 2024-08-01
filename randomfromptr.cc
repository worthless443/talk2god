#include<stdio.h>
#include<stdlib.h>

int getlastdig(long int what, int many) {
	int tmp = 1, tmpff = 1;
	for(int i=0;i<many;++i) {
		if(tmp==1) tmp = (tmp << 4) << 1;
		else tmp <<= 4;
		tmpff<<=4;
	}
	return (what & tmp - 1) & (tmpff -1);
}

int getBetweenNum(int a, long unsigned int cmp) {
	int store = 1, deg;
	for(deg=1;(a>>=deg);++deg) 
		store <<= 4;
	if(getlastdig(cmp, deg) > (store - 1))
		return getlastdig(cmp, deg);
	else if(getlastdig(cmp, deg - 1) > ((store >> 4) - 1)) 
		return  getlastdig(cmp, deg - 1);
	else 
		return  getlastdig(cmp, deg - 2);
}

int randomsize_ptr_unbounded() {
	int _;
	long unsigned int size_ptr = (long unsigned int)&_;
	return getBetweenNum(10, size_ptr);
}

int randomsize_ptr_bounded(int size) {
	return randomsize_ptr_unbounded() % size;
}

int __memset(int *ptr) {
	int len;
	long long store = 0;
	long unsigned int size_ptr = (long unsigned int)ptr;
	for(int i=1;size_ptr >> i;++i) {
		store = (store + 1) << 4;		
		--store;
	}
	store >>= 4;
	///printf("%p\n%p\n", (void*)store, ptr);
	//printf("0x%x\n",  ((store >> 63) + 1));
	return 1;
}
#ifdef __MAIN__
int main() {
		printf("%d\n",randomsize_ptr_bounded(3500));
}
#endif
