#include<bits/stdc++.h>
using namespace std;

//class: lop
//thuoc tinh: attribute
//phuong thuc: method, behavior
//object: doi tuong

//Encapsulation: Dong goi
// Access modifier: Private, Public, Protected
class SinhVien{
	//Thuoc tinh va phuong thuc
private:
	string id, ten, ns;
	double gpa;
public:
	SinhVien(); // constructor: ham khoi tao moi khi tao moi 1 sv
	
	// void xin_chao();
	// void di_choi();
	void nhap();
	void xuat();
	double getGpa();
	string getId();
	string getName();
	void setGpa(double);

};
// Implememtation
 SinhVien::SinhVien(){
 	id = ten = ns = "";
 	gpa = 0;
 }

// SinhVien::SinhVien(string _id, string _ten, string _ns, double _gpa){
//	cout<<"Ham khoi tao co tham so"<<endl;
//	id = _id;
//	ten = _ten
//	ns = _ns;
//	gpa = _gpa;
//}

// void SinhVien::xin_chao(){
// 	cout<<"Hi"<<endl;
// }
// void SinhVien::di_choi(){
// 	cout<<"Di choi i"<<endl;
// }

void SinhVien::nhap(){
	cout<<"Id: "; cin>>this->id;
	cin.ignore();
	cout<<"Ten: "; getline(cin, this->ten);
	cout<<"Nam sinh: ";getline(cin, this->ns);
	cout<<"Diem: "; cin>>gpa;
}

void SinhVien::xuat(){
	cout<<"Id: "<<this->id<<" "<<"Ten: "<<this->ten<<" "<<"Nam sinh: "<<this->ns<<" "<<"GPA: "<<this->gpa;
}

double SinhVien::getGpa(){
	return this->gpa;
}

//destructor
// SinhVien::~SinhVien(){
// 	//cout<<"Doi tuong duoc huy"<<endl;
// }

string SinhVien::getName(){
	return this->ten;
}

void SinhVien::setGpa(double gpa){
	this->gpa = gpa;
}

int main(){
	SinhVien sv;
	// sv.xin_chao();
	// sv.di_choi();	

	// sv.nhap();
	// sv.xuat();	
	// cout<<endl;
	// cout<<"in ra gpa: ";
	// cout<<sv.getGpa();
	// cout<<"in ra ten: "<<sv.getName();

	sv.setGpa(2.18);
	sv.xuat();
	return 0;
}
