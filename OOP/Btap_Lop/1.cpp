#include<bits/stdc++.h>
using namespace std;
void sxGPA(int n , double diem[]);
class SinhVien{
private:
	double gpa;
public:
//	SinhVien();
//	~SinhVien();
	void nhapDiem();
	double inDiem();
	double getGPA();
	
};
void SinhVien::nhapDiem(){
	cin>>gpa;
}
double SinhVien::inDiem(){
	return gpa;
}
double SinhVien::getGPA(){
	return this->gpa;
}
int main(){
	int n; cout<<"n = "; cin>>n;
	SinhVien sv[n];
	double diem[n];
	cout<<"Nhap gpa cac SV: ";
	for(int i = 0; i < n; i++){
		sv[i].nhapDiem();
		//Gan diem sv vao mang moi
		diem[i] = sv[i].inDiem();
	}
	sxGPA(n, diem);
	cout<<"Sap xep: ";
	for(int i = 0; i < n; i++){
		cout<<diem[i]<<" ";
	}
	return 0;
}
void sxGPA(int n, double diem[]){
	double max = diem[0];
	for(int i = 0 ; i < n; i++){
		for(int j = 0; j < n - i - 1; j++){
			if(diem[j] > diem[j+1]){
				swap(diem[j], diem[j+1]);
			}
		}
		
	}
}
