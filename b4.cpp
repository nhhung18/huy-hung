#include<bits/stdc++.h>
using namespace std;
void input_arr(int *arr, int n);
int main(){
    int t; cout<<"t = "; cin>>t;
    while(true){
    int n, k , x;
    cout<<"Input n, k, x: "; cin>>n>>k>>x;
    while(fabs(k) <= pow(10, 9) || fabs(x) <= pow(10, 9)){
        cout<<"Retype n,k,x: "; cin>>n>>k>>x;
    }
    int *arr = new int[n];
    input_arr(arr, n);

    t--;
    }
    return 0;
}

void input_arr(int *arr, int n){
    for(int i = 0 ; i < n ; i++){
        cin>>arr[i];
    }
}

