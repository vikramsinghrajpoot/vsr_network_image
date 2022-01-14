import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:vsr_network_image/extension.dart';
import 'cache_manager.dart';
import 'package:http/http.dart' as http;
import 'image_response.dart';

class VSRImageProvider {
  static Future<Response> getImage(String url) async {
    final Uint8List image = await CacheManager.getImage(url);
    if (image.isNotEmpty) {
      final AppResponse response = AppResponse(image: image);
      return response;
    } else {
      final http.Response response = await http.get(url.getUri());
      return response;
    }
  }
}
