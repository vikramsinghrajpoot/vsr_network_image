library vsr_network_image;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vsr_network_image/extension.dart';

class AppNetworkImage extends StatelessWidget {
  final String url;
  final Widget? progressIndicator;
  final Widget? errorWidget;
  const AppNetworkImage(
      {Key? key, required this.url, this.progressIndicator, this.errorWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: http.get(url.getUri()),
      builder: (BuildContext context, AsyncSnapshot<http.Response> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return errorWidget ?? const Text('');
          case ConnectionState.active:
          case ConnectionState.waiting:
            return progressIndicator ?? const CircularProgressIndicator();
          case ConnectionState.done:
            if (snapshot.hasError) return Text('Error: ${snapshot.error}');
            return Image.memory(snapshot.data!.bodyBytes);
        }
      },
    );
  }
}
