float x, y,x1,y1,z1,r=100;
float angle1 = 0.0;
float angle2 = 0.0;
float angle3=0.0;
float angle4=0.0;
float segLength = 100;
float d=0,e=0,f=0,g=0,h=0,i=0,p=0;
void setup() {
  size(640, 360,P3D);
  strokeWeight(30);
  stroke(255, 160);
  
  x = width * 0.3;
  y = height * 0.5;
  translate(x,y);

}

void draw() {
  background(0);
  translate(x,y);
  stroke(255,0,0);
  strokeWeight(40);
  point(100,90);
  strokeWeight(30);
  stroke(255);
  angle1 = (mouseX/float(width) - 0.5) * -PI;//Along Z axis
  angle2 = (mouseY/float(height) - 0.5) * PI;//Along xaxis
  rotateY(angle1);
  rect(-20,-20,40,40);
  stroke(255,0,0);
  point(0,0);
  stroke(255);
  rotateZ(angle2);
  rect(10,-20,80,40);
  float dx=cos(angle1)*70*cos(angle2);
  float dy=sin(angle1)*70*cos(angle2);
  float dz=70*sin(angle2);
  translate(dx,dy-10,dz);
  stroke(255,0,0);
  point(0,0);
  stroke(255);
   if(mousePressed==true)
{angle4=(mouseX/float(width) - 0.5) * -PI;
 }
 else
 angle4=0;
  //stroke(255,0,0);
  //point(0,0);
  //stroke(255);
  //rotateZ(angle4);
 // rect(-10,-10,20,-100);
g=g+0.1; 
p=p+0.1;
}
