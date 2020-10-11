import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_to_text/screens/live_camera/live_camera.dart';
import 'package:image_to_text/styles/spacers.dart';
import 'action_button.dart';
import 'custom_image.dart';

class Options extends StatelessWidget {
  const Options(this.onTap);

  final Function(ImageSource source) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500.0,
      child: Column(
        children: [
          SpaceH50(),
          CustomImage(),
          SpaceH30(),
          ActionButton(
            text: 'Live Camera',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LiveCamera(),
                ),
              );
            },
          ),
          SpaceH10(),
          ActionButton(
            text: 'Take Photo',
            onTap: onTap,
            source: ImageSource.camera,
          ),
          SpaceH10(),
          ActionButton(
            text: 'Camera Roll',
            onTap: onTap,
            source: ImageSource.gallery,
          ),
        ],
      ),
    );
  }
}
