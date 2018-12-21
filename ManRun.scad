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

//Head and Face
module Head(){
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
//mouth
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
    } } } }
    
//body
module Body(){
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

//appendage
module appendage(x){
color("Floralwhite"){

//moving joint
translate([0,0,5*x]){
sphere(1.5*x);}

//upper part and joint
translate([0,0,5*x]){
rotate([0,45,0]){
cylinder(r=1.5*x,h=5*x);
translate([0,0,5*x]){
sphere(1.5*x); } } }

//lower part
cylinder(r=1.5*x,h=5*x); }

//wrist
color("SandyBrown"){
scale([1,.5,1])sphere(1.5*x);}
}
//Hand
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

//merge hand and appendage
module arm(){
    appendage(1);
    translate([0,0,-1.8]){
    rotate([0,180,-90]){
    hand(.9);}}
    }

//MoveHead
module RotateHead(x){
if(x == 0){rotate([0,0,45]){
Head();}}
else if(x == 3){rotate([0,0,-45]){
Head();}}
else if(x == 1 || x==2){rotate([0,0,0]){
Head();}}
}

//MoveArm
module RotateArm(x){
if(x==0){
rotate([0,-90,0])
translate([-4,0,-9])
arm();}

else if(x==1){
rotate([0,-45,0])
translate([-4,0,-9])
arm();}

else if(x==2){
rotate([0,0,0])
translate([-4,0,-9])
arm();}

else if(x==3){
rotate([0,45,0])
translate([-4,0,-9])
arm();}
}

//merge and appendage shoe
module Leg(){
    color("MidnightBlue"){
    appendage(1.2);}
    //shoe
    color("DarkSlateGray"){
    translate([-1.6,0,-.8]){
    scale([2,1,.6]){sphere(2);}
    } } }

//MoveLeg   
module RotateLeg(x){
if(x==0){
rotate([0,-90,0])
translate([-4.8,0,-10.8])
Leg();}

else if(x==1){
rotate([0,-45,0])
translate([-4.8,0,-10.8])
Leg();}

else if(x==2){
rotate([0,0,0])
translate([-4.8,0,-10.8])
Leg();}

else if(x==3){
rotate([0,45,0])
translate([-4.8,0,-10.8])
Leg();}
}
Body();
//RightHand
module RightHand(x){
translate([0,-6.5,-6.5]){
rotate([-20,0,0]){
RotateArm(x);}}}
//LeftHand
module LeftHand(x){
translate([0,6.5,-6.5]){
rotate([20,0,0]){
RotateArm(3-x);}}}

//RightLeg
module RightLeg(x){
translate([0,-4.5,-22]){
rotate([10,0,180]){RotateLeg(x);} }
}

//Leftleg
module LeftLeg(x){
translate([0,4.5,-22]){
rotate([-10,0,180]){RotateLeg(3-x);}
} }

//Run Moveset
module MoveSet(x){
    RotateHead(x);
    RightHand(x);
    LeftHand(x);
    RightLeg(x);
    LeftLeg(x);
    }
    
MoveSet(0);
