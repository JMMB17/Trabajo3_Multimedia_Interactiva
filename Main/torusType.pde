class TorusType{
  
  float sigmaDensitySlider; //  de 0 a 36
  float phiDensitySlider; //  de 0 a 36
  float radius0_Slider; //  de 0 a 200
  float radius1_Slider; //  de 0 a 200
  float offset;
  
  TorusType(float sigmaDensitySlider, float phiDensitySlider, float radius0_Slider, float radius1_Slider, float offset){
    this.sigmaDensitySlider = sigmaDensitySlider;
    this.phiDensitySlider = phiDensitySlider;
    this.radius0_Slider = radius0_Slider;
    this.radius1_Slider = radius1_Slider;
    this.offset = offset;
  }
  
  void torusType(){
    for(float sigma = 0; sigma < radians(360); sigma += radians(360/sigmaDensitySlider)){
      beginShape(POINTS);
      for(float phi = 0; phi < radians(360); phi += radians(360/phiDensitySlider)){
        float x = (radius0_Slider + radius1_Slider * cos(phi+(offset))) * sin(sigma+(offset));
        float y = radius1_Slider * sin(phi+(offset));
        float z = (radius0_Slider + radius1_Slider * cos(phi+(offset))) * cos(sigma+(offset));
        vertex(x, y, z);
      }
      endShape();
    }
  }
  
}
