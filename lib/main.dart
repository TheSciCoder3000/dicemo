import 'package:dicemo/video_background.dart';
import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'package:vibration/vibration.dart';
import 'dart:math';
import 'dice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: DicePage(),
    );
  }
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int rightDice = Random().nextInt(6) + 1;
  int leftDice = Random().nextInt(6) + 1;
  double turns = 0.0;
  late ShakeDetector detector;
  bool rotating = false;
  bool lucky = false;

  static const double dicePadding = 15.0;
  static const int turningSpeed = 8;

  @override
  void initState() {
    super.initState();
    detector = ShakeDetector.autoStart(
      onPhoneShake: rotateDice,
      minimumShakeCount: 2,
      shakeSlopTimeMS: 500,          // minimum delay between shakes
      shakeCountResetTime: 3000,
      shakeThresholdGravity: 3.2,
    );
    print('running init state');
  }

  @override
  void dispose() {
    detector.stopListening();
    super.dispose();
  }
  
  
  void getRandomDiceValues() {
    setState(() {
      rotating = false;
      rightDice = Random().nextInt(6) + 1;
      leftDice = Random().nextInt(6) + 1;
      lucky = leftDice == rightDice;
    });
  }

  void rotateDice() async {
    if (rotating) return;
    bool hasVibrator = await Vibration.hasVibrator() as bool;
    setState(() {
      rotating = true;
      turns += turningSpeed;
    });
    if (hasVibrator) {
      Vibration.vibrate();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Stack(
        children: [
          VideoBackground(lucky: lucky),
          SafeArea(
            child: Center(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(dicePadding),
                      child: Dice(
                        turns: turns,
                        getRandomDiceValues: getRandomDiceValues,
                        rotateDice: rotateDice, 
                        diceNum: leftDice,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(dicePadding),
                      child: Dice(
                        turns: turns,
                        getRandomDiceValues: getRandomDiceValues,
                        rotateDice: rotateDice, 
                        diceNum: rightDice,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}