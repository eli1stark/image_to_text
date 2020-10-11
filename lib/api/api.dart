import 'dart:io';
import 'dart:convert';
import 'package:mime/mime.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

// already expired
const String apiLink =
    'http://max-image-caption-generator-test.2886795274-80-host18nc.environments.katacoda.com';

Future<String> fetchResponse(File image) async {
  final mimeTypeData =
      lookupMimeType(image.path, headerBytes: [0xFF, 0xD8]).split('/');

  final imageUploadRequest = http.MultipartRequest(
    'POST',
    Uri.parse('$apiLink/model/predict'),
  );

  final file = await http.MultipartFile.fromPath(
    'image',
    image.path,
    contentType: MediaType(
      mimeTypeData[0],
      mimeTypeData[1],
    ),
  );

  imageUploadRequest.fields['ext'] = mimeTypeData[1];
  imageUploadRequest.files.add(file);

  try {
    final streamResponse = await imageUploadRequest.send();

    final response = await http.Response.fromStream(streamResponse);

    final Map<String, dynamic> responseData = json.decode(response.body);

    return parseResponse(responseData);
  } catch (e) {
    return null;
  }
}

String parseResponse(var response) {
  String string = '';

  List predictions = response['predictions'];

  for (var prediction in predictions) {
    if (prediction != predictions.last) {
      string = string + prediction['caption'] + '\n' + '\n';
    } else {
      string = string + prediction['caption'];
    }
  }

  return string;
}
