# Dicemo

Roll your dice and win a prize.


## About the Application

A flutter program to be submitted to `Sir Jopak Isaguirre` for Enabling Assessment 4. It has the following features:
1. Shake Detector
2. Vibration Controls
3. Background Video player
3. Dice states and touch events

## Widget Tree

The flutter progrom is created based on the widget tree below. The widget tree is separated into three parts: 
- Main
- Video Background
- Dice

### Main Widget Tree

The main widget tree is the main widget that gets loaded when the flutter app first starts. It starts with the MaterialApp widget. It is responsible for rendering the Video background and Dice widget.
![main widget tree](https://github.com/TheSciCoder3000/dicemo/blob/main/widget_tree/main.jpg?raw=true)

### Video Background Widget Tree

The Video Background widget tree is separated from the main widget tree to improve readability. This is responsible for playing the video when the user rolls equal dice.
![Video background widget tree](https://github.com/TheSciCoder3000/dicemo/blob/main/widget_tree/video_background.jpg?raw=true)

### Dice Widget Tree

The Dice widget tree is separated from the main widget tree to improve readability. This is responsible for rendering the dice which the user interacts with.
![Dice widget tree](https://github.com/TheSciCoder3000/dicemo/blob/main/widget_tree/dice.jpg?raw=true)
