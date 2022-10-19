import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CircularFAB extends StatefulWidget {
  const CircularFAB({super.key});

  @override
  State<CircularFAB> createState() => _CircularFABState();
}

class _CircularFABState extends State<CircularFAB>
    with SingleTickerProviderStateMixin {
  final double buttonSize = 56;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flow(
      delegate: FlowMenuDelegate(controller: controller),
      children: const <IconData>[
        FontAwesomeIcons.cartShopping,
        FontAwesomeIcons.utensils,
        FontAwesomeIcons.book,
        FontAwesomeIcons.book,
        FontAwesomeIcons.plus,
      ].map(buildFAB).toList(),
    );
  }

  Widget buildFAB(IconData icon) {
    return FloatingActionButton(
      onPressed: () {
        if (controller.status == AnimationStatus.completed) {
          controller.reverse();
        } else {
          controller.forward();
        }
      },
      elevation: 0,
      child: Icon(
        icon,
        color: Theme.of(context).colorScheme.onPrimary,
        size: 32,
      ),
    );
  }
}

class FlowMenuDelegate extends FlowDelegate {
  FlowMenuDelegate({required this.controller}) : super(repaint: controller);
  final Animation<double> controller;

  @override
  void paintChildren(FlowPaintingContext context) {
    final size = context.size;
    final xStart = (size.width / 2) - 56;
    final yStart = size.height - 56;

    final n = context.childCount;

    for (var i = 0; i < n; i++) {
      final isLastItem = i == context.childCount - 1;
      double setValue(double value) => isLastItem ? 0.0 : value;

      final radius = 180 * controller.value;
      final theta = i * pi * 0.5 / (n - 2);

      final x = xStart - setValue(radius * cos(theta));
      final y = yStart - setValue(radius * sin(theta));

      context.paintChild(
        i,
        transform: Matrix4.identity()
          ..translate(
            x,
            y,
          ),
      );
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) => false;
}
