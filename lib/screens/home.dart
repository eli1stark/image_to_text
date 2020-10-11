import 'dart:io';
import 'package:image_to_text/components/options.dart';
import 'package:flutter/material.dart';
import 'package:image_to_text/api/api.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_to_text/components/content_frame.dart';
import 'package:image_to_text/components/header_text.dart';
import 'package:image_to_text/components/home_frame.dart';
import 'package:image_to_text/components/result.dart';
import 'package:image_to_text/styles/spacers.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool loading = false;
  File image;
  String resultText = 'Fetching Response...';

  pickImage(ImageSource source) async {
    var newImage = await ImagePicker().getImage(
      source: source,
    );

    if (newImage == null) return null;

    setState(() {
      image = File(newImage.path);
      loading = true;
    });

    resultText = await fetchResponse(image);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return HomeFrame(
      child: Column(
        children: [
          SpaceH40(),
          HeaderText(
            text: 'Text Generator',
            fontSize: 35.0,
          ),
          HeaderText(
            text: 'Image to Text Generator',
            fontSize: 18.0,
          ),
          SpaceH30(),
          ContentFrame(
            child: Column(
              children: [
                if (loading)
                  Result(
                    image: image,
                    resultText: resultText,
                    onBackButton: () {
                      setState(() {
                        loading = false;
                        resultText = 'Fetching Response...';
                      });
                    },
                  )
                else
                  Options(pickImage)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
