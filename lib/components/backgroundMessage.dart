import 'package:flutter/material.dart';

class BackgroundMessage extends StatelessWidget {
  final String message;
  BackgroundMessage({required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: Center(
        child: Text(
          message,
          style: Theme.of(context).textTheme.headline6?.copyWith(
                color: Colors.grey,
                decoration: TextDecoration.underline,
              ),
        ),
      ),
    );
  }
}
