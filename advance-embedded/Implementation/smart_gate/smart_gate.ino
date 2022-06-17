#include <WiFiNINA.h>
#include <ArduinoMqttClient.h>
#include "component.h"

#define wifi_inidicator A4
#define broker_inidicator A5
#define fire_inidicator A3

const char topic_gate[]  = "topic_gate";
const char topic_new_visitor_number[]  = "topic_new_visitor_number";
const char topic_new_visitor_high[]  = "topic_new_visitor_high";
const char topic_new_visitor_temperature[]  = "topic_new_visitor_temperature";
const char topic_number_visitor[]  = "topic_number_visitor";
const char flameS[]  = "flameS";
char msg[]  = "xxxxxx";
const char broker[] = "192.168.45.167";
int        port     = 1883;

WiFiClient wifiClient;
MqttClient mqttClient(wifiClient);


char ssid[] = "Galaxy s20";        
char pass[] = "malaysia"; 


void handler(int messageSize);


gate Gate; 
counter Counter;
highDetector HighDetector;
flameDetector FlameDetector;
temperatureDetector TemperatureDetector;
visitor tempVisitor;

void setup(){
    Serial.begin(9600);

    pinMode(Gate.led_red_pin,OUTPUT);
    pinMode(Gate.led_green_pin,OUTPUT);
    pinMode(Gate.motor_pin1,OUTPUT);
    pinMode(Gate.motor_pin2,OUTPUT);
    pinMode(Gate.motor_pin3,OUTPUT);
    pinMode(Gate.motor_pin4,OUTPUT);
    pinMode(Counter.clock_pin,INPUT);
    pinMode(Counter.data_pin,INPUT);
    pinMode(Counter.sw_pin,INPUT_PULLUP);
    pinMode(HighDetector.trigger_pin,OUTPUT);
    pinMode(HighDetector.echo_pin,INPUT);
    pinMode(TemperatureDetector.temperature_pin,INPUT);
    pinMode(FlameDetector.flame_pin,INPUT);
    pinMode(broker_inidicator ,OUTPUT);
    pinMode(wifi_inidicator ,OUTPUT);
    pinMode(fire_inidicator ,OUTPUT);

    Serial.print("Attempting to connect to SSID: ");
    Serial.println(ssid);
    while (WiFi.begin(ssid, pass) != WL_CONNECTED) {
      Serial.print(".");
    delay(5000);
    }
    digitalWrite(wifi_inidicator, HIGH);
    Serial.println("You're connected to the network");
    Serial.println();

    

    Serial.print("Attempting to connect to the MQTT broker: ");
    Serial.println(broker);
      if (!mqttClient.connect(broker, port)) {
        Serial.print("MQTT connection failed! Error code = ");
        Serial.println(mqttClient.connectError());

        while (1);
      }
  digitalWrite(broker_inidicator, HIGH);
  Serial.println("You're connected to the MQTT broker!");
  Serial.println();

  mqttClient.onMessage(handler);
  mqttClient.subscribe(topic_gate);
  digitalWrite(Gate.led_red_pin,HIGH);
  Serial.println();
}


void loop(){
  mqttClient.poll(); 

  if(Counter.update_number_visitor()){  // return true if the number is increase
  Serial.println("bertambah orang..........................");
    tempVisitor.number = tempVisitor.number + 1; //set nth number of visitor
    tempVisitor.high = HighDetector.get_high(); // set visitor high
    tempVisitor.temperature = TemperatureDetector.get_temperature(); // set visitor temperature

    mqttClient.beginMessage(topic_new_visitor_number); // publish visitor nth number
    mqttClient.print(tempVisitor.number);
    mqttClient.endMessage();
    
    mqttClient.beginMessage(topic_new_visitor_temperature);  // publish visitor  temperature
    mqttClient.print(tempVisitor.temperature);
    mqttClient.endMessage(); 

    mqttClient.beginMessage(topic_new_visitor_high); // publish visitor high
    mqttClient.print(tempVisitor.high);
    mqttClient.endMessage(); 
  }

  mqttClient.beginMessage(topic_number_visitor); // publish current number of visitor 
  mqttClient.print(Counter.get_number_visitor());
  mqttClient.endMessage(); 

  if(FlameDetector.isFlame()){ // if there is fire
    mqttClient.beginMessage(flameS); // publish the state of fire 
    mqttClient.print(FlameDetector.isFlame());
    mqttClient.endMessage(); 
    digitalWrite(fire_inidicator, HIGH);
  }
  else{
    mqttClient.beginMessage(flameS); // publish the state of fire 
    mqttClient.print(FlameDetector.isFlame());
    mqttClient.endMessage(); 
    digitalWrite(fire_inidicator, LOW);
  }
  delay(10);
}

void handler(int messageSize){
  Serial.println(mqttClient.messageTopic());
  for (int i = 0 ; mqttClient.available(); i++) {
    msg[i] = (char)mqttClient.read();
  }
  if( msg[0] == 'l' ){
    Gate.set_lock();
  }
  if( msg[0] == 'u' ){
    Gate.set_unlock();
  }
}
