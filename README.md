<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

Flutter package for adding calculator to your app using Flutter Awesome Calculator Widget.

## Features
<img src="https://raw.githubusercontent.com/MuhammadMusa22/calculator_package/main/assets/calculator_ui.jpg" alt="Calculator UI" width="300" height="540">

## Getting started

To use this plugin, add flutter_awesome_calculator as a dependency in your pubspec.yaml file.

Import library in your file

```dart
  
  import 'package:calculator/flutter_awesome_calculator.dart';
  
```
## Usage

```
FlutterAwesomeCalculator(
          context: context,
          digitsButtonColor: Colors.white,
          backgroundColor: Colors.white,
          expressionAnswerColor: Colors.black,
          onChanged: (answer,expression){

          },
        );
```
You can show or hide answer field from calculator using bool value <b>showAnswerField</b>.

```
FlutterAwesomeCalculator(
          context: context,
          showAnswerField:true
        );
```

The callback method <b>onChanged</b> has two parameters, one is expression and other one is answer, which you can use and show in your screen.

```
FlutterAwesomeCalculator(
          context: context,
          onChanged: (answer,expression){
          
          },
        );
```        

## Additional information

Contributions to this repository are welcome.
