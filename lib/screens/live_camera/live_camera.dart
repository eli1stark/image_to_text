import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_to_text/api/api.dart';
import 'package:path_provider/path_provider.dart';
import '../home.dart';
import 'components/back_button.dart';
import 'components/camera_frame.dart';
import 'components/camera_result.dart';

class LiveCamera extends StatefulWidget {
  @override
  _LiveCameraState createState() => _LiveCameraState();
}

class _LiveCameraState extends State<LiveCamera> {
  String resultText = 'Fetching Response...';
  List<CameraDescription> cameras;
  CameraController controller;
  bool takePhoto = false;

  @override
  void initState() {
    super.initState();
    takePhoto = true;
    detectCameras().then((_) {
      initializeController();
    });
  }

  Future<void> detectCameras() async {
    cameras = await availableCameras();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void initializeController() {
    controller = CameraController(cameras[0], ResolutionPreset.medium);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
      if (takePhoto) {
        const interval = const Duration(seconds: 3);
        Timer.periodic(
          interval,
          (Timer t) => capturePictures(),
        );
      }
    });
  }

  capturePictures() async {
    String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final Directory extDir = await getApplicationDocumentsDirectory();
    final String dirPath = '${extDir.path}/Pictures/flutter_test';
    await Directory(dirPath).create(recursive: true);
    final String filePath = '$dirPath/$timestamp.png';

    if (takePhoto) {
      controller.takePicture(filePath).then((_) async {
        if (takePhoto) {
          File imageFile = File(filePath);
          resultText = await fetchResponse(imageFile);
          setState(() {});
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LiveCameraFrame(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LiveBackButton(
            onPressed: () {
              setState(() => takePhoto = false);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Home(),
                ),
              );
            },
          ),
          if (controller != null)
            CameraResult(
              controller: controller,
              resultText: resultText ?? 'Not Found!',
            )
        ],
      ),
    );
  }
}
