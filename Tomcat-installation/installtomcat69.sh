#!/bin/bash
# Steps for Installing tomcat9 on rhel7&8
# install Java JDK 1.8+ as a pre-requisit for tomcat to run.
# https://github.com/LandmakTechnology/package-management/tree/main/Tomcat-installation
sudo hostnamectl set-hostname tomcat
cd /opt
sudo yum install git wget vim -y
sudo yum install java-1.8.0-openjdk-devel -y
# Download tomcat software and extract it.
# dowanload and extract tomcat software
sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.73/bin/apache-tomcat-9.0.73.tar.gz
sudo tar -xvf apache-tomcat-9.0.73.tar.gz
sudo rm apache-tomcat-9.0.73.tar.gz
sudo mv apache-tomcat-9.0.73 tomcat9
sudo chmod 777 -R /opt/tomcat9
sudo sh /opt/tomcat9/bin/startup.sh
# create a soft link to start and stop tomcat from anywhere
# to manage tomcat as a service
sudo ln -s /opt/tomcat9/bin/startup.sh /usr/bin/starttomcat
sudo ln -s /opt/tomcat9/bin/shutdown.sh /usr/bin/stoptomcat
sudo starttomcat
echo "end on tomcat installation"
sudo su - ec2-user

#2. Start of tomcat configuration 
If you wish to modify this restriction, you'll need to edit the Manager's context.xml file.

vi /opt/tomcat9/webapps/manager/META-INF/context.xml


If you have not changed any configuration files, please examine the file conf/tomcat-users.xml in your installation. That file must contain the credentials to let you use this webapp.

vi /opt/tomcat9/conf/tomcat-users.xml
	

  
	
  #Tomcat server configuration:
find / -name server.xml context.xml
vim /opt/tomcat9/conf/server.xml
