import 'package:flutter/material.dart';
import 'package:image_to_text/styles/styles.dart';

class HomeFrame extends StatelessWidget {
  const HomeFrame({
    Key key,
    @required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: customGradient,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 24.0,
          ),
          child: child,
        ),
      ),
    );
  }
}
