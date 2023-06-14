class GraysKlein{
  
  float radius0_Slider; //from 30 to 80
  float radius1_Slider; //from 0 to 5
  float freqSlider; //from 0 to 5
  float freqSlider2; //from 0 to 10
  float offset;
  
  GraysKlein(float radius0_Slider, float radius1_Slider, float freqSlider, float freqSlider2, float offset){
    this.radius0_Slider = radius0_Slider;
    this.radius1_Slider = radius1_Slider;
    this.freqSlider = freqSlider;
    this.freqSlider2 = freqSlider2;
    this.offset = offset;
  }
  
  void graysKlein(){
    for(float theta = 0; theta < radians(360); theta += radians(7)){
      beginShape();
      for(float phi = 0; phi < radians(720); phi += radians(7)){
        float x = radius0_Slider*((radius1_Slider + cos(freqSlider*phi/2.0 + offset) * sin(theta) - sin(freqSlider*phi/2.0) * sin(2*theta)) * cos(freqSlider2*phi/2.0));
        float y = radius0_Slider*((radius1_Slider + cos(freqSlider*phi/2.0) * sin(theta + offset) - sin(freqSlider*phi/2.0) * sin(2*theta)) * sin(freqSlider2*phi/2.0));
        float z = radius0_Slider*(sin(freqSlider*phi/2.0) * sin(theta) + cos(freqSlider*phi/2.0 + offset) * sin(2*theta));
        vertex(x, y, z);
      }
      endShape(CLOSE);
    }
  }
  
}
