#!/bin/bash


#create a shortcut for running sql queries

alias sqlq='sqlcmd -S localhost -U sa -P P@ssw0rd -d Northwind -Q'

#save the alias permanently in my enviroment
echo "alias sqlq='sqlcmd -S localhost -U sa -P P@ssw0rd -d Northwind -Q'" >> ~/.bashrc