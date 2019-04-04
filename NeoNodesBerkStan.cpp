//Andrés Campos Tams - A01024385

#include<iostream>
#include<fstream>
#include<cmath>
using namespace std;

//The main program
int main(int argc, char **argv)
{
	ofstream A;
	A.open("NodesBerkStan.csv");
	A<<"nodeId\n";
	for(unsigned long int i=0;i<685230;i++)
	{
		A<<i+1;
		A<<"\n";
	}
	A.close();
    return 0;
}
