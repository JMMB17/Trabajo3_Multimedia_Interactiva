class TorusLissajous{
  
  float freqSlider; //from 1 to 30
  float freqSlider2; //from 1 to 30
  float radius0_Slider; //from 1 to 200
  float radius1_Slider;  //from 1 to 200
  float offset;
  
  TorusLissajous(float freqSlider, float freqSlider2, float radius0_Slider, float radius1_Slider, float offset){
    this.freqSlider = freqSlider;
    this.freqSlider2 = freqSlider2;
    this.radius0_Slider = radius0_Slider;
    this.radius1_Slider = radius1_Slider;
    this.offset = offset;
  }
  
  void torusLissajous(){
    beginShape();
    for(float phi = 0; phi < radians(360); phi += radians(0.2)){
      float x = (radius0_Slider + radius1_Slider * cos(phi*freqSlider2 + offset)) * sin(phi*freqSlider);
      float y = radius1_Slider * sin(phi*freqSlider2 + offset);
      float z = (radius0_Slider + radius1_Slider * cos(phi*freqSlider2 + offset)) * cos(phi*freqSlider);
      vertex(x, y, z);
    }
    endShape();
  }
  
}
