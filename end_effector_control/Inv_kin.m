syms x y
l1=0;%link length, Refer the image
l2=185;
l3=215;
l4=0;
x1 = 0;%end effector coordinates
y1 = 0;
z = 400;
a=atan(y1/x1);
eq1 = atan(z-l1,(((l3*sin(y))^2+(l2+l3*cos(y))^2)^.5-(z-l1)^2))-atan(l3*sin(y),((l2+l3*cos(y)))) == 0;
eq2 = acos(((x-l4*cos(a))^2+(y-l4*sin(a))^2+(z-l1)^2-l2*l2-l3*l3)/(2*l3*l2))==0;
vars=[y x];
eqns=[eq1 eq2];
[soly,solx]=vpasolve([eq1 eq2],[y x]);
%[sol, param, cond] = solve(eq1,eq2,x,y,'ReturnConsitions',true);
disp(a);
disp(mod(solx,6.28));
disp(mod(soly,6.28));