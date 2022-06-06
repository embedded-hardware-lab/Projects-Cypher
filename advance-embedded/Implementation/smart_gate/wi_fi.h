/*//#include <WiFiNINA.h>

char ssid[] = "Galaxy S20";        
char pass[] = "malaysia"; 

class wifi_i{
  public: 
  wifi_i();  
  WiFiClient wifiClient;
  void connect();

};

wifi_i::wifi_i(){

}

void wifi_i::connect(){
  Serial.print("Attempting to connect to SSID: ");
  Serial.println(ssid);
  while (WiFi.begin(ssid, pass) != WL_CONNECTED) {
    Serial.print(".");
    delay(5000);
  }
  Serial.println("You're connected to the network");
  Serial.println();
}
*\
 
  
