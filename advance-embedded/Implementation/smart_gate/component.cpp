#include "component.h"
#include <SoftwareSerial.h>
#include "Arduino.h"


gate::gate(){
}

void gate::set_lock(){
        //if gate close     
        analogWrite(led_red_pin, OUTPUT);


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

   
}

void gate::set_unlock(){
        //if gate open
        analogWrite(led_green_pin, OUTPUT);
       


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

  
}

counter::counter(){
    
}
bool counter::isVisitor(){
    // Read the button state
    int btnState = digitalRead(sw_pin);

    //If we detect 0 signal, button is pressed
    if (btnState == 0) {
        //if 50ms have passed since last 0 pulse, it means that the
        //button has been pressed, released and pressed again
        if (millis() - lastButtonPress > 50) {
            return true; 
        }

        // Remember last button press event
        lastButtonPress = millis();
    }

    // Put in a slight delay to help debounce the reading
    delay(1);
}
int counter::get_number_visitor(){
    // Remember last CLK state
    lastStateCLK = currentStateCLK;
    Serial.print(currentStateCLK);
   
  }

bool counter::update_number_visitor(){
    // Read the current state of CLK
    currentStateCLK = digitalRead(clock_pin);

    // If last and current state of CLK are different, then pulse occurred
    // React to only 1 state change to avoid double count
    if (currentStateCLK != lastStateCLK && currentStateCLK == 1) {

        // If the DT state is different than the CLK state then
        // the encoder is rotating CCW so decrement
        if (digitalRead(data_pin) != currentStateCLK) {
            total_number_visitor--;
            currentDir = 0; //anti clock wise
        }
        else {
            // Encoder is rotating CW so increment
            total_number_visitor++;
            currentDir = 1; // clock wise
        }


        if (currentDir == 1) {
            currentDir = 0;
            return true;
        }
        else {
            return false;

        }
    }

}

flameDetector::flameDetector(){
    
    
}

bool flameDetector::isFlame(){
      return analogRead(flame_pin);
}

temperatureDetector::temperatureDetector(){

 

}

int temperatureDetector::get_temperature(){
    temperature = analogRead(temperature_pin);
    // read analog volt from sensor and save to variable temp
    temperature = temperature * 0.48828125;
    // convert the analog volt to its temperature equivalent
    return int(temperature);
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
