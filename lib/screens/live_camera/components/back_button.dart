import 'package:flutter/material.dart';

class LiveBackButton extends StatelessWidget {
  const LiveBackButton({
    Key key,
    this.onPressed,
  }) : super(key: key);

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 35.0,
      ),
      child: IconButton(
        color: Colors.white,
        icon: Icon(
          Icons.arrow_back_ios,
          size: 35.0,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
