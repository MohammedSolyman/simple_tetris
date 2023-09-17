import 'package:flutter/material.dart';

class CellTemplate extends StatelessWidget {
  const CellTemplate(this.no, {required this.color, super.key});

  final int no;
  final MaterialColor color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: color.shade200,
      ),
      child: Container(
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: color.shade300,
        ),
        child: Container(
          margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: color.shade400,
          ),
          child: Container(
            margin: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: color.shade500,
            ),
            child: Container(
              margin: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: color.shade600,
              ),
              child: Text(no.toString()),
            ),
          ),
        ),
      ),
    );
  }
}
