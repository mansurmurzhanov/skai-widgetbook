import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppLoading extends StatelessWidget {
  final Color? color;

  const AppLoading({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoActivityIndicator(
        color: color ?? Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
