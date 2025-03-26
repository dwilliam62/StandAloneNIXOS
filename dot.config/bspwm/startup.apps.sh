#!/bin/bash

pkill variety 
sleep 0.5 
variety & 
pkill volumeicon 
sleep 0.3 
volumeicon & 
pkill flameshot 
sleep 0.5 
flameshot & 

