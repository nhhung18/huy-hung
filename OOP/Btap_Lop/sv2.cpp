#include<bits/stdc++.h>
using namespace std;
class SinhVien{
private:
	string maSV, hoTen;
	int tuoi;
public:
void setmaSV(string s){
	maSV = s;
}
string getmaSV(){
	return maSV;
}

void sethoTen(string s){
	hoTen = s;
}
string gethoTen(){
	return hoTen;
}

void setTuoi(int x){
	tuoi = x;
}
int getTuoi(){
	return tuoi;
}
SinhVien();
SinhVien(string , string , int );
// SinhVien(string x = "", string y = "", int z = 0) : maSV(x), hoTen(y), tuoi(z) {}

};
SinhVien::SinhVien(){
	this->maSV = this->hoTen = "";
	this->tuoi = 0;
}
SinhVien::SinhVien(string x, string y, int z){
	this->maSV = x;
	this->hoTen = y;
	this->tuoi = z;
}

int main(){
	int n; cout<<"n = "; cin>>n;
	SinhVien sv[n];
	string x, y;
	int z;
	cout<<"Nhap MSV va HoTen va Tuoi SV: ";
	for(int i = 0 ; i < n; i++){
		cin>>x;
		sv[i].setmaSV(x);
		cin>>y;
		sv[i].sethoTen(y);
		cin>>z;
		sv[i].setTuoi(z);
		// tuoi[i] = z; 
	}

	// cout<<"MSV va HoTen SV: "<<endl;
	// for(int i = 0; i < n; i++){
	// 	cout<<sv[i].getmaSV()<<" "<<sv[i].gethoTen()<<endl;
	// }

	string tmp_s ="";
	int max = sv[0].getTuoi();
	for(int i = 0 ; i < n; i++){
		if(sv[i].getTuoi() > max){
			max = sv[i].getTuoi();
			tmp_s = sv[i].gethoTen();
		}
	}
	cout<<max<<" "<<tmp_s;
	// cout<<"Nguoi co tuoi lon nhat la: ";
	// cout<<sv[0].gethoTen();

	// SinhVien sv("123", "Hung");
	// cout<<sv.getmaSV()<<" "<<sv.gethoTen();

	return 0;
}