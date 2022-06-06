#include "protothreads.h"
#include "component.h"
#include "Mqtt.h"

void handler();

mqtt MQtt;
gate Gate; 
counter Counter;
highDetector HighDetector;
flameDetector FlameDetector;
temperatureDetector TemperatureDetector;
visitor Visitor;

void setup(){
    Serial.begin(1200);
    MQtt.receive_handler(handler);
    MQtt.start_subscribe();

}
void loop(){
  MQtt.check_update(); 
  // check for visitor
    // if there is visitor
      // update number
      // send number of visitor    
      // get number, temperatur, high
      // send visitor data
  // check for fire

}

void handler(){
  // controlling gate

}
/*

// function prototype
int people_counter_pt(struct pt* pt); // send number of people + high + temperatur
int gate_controller_pt(struct pt* pt); // open and close gate including led indicator
int sonsors_pt(struct pt* pt);
void onMqttMessage(int messageSize);

void people_counter(); 
void gate_controller(int msg);
/////////////////////////////////////////////////////////////////



//mqtt information
MqttClient mqttClient(wifiClient);

const char broker[] = "192.168.2.221";
int        port     = 1883;
const char topic_gate[]  = "topic_gate";
const char topic_number_visitor[]  = "topic_number_visitor";

const long interval = 8000;
unsigned long previousMillis = 0;
int count = 0;



// thread handler
pt ptCounter;
pt ptSensors;
pt ptGate;

void setup() {
  Serial.begin(9600);

  // initialize thread handler
  PT_INIT(&ptCounter);
  PT_INIT(&ptSensors);
  PT_INIT(&ptGate);


}

void loop() {
   
  // run the threads
  // PT_SCHEDULE(<function_name>(&<thread_handler>));
  //# PT_SCHEDULE(people_counter_pt(&ptCounter));
  //# PT_SCHEDULE(gate_controller_pt(&ptGate));
}

//////////////////////////////////////////////////////////////////


int people_counter(struct pt* pt) {
  PT_BEGIN(pt);

  // Loop forever
  for(;;) {
	PT_YIELD(pt);
  }

  PT_END(pt);
}

int gate_controller(struct pt* pt) {
  PT_BEGIN(pt);
  PT_END(pt);
}

//////////////////////////////////////////////////////////////////

// receive message
void onMqttMessage(int messageSize) {
  // we received a message, print out the topic and contents
  Serial.println("Received a message with topic '");
  Serial.print(mqttClient.messageTopic());
  Serial.print("', length ");
  Serial.print(messageSize);
  Serial.println(" bytes:");

  // use the Stream interface to print the contents
  while (mqttClient.available()) {
    Serial.print((char)mqttClient.read());
  }
  Serial.println();
  Serial.println();
}
*/


