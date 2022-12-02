# Technical Tests Truckrs

## Pre-requires

Following tools have to be installed in order to run the environment :

* Docker ( https://www.docker.com )
* A NodeJs environment with both node and npm (https://nodejs.org/en/download )
* A Flutter environment for App ( https://docs.flutter.dev/get-started/install )

Please use your favorite IDE, on my perspective I use IntelliJ IDEA which have a ton of great plugins to work with.

## Environment 

### Overview

This is a very simplistic environment of our Truckrs Platform composed by a Flutter app, a NodeJs back and a PostgreSQL Databse.


        +---------+                    +----------------+                 ____________ 
        |         |                    |                |                (            )
        |         |                    |                |                (            )
        | Flutter |                    |     Node Js    |                ( PostgreSQL )
        |   app   |   <------------>   |   back server  |   <-------->   (  Database  )
        |         |                    |                |                (            )
        |         |                    |                |                (            )
        +---------+                    +----------------+                 ____________ 

Each component source or deployment is located in a specific folder :

- ./app    -->  the Flutter App
- ./back   -->  the NodeJs back Server
- ./docker -->  a setup to run a local PostgresSQL image 

### Run the environment

1 ) Database

Open a terminal, go to the _docker_ folder and execute the following command :

`docker-compose up -d`

2 ) NodeJs Server

Configure your NodeJs IDE to execute Typescript project located in the _back_ folder
The entry point is _index.ts_ file

3 ) Flutter App

Configure your Flutter IDE to execute project located in the _app_ folder.
The entry point is _main.dart_

### Stop the environment

Open a terminal, go to the _docker_ folder and execute the following command :

`docker-compose down`

Close your IDEs 

## What is requested

Guys, I need your help !!!!! 

![](./help-emoji.png)

I broke everything regarding the App log-in to our Truckrs platform, could you please give me a hand ?

1) First of all, I would like to hide the password in the field app, I heard it is possible however I don't know how to do it.
2) I really don't know why I am not able anymore to log in to my account, request call from the app failed each time, could you please have a look and fix it ?
3) Password is stored in plain text in the Database, looks it is not very secure...any idea to change that ?
4) In the home page, I remember that I had to personalize the welcome message with the first name of the user. This data is stored in database but implementation looks so hard : could be great if you could make it.

Good luck !!!