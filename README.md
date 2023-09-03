# Water-Quality-Monitoring-System-For-Lobster-Pond-Embedded-Part
Mobile App Developemnt part for my Final Year Project which is "Water Quality Monitoring System for Lobster Pond"

## Flow Chart of the System
The flow of the system starts by collecting data. If the system chose to collect data, then 
the sensor will read the data and send to the microcontroller. Next is the verification 
of internet connection on ESP8266 board. If the internet is connected, the data will be 
sent to the cloud via internet. If the internet is not connected, the process will return 
back to the previous process. After that is condition whether data is sent to the mobile 
app for data visualization or not. If the data is sent, the data will be shown on the 
mobile app’s dashboard. If not, the process will go back to the beginning which is 
collecting data.

<div align="center">
  <img src="https://i.ibb.co/fCP3PRw/Screenshot-2023-09-04-004343.png" alt="Flow Chart">
</div>

## Dashboard

<div align="center">
  <img src="https://i.ibb.co/F6P313f/Screenshot-20230304-124629.png" alt="Dashboard">
</div>
