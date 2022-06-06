#include "Arduino.h"

class gate{
  public:
  gate();
  int led_red_pin = 13;
  int led_green_pin = 12;
  int motor_pin1 = 8;
  int motor_pin2 = 9;
  int motor_pin3 = 10;
  int motor_pin4 = 11;
   void set_lock();
  void set_unlock();
    
};

class counter{
  public:
  counter();
  int clock_pin = 2;
  int data_pin = 3;
  int sw_pin = 4;
  int btnState;
  int lastButtonPress;
  int  lastStateCLK;
  int currentStateCLK;
  int currentDir;
  int current_number_visitor = 0;
  int total_number_visitor = 0;
  bool isVisitor();
  int get_number_visitor(); 
  bool update_number_visitor(); 
};

class flameDetector{
  public:
  flameDetector();
  int flame_pin= 5 ;
  bool state = false;
  bool isFlame();
};

class temperatureDetector{
  public:
  int temperature_pin = A2;
  int temperature;
  bool state = false;
  temperatureDetector();
  int get_temperature();
};

class highDetector{
  public:
  int duration_us;
  int distance_cm;
  int height;
  int trigger_pin = 7;
  int echo_pin = 6;
  highDetector();
  int get_high();
  int max = 300;
};

class visitor{
  public:
  int number = 0;
  int temperature = 0;
  int high = 0;
  visitor();
  void set_initial();
};
