//$fn=100;

// Official Specs
W_in       =1.75;//in
L_in       =7;//in
H_in       =1.25;//in
Daxle_in   =.073*1.3;//in
Xaxle1_in  =0.81;//in
Xaxle2_in  =(0.81+4.4);//in

in2mm=25.4;

W=W_in*in2mm;
L=L_in*in2mm;
H=H_in*in2mm;
Daxle=Daxle_in*in2mm;
Xaxle1=Xaxle1_in*in2mm;
Xaxle2=Xaxle2_in*in2mm;

D_hole_weights=5;
X_weights=110;

indents=7;

HeightRed=0;
spoiler=-1;
backDent=5;

module DefsideProfile(){

    polygon(points=[
    [-0.1,7],
    [L-spoiler,H-HeightRed],
    [L,H+.1],
    [0,H+.1]
    ]);
    
    polygon(points=[
    [L+.1,H+.1],
    [L+.1-backDent,H/2],
    [L+.1,0]
    ]);

}

module DeffrontProfile(){
//    difference(){
//    polygon(points=[
//    [H/2,0],
//    [H/2,W],
//    [H,W],
//    [H,0],
//    ]);
//    translate([H/2-4,W/2,0])
//        circle(r=10);
//        
//    }
    
}

module DefTopProfile(){
//    //sides
//    polygon(points=[
//    [40,-.10],
//    [45,indents],
//    [115,indents],
//    [120,0],
//    ]);
//    polygon(points=[
//    [40,W+.1-0],
//    [45,W-indents],
//    [115,W-indents],
//    [120,W+.1-0],
//    ]);
}






module base(){
    difference(){
    cube([W,L,H]);
    translate([0,Xaxle1,Daxle+1])
        rotate([0,90,0])
            cylinder(W,Daxle/2,Daxle/2);
    translate([0,Xaxle2,Daxle+1]) 
        rotate([0,90,0])   
            cylinder(W,Daxle/2,Daxle/2);
    
    translate([0,X_weights,10]) 
        rotate([0,90,0])   
            cylinder(W,D_hole_weights,D_hole_weights);
    }
    
}


module topProfile(){
    translate([W,0,0])
        rotate([0,0,90])
            translate([0,0,-.1])
                linear_extrude(W+.2)
                    DefTopProfile();
}

module sideProfile(){
    rotate([90,0,180])
        rotate([0,-90,0])
            translate([0,0,-.1])
                linear_extrude(W+.2)
                    DefsideProfile();
}
module frontProfile(){
    rotate([-90,-90,0])
    translate([0,0,-.1])
    linear_extrude(L+.2)
    translate([0,-0.01,0])
    scale([1,1.01,1])
        DeffrontProfile();
}

module showSideProfile(){
rotate([0,0,90])
        DefsideProfile();
}

module showFrontProfile(){
rotate([0,0,-90])
        DeffrontProfile();
}

module showTopProfile(){
translate([W*2+10,0,0])
rotate([0,0,90])
        DefTopProfile();
}


difference(){
    base();
    sideProfile();
    frontProfile();
    topProfile();
}
showFrontProfile();
f66fshowSideProfile();
showTopProfile();

//projection(cut=true) rotate([0,90,0]) base();


