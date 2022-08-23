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
