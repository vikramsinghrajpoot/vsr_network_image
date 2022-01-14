import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';

class CacheManager {
  static saveImage(String fileName, Uint8List image) async {
    File file = File(await _getFilePath(fileName));
    final String string = _base64String(image);
    await file.writeAsString(string);
  }

  static Future<Uint8List> getImage(
    String fileName,
  ) async {
    File file = File(await _getFilePath(fileName));
    String fileContent = await file.readAsString();
    final data = _dataFromBase64String(fileContent);
    return data;
  }

  static String _base64String(Uint8List data) {
    return base64Encode(data);
  }

  static Uint8List _dataFromBase64String(String base64String) {
    return base64Decode(base64String);
  }

  static Future<String> _getFilePath(String fileName) async {
    Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
    String appDocumentsPath = appDocumentsDirectory.path;
    String filePath = '$appDocumentsPath/$fileName';
    return filePath;
  }
}
