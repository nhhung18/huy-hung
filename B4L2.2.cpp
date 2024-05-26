#include<iostream>
#include<algorithm>
#include<sstream>
using namespace std;
//Khai bao ham nguyen mau
void input_array(int *a, int n);
void add_element_and_print(int *a , int n, int x);
void add_element_and_print2(int *a, int n, int x);
int main(){
	int t;
	cout<<"Enter test case: ";
	cin>>t;
	cin.ignore();
	while(t--){
		int n,x,a,b,c;
		string input;
		cout<<"Enter 3 numbers: ";
		getline(cin, input);
		stringstream ss(input);
		ss>>a>>b>>c;
		cout<<"n = ";
		cin>>n;
		int *arr = new int[n];//Mang dong quan li mang
		input_array(arr,n);
		if(b <= 0){//Chen c vao dau mang
			x = c; 
			add_element_and_print2(arr,n,x);//Them dau mang
		}else if(b >= a){//Chen c vao cuoi mang
			x = c;
			add_element_and_print(arr,n,x);//Them cuoi mang
		}
		cin.ignore();
		}
	return 0;
}

void input_array(int *a, int n){
	for(int i=0; i<n; i++){
		cout<<"arr["<<i<<"] = ";
		cin>>a[i];
	}
}

void add_element_and_print(int *a, int n, int x){
	int *new_arr = new int[n+1];
	for(int i=0; i<n; i++){
		new_arr[i] = a[i];
	}
	new_arr[n] = x;
	
	delete[] a;
	
	a = new_arr;
	for(int i=0; i<n+1; i++){
		cout<<a[i]<<" ";
	}
	cout<<endl;
}

void add_element_and_print2(int *a, int n, int x){
	int *new_arr = new int[n+1];
	for(int i=0; i<n; i++){
		new_arr[i]=a[i];
	}
	delete[] a;
	for(int i=n; i>=0; i--){//Di chuyen vi tri cua mang
		new_arr[i] = new_arr[i-1];
	}
	new_arr[0]=x;
	a = new_arr;//Gan vung nho moi
	for(int i=0; i<n+1; i++){
		cout<<a[i]<<" ";
	}
	cout<<endl;
}
