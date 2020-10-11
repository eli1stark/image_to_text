import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    Key key,
    @required this.text,
    this.onTap,
    this.source,
    this.onPressed,
  }) : super(key: key);

  final String text;
  final Function(ImageSource source) onTap;
  final ImageSource source;
  /// Live camera
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              if (source != null) {
                onTap(source);
              } else {
                // Live Camera
                onPressed();
              }
            },
            child: Container(
              width: size.width - 180.0,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 17.0,
              ),
              decoration: BoxDecoration(
                color: Color(0xFF56AB2F),
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
