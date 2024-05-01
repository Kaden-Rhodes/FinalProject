#include <stdio.h>
#include <iostream>
using namespace std;
int main()
{
    int size = 16;
    for(int i = 0; i < size; i++){
        for(int j = 0; j < size; j++){
            if(i==0){//IS FIRST ROW?
                if(j == 0){//IF IS CORNER 1
                    cout<<"evolve3 e"<<i<<"_"<<j<<" (grid_evolve["<<(i)*size+(j)<<"], grid[1], grid["<<size<<"], grid["<<size+1<<"], grid["<<(i)*size+(j)<<"]);"<<endl;
                }
                else if(j == size-1){//IF IS CORNER 2
                    cout<<"evolve3 e"<<i<<"_"<<j<<" (grid_evolve["<<(i)*size+(j)<<"], grid["<<size - 2<<"], grid["<<size+size-2<<"], grid["<<size+size-1<<"], grid["<<(i)*size+(j)<<"]);"<<endl;
                }
                else{
                    cout<< "evolve5 e"<<i<<"_"<<j<<" (grid_evolve["<<(i)*size+(j)<<"], grid["<<(i)*size+(j)-1<<"], grid["<<(i)*size+(j)+1<<"], grid["<<(i+1)*size+(j)-1<<"], grid["<<(i+1)*size+(j)<<"], grid["<<(i+1)*size+(j)+1<<"], grid["<<(i)*size+(j)<<"]);" <<endl;
                }
            }
            else if(i == size-1){//IS LAST ROW?
                if(j == 0){//IF IS CORNER 3
                    cout<<"evolve3 e"<<i<<"_"<<j<<" (grid_evolve["<<(i)*size+(j)<<"], grid["<<(i-1)*size<<"], grid["<<(i-1)*size+1<<"], grid["<<(i)*size+(j)+1<<"], grid["<<(i)*size+(j)<<"]);"<<endl;
                }
                else if(j == size-1){//IF IS CORNER 4
                    cout<<"evolve3 e"<<i<<"_"<<j<<" (grid_evolve["<<(i)*size+(j)<<"], grid["<<(i)*size-2<<"], grid["<<(i)*size-1<<"], grid["<<(i)*size+(j)-1<<"], grid["<<(i)*size+(j)<<"]);"<<endl;
                }
                else{
                    cout<< "evolve5 e"<<i<<"_"<<j<<" (grid_evolve["<<(i)*size+(j)<<"], grid["<<(i-1)*size+(j)-1<<"], grid["<<(i-1)*size+(j)<<"], grid["<<(i-1)*size+(j)+1<<"], grid["<<(i)*size+(j)-1<<"], grid["<<(i)*size+(j)+1<<"], grid["<<(i)*size+(j)<<"]);" <<endl;
                }
            }
            else{//IS MIDDLE ROW
                if(j == 0){//IF IS LEFT SIDE
                    cout<< "evolve5 e"<<i<<"_"<<j<<" (grid_evolve["<<(i)*size+(j)<<"], grid["<<(i-1)*size+(j)<<"], grid["<<(i-1)*size+(j)+1<<"], grid["<<(i)*size+(j)+1<<"], grid["<<(i+1)*size+(j)<<"], grid["<<(i+1)*size+(j)+1<<"], grid["<<(i)*size+(j)<<"]);" <<endl;
                }
                else if(j == size-1){//IF IS RIGHT SIDE
                    cout<< "evolve5 e"<<i<<"_"<<j<<" (grid_evolve["<<(i)*size+(j)<<"], grid["<<(i-1)*size+(j-1)<<"], grid["<<(i-1)*size+(j)<<"], grid["<<(i)*size+(j)-1<<"], grid["<<(i+1)*size+(j-1)<<"], grid["<<(i+1)*size+(j)<<"], grid["<<(i)*size+(j)<<"]);" <<endl;
                }
                else{
                    cout << "evolve8 e"<<i<<"_"<<j<<" (grid_evolve["<<(i)*size+(j)<<"], grid["<<(i-1)*size+(j-1)<<"], grid["<<(i-1)*size+(j)<<"], grid["<<(i-1)*size+(j+1)<<"], grid["<<(i)*size+(j-1)<<"], grid["<<(i)*size+(j+1)<<"], grid["<<(i+1)*size+(j-1)<<"], grid["<<(i+1)*size+(j)<<"], grid["<<(i+1)*size+(j+1)<<"], grid["<<(i)*size+(j)<<"]);" << endl;
                }
            }
        }
    }

    return 0;
}