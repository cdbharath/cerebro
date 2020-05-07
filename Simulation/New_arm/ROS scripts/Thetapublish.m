rosinit;

%Publisher  publishing  to the control theta 
%subscriber subscribing to simulation theta values
%custom message file simulation/theta

pub_name = rospublisher('/controltheta','catkin_ws/theta');
sub_name=rossubscriber("/thetafeedback",@callbacktheta)

pause(2)

%Creating a ROS msg holder 
theta=rosmessage(pub_name);

%declaring variables
theta_req = zeros(1,3);
error_theta = zeros(1,3);
error_prev = zeros(1,3);
delta_theta = zeros(1,3);
instant_theta = zeros(1,3);
sum_error_theta = zeros(1,3);
dif_error_theta = zeros(1,3);

%declaring pid constants and increment variables
kp = 0.20;
ki = 0.5;
kd = 0.1;


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
    theta.theta1=delta_theta(1,1)         %place for input for theta1
    theta.theta2=delta_theta(1,2)         %place for input for theta2
    theta.theta3=delta_theta(1,3)         %place for input for theta3
    send(pub_name,theta)
end 
        
 Callback function for theta feedback from Gazebo
 function callbacktheta(msg)
     xyz=msg.position
 end

