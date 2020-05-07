#include<stdio.h>
#include<math.h>
int main()
{
float theta[3]={1,1,1};
float del=1;
float l1=0,l2=40,l3=100,l4=0;
float x=10,y=100,z=10;
float a,b,c,r,A,B,C;
theta[0]=atan(y/x);
a=l3*sin(theta[2]);
b=l2+l3*cos(theta[2]);
c=z-l1;
r=pow(pow(a,2)+pow(b,2),0.5);
A=x-l4*cos(theta[0]);
B=y-l4*sin(theta[0]);
C=z-l1;
printf("%f",(A*A+B*B+C*C-l2*l2-l3*l3)/(2*l2*l3));
theta[2]=acos((A*A+B*B+C*C-l2*l2-l3*l3)/(2*l2*l3));
theta[1]=atan(c/(pow(r*r-c*c,0.5)))-atan(a/b);
printf("%f %f %f",theta[0],theta[1],theta[2]);
}
