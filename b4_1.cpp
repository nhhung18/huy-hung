#include<bits/stdc++.h>
using namespace std;
void input_arr(int *arr, int n);
void add_element(int *arr, int n, int x);
void add_element_1(int *arr, int n, int x);
int main(){
    int t; cout<<"t = "; cin>>t;
    while(t > 0){
    int n, k , x;
    cout<<"Input n, k, x: "; cin>>n>>k>>x;
    while(fabs(k) >= pow(10, 9) || fabs(x) >= pow(10, 9)){
        cout<<"Retype n,k,x: "; cin>>n>>k>>x;
    }
    int *arr = new int[n];
    input_arr(arr, n);
    if(k >= n){ 
        add_element(arr, n, x);
    }else if(k <= 0){
        add_element_1(arr, n, x);
    }
    t--;
    }
    return 0;
}

void input_arr(int *arr, int n){
    for(int i = 0 ; i < n ; i++){
        cin>>arr[i];
    }
}

void add_element(int *arr, int n, int x){
    int *new_arr = new int[n + 1];
    for(int i = 0; i < n; i++){
        new_arr[i] = arr[i];
    }
    new_arr[n] = x;
    delete[] arr;
    arr = new_arr;
    for(int i = 0; i <  n + 1; i++){
        cout<<"arr["<<i<<"]";
        cout<<new_arr[i]<<" ";
    }
    cout<<endl;
}

void add_element_1(int *arr, int n, int x){
    int *new_arr = new int[n + 1];
    for(int i = 0; i < n; i++){
        new_arr[i+1] = arr[i];
    }
    new_arr[0] = x;
    delete[] arr;
    arr = new_arr;
    for(int i = 0; i < n + 1; i++){
        cout<<arr[i]<<" ";
    }
}