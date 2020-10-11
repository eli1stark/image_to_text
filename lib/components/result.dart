import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_to_text/styles/spacers.dart';

class Result extends StatelessWidget {
  const Result({
    Key key,
    @required this.image,
    @required this.resultText,
    @required this.onBackButton,
  }) : super(key: key);

  final File image;
  final String resultText;
  final Function onBackButton;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(
        top: 10.0,
      ),
      child: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  color: Colors.black,
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 35.0,
                  ),
                  onPressed: onBackButton,
                ),
                SizedBox(
                  width: size.width - 205,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.file(
                      image,
                      fit: BoxFit.fill,
                    ),
                  ),
                )
              ],
            ),
          ),
          SpaceH20(),
          Container(
            child: Text(
              '$resultText',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
