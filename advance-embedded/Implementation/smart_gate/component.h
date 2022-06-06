
class gate{
  public:
  gate();
  int led_red_pin = 0;
  int led_green_pin = 0;
  int motor_pin1 = 0;
  int motor_pin2 = 0;
  int motor_pin3 = 0;
  int motor_pin4 = 0;
  void set_lock();
  void set_unlock();
    
};

class counter{
  public:
  counter();
  int pinCounter;
  int pinWeight;
  int current_number_visitor = 0;
  int total_number_visitor = 0;
  bool isVisitor();
  int get_number_visitor(); 
  void update_number_visitor(); 
};

class flameDetector{
  public:
  bool state = false;
  flameDetector();
  bool isFlame();
};

class temperatureDetector{
  public:
  bool state = false;
  temperatureDetector();
  int get_temperature();
};

class highDetector{
  public:
  highDetector();
  int get_high();
};

class visitor{
  public:
  int number = 0;
  int temperature = 0;
  int high = 0;
  visitor();
  void set_initial();
};



