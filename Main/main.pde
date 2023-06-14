import processing.sound.*;
import peasy.*;
import netP5.*;
import oscP5.*;

PeasyCam camera;
Amplitude amp;
AudioIn in;

GraysKlein graysK = new GraysKlein(60, 2.5, 3, 1, 0);
TorusLissajous torusL = new TorusLissajous(14, 15, 130, 80, 0);
TorusType torusT = new TorusType(36, 36, 130, 80, 0);
BumpyTorus bumpyT = new BumpyTorus(130,80,6,6,0);

boolean ttIncrease = false; 


int[] colors = {#FF0000, #FF00B3, #5500FF, #00DEFF, #00FF66, #DEFF00, #FF9100};

void setup(){
  size(1920, 1080, P3D);
  colorMode(HSB, 360, 100, 100, 100);
  OscP5 oscP5 = new OscP5(this, 11111);
  camera = new PeasyCam(this, 960, 540, 0, 1000);
  
  stroke(23, 59, 75);//color name: rakuda-iro
  strokeWeight(5);
  noFill();
  
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
  
}

void oscEvent(OscMessage oscMessage) {
  
  modifyTorusL(torusL, oscMessage.checkAddrPattern("/metro250"));
  modifyTorusT(torusT, oscMessage.checkAddrPattern("/metro500"), oscMessage.checkAddrPattern("/metro1000"));
  modifyBompyT_GraysK(graysK, bumpyT, oscMessage.checkAddrPattern("/metro2000"));

  
  /*if (oscMessage.checkAddrPattern("/metro250")){
    
  }else if (oscMessage.checkAddrPattern("/metro500")){

  }else if (oscMessage.checkAddrPattern("/metro1000")){

  }else if (oscMessage.checkAddrPattern("/metro2000")){
  
  }*/
  
}

void draw(){

  background(43, 19, 100);//color name: torinoko-iro
  
  if (amp.analyze() > 0.2){
      stroke(colors[int(random(7))]);
    }
  pushMatrix();
  translate(480, 270);
  torusL.torusLissajous();
  popMatrix();
  
  if (amp.analyze() > 0.2 && torusT.sigmaDensitySlider < 36){
      stroke(colors[int(random(7))]);
    }
  pushMatrix();
  translate(1440, 270);
  torusT.torusType();
  popMatrix();
  
  if (amp.analyze() > 0.2){
      stroke(colors[int(random(7))]);
    }
  pushMatrix();
  translate(480, 810);
  graysK.graysKlein();
  popMatrix();
  
  if (amp.analyze() > 0.2){
      stroke(colors[int(random(7))]);
    }
  pushMatrix();
  translate(1440, 810);
  bumpyT.bumpyTorus();
  popMatrix();
  
  torusL.offset += radians(0.5);
  torusT.offset += radians(0.32);
  graysK.offset += radians(0.5);
  bumpyT.offset += radians(0.5);
  
  
}


void modifyTorusL(TorusLissajous TL, boolean m250){
  if (TL.freqSlider2 > 1 && m250){
    TL.freqSlider2 -= 0.5;
  }
  else if(TL.freqSlider2 <= 1 && m250){
    TL.freqSlider2 = 15;
  }
  if(TL.radius0_Slider > 10 && m250){
    TL.radius0_Slider -= 5;
  }
  else if(TL.radius0_Slider <= 10 && m250){
    TL.radius0_Slider = 14;
  }
  
}

void modifyTorusT(TorusType TT, boolean m500, boolean m1000){
  if (TT.phiDensitySlider > 5 && m500 && !ttIncrease){
    TT.phiDensitySlider -= 4;
  }
  else if(TT.phiDensitySlider < 36 && m500){
    ttIncrease = true;
    TT.phiDensitySlider += 6;
    if(TT.phiDensitySlider >= 36 ){
      ttIncrease = false;
    }
  }
  
  if(TT.radius1_Slider < 200 && m1000){
      TT.radius1_Slider += 10;
  }
  else if(TT.radius1_Slider >= 200){
      TT.radius1_Slider = 50;
  }
}

void modifyBompyT_GraysK(GraysKlein GK, BumpyTorus BT, boolean m2000){
   if(GK.freqSlider > 0 && m2000){
     GK.freqSlider -= 1;
   }
   else if(GK.freqSlider <= 0 && m2000){
     GK.freqSlider = 4;
   }
   if(BT.freqSlider > 0 && m2000){
     BT.freqSlider -= 2;
   }
   else if(BT.freqSlider <= 0 && m2000){
     BT.freqSlider = 6;
   }
}
