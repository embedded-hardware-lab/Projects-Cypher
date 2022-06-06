#include "component.h"

gate::gate(){
}
void gate::set_lock(){
}

void gate::set_unlock(){
}

counter::counter(){
}
bool counter::isVisitor(){

}
int counter::get_number_visitor(){

}
void counter::update_number_visitor(){

}

flameDetector::flameDetector(){

}

bool flameDetector::isFlame(){

}

temperatureDetector::temperatureDetector(){
}

int temperatureDetector::get_temperature(){

}

highDetector::highDetector(){
}

int highDetector::get_high(){

}

visitor::visitor(){
}

void visitor::set_initial(){
  number = 0;
  high = 0;
  temperature = 0;
}