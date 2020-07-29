import 'package:flutter/material.dart';

extension ImageViewLoad on Image {
  static Image lcNetwork(String url) {
    return Image.network(url, fit: BoxFit.cover);
  }
}
