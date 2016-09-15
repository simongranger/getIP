#getIP 

Is meant as a small ios app to grab the currently used IP address of the ios device it is installed on, and write it to the syslog.  You can use idevicesyslog | grep -i ipaddress:  to grab the ip address of that device 

It is meant as a automated way to get the IP to create your appium.txt to connect to physical devices. The IP is set in the cap spec of appium.txt 
