# Nagios-Core Setup on CentOS 7 

## What is Nagios Core?
<p align="center">
  <img width="200" height="150" src="img/NagiosCore.png">
</p>

Nagios Core is the monitoring and alerting engine that serves as the primary application around which hundreds of Nagios projects are built.
<p align="center">
Source: 
<a href="https://www.nagios.org/">www.nagios.org</a>
</p> 

## What is NRPE? 
<p align="center">
  <img width="600" height="350" src="img/NRPE-Diagram.png">
</p>

Nagios Remote Plugin Executor (NRPE) is a Nagios agent that allows remote system monitoring using scripts that are hosted on the remote systems. It allows for monitoring of resources such as disk usage, system load or the number of users currently logged in.
<p align="center">
Source: 
<a href="https://en.wikipedia.org/wiki/Nagios#:~:text=Nagios%20Remote%20Plugin%20Executor%20(NRPE,of%20users%20currently%20logged%20in.">Wiki Page</a>
</p> 

## Prerequisities for Setup:

* Access to AWS 
* Terraform 0.12
* Ansible

## Folders 

[nagios_core](nagios_core) :
Contains Terraform code to setup Nagios Core server in AWS. 


[nagios_agent](nagios_agent)
Contains Ansible Playbook to install and configure NRPE is the hosts that needs to be monitored. 

## Installation Guide

[nagios_core](nagios_core) - Server Setup

[nagios_agent](nagios_agent) - NRPE Setup