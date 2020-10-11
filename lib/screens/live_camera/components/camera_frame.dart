import 'package:flutter/material.dart';

class LiveCameraFrame extends StatelessWidget {
  const LiveCameraFrame({
    Key key,
    this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.004, 1],
            colors: [
              Color(0x11232526),
              Color(0xFF232526),
            ],
          ),
        ),
        child: child,
      ),
    );
  }
}
