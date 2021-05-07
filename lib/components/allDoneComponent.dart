import 'package:flutter/material.dart';

class AllDone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Center(
        child: Text(
          'All done!',
          style: Theme.of(context).textTheme.headline6.copyWith(
                color: Colors.grey,
                decoration: TextDecoration.underline,
              ),
        ),
      ),
    );
  }
}
