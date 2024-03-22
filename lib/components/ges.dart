import 'package:flutter/material.dart';

class SuperButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final VoidCallback onDoubleTap;
  const SuperButton({
    super.key,
    required this.onDoubleTap,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          padding: const EdgeInsets.only(
            top: 20,
            bottom: 20,
            left: 30,
            right: 30,
          ),
          color: Colors.deepPurple,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
