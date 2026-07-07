import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const NextButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}