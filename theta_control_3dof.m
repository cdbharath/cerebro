%Inverse Kinematic equations for a 3dof arm

l1=0.2;
l2=0.2;  %IDEAL CASE
L=sqrt((l1^2)+(l2^2));

x=0;
y=0;
z=0.4;

%Planar component
t=sqrt(x^2+y^2);

%Revolute angle sum and diff
theta12diff= acos((z^2+t^2-L^2)/(2*l1*l2));
theta12summ= acos((z^2-t^2-L^2)/(2*l1*l2));

%declaring pid constants and increment variables
kp = 0.20;
ki = 0.5;
kd = 0.1;

%calculating all the error variables
theta_req = zeros(1,3);
error_theta = zeros(1,3);
error_prev = zeros(1,3);
delta_theta = zeros(1,3);
instant_theta = zeros(1,3);
sum_error_theta = zeros(1,3);
dif_error_theta = zeros(1,3);

%Individual angle obtained using arccosine

theta_req(1,1)= (theta12diff+theta12summ)/2;
theta_req(1,2)= (theta12diff-theta12summ)/2;
theta_req(1,3)= acos(y/(l1*cos(theta_req(1,1))+l2*cos(theta_req(1,2))));

while true
    
    for i=1:+1:3
        error_theta(1,i)   = theta_req(1,i)-instant_theta(1,i) ;    
    end
     
    for i=1:+1:3
        sum_error_theta(1,i) = sum_error_theta(1,i) + error_theta(1,i);       
        dif_error_theta(1,i) = error_theta(1,i) - error_prev(1,i);
    end 
    
    for i=1:+1:3
        delta_theta(1,i)   = kp*error_theta(1,i) + ki*sum_error_theta(1,i) + kd*dif_error_theta(1,i);         
    end
    
    for i=1:+1:3
        error_prev(1,i)   = error_theta(1,i) ;    
    end
    
end   

