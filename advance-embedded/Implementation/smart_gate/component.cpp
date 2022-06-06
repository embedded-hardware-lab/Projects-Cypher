#include "component.h"
#include <SoftwareSerial.h>
#include "Arduino.h"


gate::gate(){
}

void gate::set_lock(){
  

  int  start = 0;

  while( start< 1501){
    digitalWrite(led_red_pin, 1);
    digitalWrite(led_green_pin, 0);

    digitalWrite(motor_pin1, 0);
    digitalWrite(motor_pin2, 0);
    digitalWrite(motor_pin3, 0);
    digitalWrite(motor_pin4, 1);
    delay(2);

    digitalWrite(motor_pin1, 0);
    digitalWrite(motor_pin2, 0);
    digitalWrite(motor_pin3, 1);
    digitalWrite(motor_pin4, 0);
    delay(2);

    digitalWrite(motor_pin1, 0);
    digitalWrite(motor_pin2, 1);
    digitalWrite(motor_pin3, 0);
    digitalWrite(motor_pin4, 0);
    delay(2);

    digitalWrite(motor_pin1, 1);
    digitalWrite(motor_pin2, 0);
    digitalWrite(motor_pin3, 0);
    digitalWrite(motor_pin4, 0);
    delay(2);
    start++;
  }
}

void gate::set_unlock(){
  
  
  int  start = 0;

  while(start< 1501){
    digitalWrite(led_green_pin, 1);
    digitalWrite(led_red_pin, 0);

    digitalWrite(motor_pin1, 1);
    digitalWrite(motor_pin2, 0);
    digitalWrite(motor_pin3, 0);
    digitalWrite(motor_pin4, 0);
    delay(2);

    digitalWrite(motor_pin1, 0);
    digitalWrite(motor_pin2, 1);
    digitalWrite(motor_pin3, 0);
    digitalWrite(motor_pin4, 0);
    delay(2);

    digitalWrite(motor_pin1, 0);
    digitalWrite(motor_pin2, 0);
    digitalWrite(motor_pin3, 1);
    digitalWrite(motor_pin4, 0);
    delay(2);

    digitalWrite(motor_pin1, 0);
    digitalWrite(motor_pin2, 0);
    digitalWrite(motor_pin3, 0);
    digitalWrite(motor_pin4, 1);
    delay(2);
    start++;
  }
}

counter::counter(){
    
}
bool counter::isVisitor(){
    // Read the button state
    int btnState = digitalRead(sw_pin);
    bool rtn = false;

    //If we detect 0 signal, button is pressed
    if (btnState == 0) {
        //if 50ms have passed since last 0 pulse, it means that the
        //button has been pressed, released and pressed again
        if (millis() - lastButtonPress > 50) {
            rtn = true; 
        }

        // Remember last button press event
        lastButtonPress = millis();
    }

    // Put in a slight delay to help debounce the reading
    return rtn;
    delay(1);
}
int counter::get_number_visitor(){
  return current_number_visitor;
}

bool counter::update_number_visitor(){
  bool rtn = false;
  while(isVisitor()){// takde perubahan orang
    currentStateCLK = digitalRead(clock_pin);
    if (currentStateCLK != lastStateCLK && currentStateCLK ==1) {
      if (digitalRead(data_pin) != currentStateCLK) {
          current_number_visitor--;
          rtn =  false;
      }
      else {
          // Encoder is rotating CW so increment
          current_number_visitor++;
          total_number_visitor++;
          rtn =  true;
      }           
    } 
    lastStateCLK = currentStateCLK;
  }    
    return rtn;
}

flameDetector::flameDetector(){
    
    
}

bool flameDetector::isFlame(){

  if(digitalRead(flame_pin) == HIGH){
    return true;
  }
  else{
    return false;
  }
}


temperatureDetector::temperatureDetector(){
}

int temperatureDetector::get_temperature(){


  int Vo;
  float R1 = 10000; // value of R1 on board
  float logR2, R2, T;
  float c1 = 0.001129148, c2 = 0.000234125, c3 = 0.0000000876741; //steinhart-hart coeficients for thermistor

  Vo = analogRead(temperature_pin);
  R2 = R1 * (1023.0 / (float)Vo - 1.0); //calculate resistance on thermistor
  logR2 = log(R2);
  T = (1.0 / (c1 + c2*logR2 + c3*logR2*logR2*logR2)); // temperature in Kelvin
  T = T - 273.15; //convert Kelvin to Celcius

  return int(T);
}

highDetector::highDetector(){
   
}

int highDetector::get_high(){
    digitalWrite(trigger_pin, 1);
    delayMicroseconds(10);
    digitalWrite(trigger_pin, 0);

    // measure duration of pulse from ECHO pin
    duration_us = pulseIn(echo_pin, 1);

    // calculate the distance
    distance_cm = 0.017 * duration_us;
    height = max - distance_cm;

    return int(height);
}

visitor::visitor(){
}

void visitor::set_initial(){
  number = 0;
  high = 0;
  temperature = 0;
}
