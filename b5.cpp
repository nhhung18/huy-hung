#include<bits/stdc++.h>
using namespace std;
void input_arr(int *arr, int n);
void delete_element(int *arr, int n, int x);
int main(){
    int t; cout<<"t = "; cin>>t;
    while(t > 0){
    int n, x;
    cout<<"Input n, x: "; cin>>n>>x;
    while(fabs(n) >= pow(10, 9) || fabs(x) >= pow(10, 9)){
        cout<<"Retype n,k,x: "; cin>>n>>x;
    }
    int *arr = new int[n];
    input_arr(arr, n);
    delete_element(arr, n, x);
    t--;
    }
    return 0;
}

void input_arr(int *arr, int n){
    for(int i = 0 ; i < n ; i++){
        cin>>arr[i];
    }
}

void delete_element(int *arr, int n, int x){
    int *new_arr = new int[n-1];
    for(int i = 0; i < n; i++){
        if(arr[i] == x){
            continue;
        }
        new_arr[i] = arr[i];   
    }
    // new_arr[] = 
    delete[] arr;
    arr = new_arr;
    for(int i = 0; i < n; i++){
        cout<<arr[i]<<" ";
    } 
}


