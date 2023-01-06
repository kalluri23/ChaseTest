# ChaseTest
JP Morgan Chase Assignment

## Xcode Requirements

Xcode 11.3 & Above

## iOS Requirements

iOS 13.2 & Above

## Device Support

iPhone ONLY

## Screen Orientations Supported

Portrait ONLY

## Technologies used

* SwiftUI
* Combile

## Design pattern used

MVVM

## Overview of code

### NetworkLayer

* All the files in NetworkLayer folder will contribute to making https REST API calls using URLSession publisher
* Timeout for each request is 60s

### Services

* All the files in Services folder will make all relevant calls to fetch school releated info
* This service layer will be utilized by viewmodel to make API calls

### Model

This folder has three models

* School (Model to store School meta data of a school)
* SchoolSATScore (Model to store SAT related data of a school)
* SchoolObject (This object contains combined data from above 2 objects)

### ViewModel

* Used to persist state of UI
* used to make API calls
* Used to update UI

### View

* This folder contains all UI related code to render screens on the mobile app

### UIKItViewBridges

* This folder contains code that bridges code from UIKit so as to reuse UIViews from UIKit

### Helpers

* This folder contains all helper code to execute business logic

## Known Issues

* Since this scode is developed on xcode 11.3 (due to lack of a new mac) there is a known issue on iOS simulators whwre the navigation link will work only once. As per apple documentation this issue is fixed on Xcode 11.4, so I recommend running this code on a latest xcode


## Unit Tests Covered

Test Scools List API using https://data.cityofnewyork.us/resource/7crd-d9xh.json

Test School SAT Score API using https://data.cityofnewyork.us/resource/f9bf-2cp4.json

Test Integrated data from Above API


