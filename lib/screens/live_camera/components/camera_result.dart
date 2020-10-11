import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_to_text/styles/spacers.dart';

class CameraResult extends StatelessWidget {
  const CameraResult({
    Key key,
    @required this.controller,
    @required this.resultText,
  }) : super(key: key);

  final CameraController controller;
  final String resultText;

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width / 1.2;

    return Center(
      child: Column(
        children: [
          SpaceH20(),
          Container(
            width: size,
            height: size,
            child: CameraPreview(
              controller,
            ),
          ),
          SpaceH30(),
          Text(
            'Prediction is \n',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            ),
          ),
          Text(
            resultText,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
