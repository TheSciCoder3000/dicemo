import 'package:flutter/material.dart';

class Dice extends StatefulWidget {
  const Dice({
    super.key, 
    required this.turns, 
    required this.diceNum, 
    required this.getRandomDiceValues,
    required this.rotateDice
  });
  final double turns;
  final int diceNum;
  final VoidCallback getRandomDiceValues;
  final VoidCallback rotateDice;

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  static const int rotateDuration = 1200;

  @override
  Widget build(BuildContext context) {
    return AnimatedRotation(
      duration: const Duration(milliseconds: rotateDuration),
      turns: widget.turns,
      onEnd: widget.getRandomDiceValues,
      child: TextButton(
        onPressed: widget.rotateDice,
        child: Image.asset('images/dice${widget.diceNum}.png')
      ),
    );
  }
}