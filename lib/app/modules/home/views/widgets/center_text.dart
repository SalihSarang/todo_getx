import 'package:flutter/material.dart';

class CenterText extends StatelessWidget {
  final String message;
  const CenterText({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Todo added yet"),
    );
  }
}
