#include <ArduinoMqttClient.h>
#include "wi_fi.h"

const char topic_gate[]  = "topic_gate";
const char topic_number_visitor[]  = "topic_number_visitor";
const char broker[] = "192.168.2.221";
wifi_i wifi_1;
MqttClient mqttClient(wifi_1.wifiClient);

class mqtt{
  public:
  int        port     = 1883;
  void connect();
  void receive_handler(void (*function)());
  void start_subscribe();
  void check_update();
};

void mqtt::connect(){
  Serial.print("Attempting to connect to the MQTT broker: ");
  Serial.println(broker);
  if (!mqttClient.connect(broker, port)) {
    Serial.print("MQTT connection failed! Error code = ");
    Serial.println(mqttClient.connectError());

    while (1);
  }
  Serial.println("You're connected to the MQTT broker!");
  Serial.println();
}

void mqtt::receive_handler(void (*function)()){
  mqttClient.onMessage(function);
}

void mqtt::start_subscribe(){
  Serial.print("Subscribing to topic: ");
  Serial.println(topic_gate);
  Serial.println();

  mqttClient.subscribe(topic_gate);
}

void mqtt::check_update(){
  mqttClient.poll();
}
  

  
