import 'dart:typed_data';
import 'package:http/http.dart' as http;

class AppResponse extends http.Response {
  final Uint8List? image;
  AppResponse({String? body, int? statusCode, this.image})
      : super(body!, statusCode!);
}
