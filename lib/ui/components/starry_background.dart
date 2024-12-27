import 'dart:math';
import 'package:clario_test_project/UI/theme/app_colors.dart';
import 'package:flutter/material.dart';

class StarryBackground extends StatelessWidget {
  const StarryBackground({
    super.key,
    required this.child,
    required this.backgroundGradient,
    this.starColor = AppColors.lightBlue,
  });

  final Widget child;
  final Color starColor;
  final Gradient backgroundGradient;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final positions = _generateRandomPosition(context);
    return Container(
      width: screenWidth,
      height: screenHeight,
      decoration: BoxDecoration(
        gradient: backgroundGradient,
      ),
      child: Stack(
        children: [
          ...positions.map(
            (position) {
              return PositionedStar(
                starColor: starColor,
                xPosition: position.xPos.toDouble(),
                yPosition: position.yPos.toDouble(),
              );
            },
          ).toList(),
          child
        ],
      ),
    );
  }

  List<({int xPos, int yPos})> _generateRandomPosition(final BuildContext context) {
    final Random random = Random();

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    int level = 50;
    const delimeter = 100;

    final ({int end, int start}) leftOxInterval = (start: 30, end: (width ~/ 2) - 30);
    final ({int end, int start}) rightOxInterval = (start: width ~/ 2, end: (width - 50).toInt());

    final numberOfStars = height ~/ delimeter;

    final List<({int xPos, int yPos})> positions = [];

    for (int i = 0; i < numberOfStars; i++) {
      final selectInterval = i % 2 == 0 ? leftOxInterval : rightOxInterval;

      final x = random.nextInt(selectInterval.end - selectInterval.start) + selectInterval.start;

      final y = level;

      level += delimeter;

      positions.add((xPos: x, yPos: y));
    }

    return positions;
  }
}

class PositionedStar extends StatelessWidget {
  const PositionedStar({
    super.key,
    required this.xPosition,
    required this.yPosition,
    required this.starColor,
  });

  final Color starColor;
  final double xPosition;
  final double yPosition;

  @override
  Widget build(BuildContext context) {
    final size = calculateSize();
    return Positioned(
      top: yPosition,
      left: xPosition,
      child: Image.asset(
        'assets/icons/star.png',
        width: size,
        height: size,
        fit: BoxFit.cover,
      ),
    );
  }

  double calculateSize() {
    final Random random = Random();
    return (random.nextDouble() * 20) + 15;
  }
}
