$fn=30;
//eye
module eye(){
scale([.8,1,.7]){    
rotate([0,-90,0]){
difference(){
cylinder(2,center=true);
translate([0,0,1])
sphere(.9,center=true);}
}}}

//smile
module smile(){
hull(){
translate([0,-2,1]){
sphere(.2,center=true);}
translate([0,2,1]){
sphere(.2,center=true);}
sphere(.2,center=true);}}

module core(){
//head
color("SandyBrown"){    
 difference(){
difference(){   
scale([.9,1.1,1]){sphere(4);}
translate([3.5,-1.5,1]){
eye();}
translate([3.5,1.5,1]){
eye();}
}
//Mouth
translate([3,0,-2.6]){
smile();} }

//nose
translate([3.4,0,-.8]){
cylinder(2,1,0,$fn=4);}
}

color("Black"){
//right eyeball
translate([2.8,-1.56,1]){
sphere(.56,center=true);}
//left eyeball
translate([2.8,1.56,1]){
sphere(.56,center=true);}
//hair
scale([.9,1.1,1]){
translate([-.4,0,1]){    
sphere(3.8,center=true);    
    } } }

color("FloralWhite"){
//body and shoulder
hull(){
//neck
translate([0,0,-5.6]){
scale([1,2,2])cube(2,center=true);}
//left shoulder
translate([0,5,-7]){
sphere(1.5);}
//right shoulder
translate([0,-5,-7]){
sphere(1.5);}
//under navel
translate([0,0,-21.6]){
scale([.5,1,0.3]){sphere(5);}}
//main body
translate([0,0,-14]){
minkowski(){
cube([2,8,16],center=true);
cylinder(r=1,h=0.1);} } } } }

//arm
module appendage(x){
color("Floralwhite"){
//shoulder 
translate([3*x,0,3*x]){
sphere(1.2*x);} 
//elbow and lower arm
hull(){
sphere(x);
translate([0,0,-2.5*x]){
cylinder(r=1.2*x,h=4*x,center = true);} } 
//elbow and upper arm
rotate([0,45,0]){
hull(){
sphere(x);
translate([0,0,2.5*x]){
cylinder(r=1.2*x,h=4*x,center = true);} } } }
//wrist
color("SandyBrown"){
translate([0,0,-4.5*x]){
scale([1,.5,1])sphere(1.15*x);} }
}

module hand(q){
color("SandyBrown"){
x=0.2*q; y=1.3*q; z=1.6*q; w =2*q; e=0.4*q;
//palm
hull(){
    scale([x,y,z]){cube(w,center=true);}
  translate((w/2)*[x,y,z]){
       sphere(e);}
   translate((w/2)*[-x,y,z]){
       sphere(e);}
   translate((w/2)*[x,-y,z]){
       sphere(e);}
   translate((w/2)*[-x,-y,z]){
       sphere(e);}
   translate((w/2)*[x,y,-z]){
       sphere(e);}
   translate((w/2)*[-x,y,-z]){
       sphere(e);}
   translate((w/2)*[x,-y,-z]){
      sphere(e);}
   translate((w/2)*[-x,-y,-z]){
      sphere(e);}
    } 
//head finger    
translate([0,y*1.8,-z+2]){ 
rotate([-40,0,0]){
hull(){
sphere(.5*q);
translate([0,0,-z*1]){
cylinder(r=.5*q,h=q,center = true);} }}}

//point finger
translate([0,y*1.2,z*2.4]){ 
 rotate([-10,0,0]){
hull(){
sphere(.5*q);
translate([0,0,-z*1.5]){
cylinder(r=.5*q,h=q,center = true);} }} }

//middle finger
translate([0,.2*y,z*2.8]){ 
hull(){
sphere(.5*q);
translate([0,0,-z*1.5]){
cylinder(r=.5*q,h=2*q,center = true);} }}

//ring finger
translate([0,-y/1.8,z*2.4]){ 
hull(){
sphere(.5*q);
translate([0,0,-z*1.5]){
cylinder(r=.5*q,h=2*q,center = true);} }}

//little finger
translate([0,-y*1.4,z*1.6]){ 
rotate([20,0,0]){
hull(){
sphere(.5*q);
translate([0,0,-z*1]){
cylinder(r=.5*q,h=.5*q,center = true);} }} }
    }
}
//head and body
core();
    
//right arm
translate([3,-8,-13.5]){
rotate([-30,-75,15]){
appendage(1.5); } } 

//left arm
translate([-5,8,-11.5]){
rotate([30,0,0]){
appendage(1.5); } } 

//right leg
color("MidnightBlue"){
translate([-4,-4,-27]){
rotate([0,210,0]){
appendage(1.5); } } }

//left leg
color("MidnightBlue"){
translate([3.8,4.5,-27]){
rotate([0,150,15]){
appendage(1.5); } } }

//left hand
translate([-5,12.5,-19.5]){
rotate([180,-20,90]){
hand(.9);}} 

//right hand
translate([12,-10.5,-15]){
rotate([90,0,75]){
hand(.9);}} 

//left shoe
color("DimGray"){
translate([3.8,4.5,-35]){
rotate([0,15,15]){
scale([2,1,.6]){sphere(2);}}} 

//right shoe
translate([-10.5,-4,-31]){
rotate([0,75,-15]){
scale([2,1,.6]){sphere(2);}}} }