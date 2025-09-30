import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:convert';

import 'package:artifact/artifact.dart';
import 'package:flutter/material.dart' hide Image;
import 'package:thumbhash/thumbhash.dart' as th hide Image;
import 'package:http/http.dart' as http;
import 'package:kitchn/gen/artifacts.gen.dart';

@artifact
class Recipe {
  final String title;
  final String image;
  final String summary;

  const Recipe({
    required this.title,
    required this.image,
    required this.summary,
  });

  Future<ui.Image> resizeUiImage(ui.Image resizeImage, int targetWidth, int targetHeight) async {
    final byteData = await resizeImage.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List bytes = byteData!.buffer.asUint8List();

    final codec = await ui.instantiateImageCodec(
      bytes,
      targetWidth: targetWidth,
      targetHeight: targetHeight,
    );
    final frame = await codec.getNextFrame();
    return frame.image;
  }

  Future<String> getImageHash() async {
    final response = await http.get(Uri.parse(image));
    final Uint8List memoryImage = response.bodyBytes;
    final ui.Image decodedImage = await decodeImageFromList(memoryImage);
    final resizedImage = await resizeUiImage(decodedImage, 100, 100);

    final ByteData? byteData = await resizedImage.toByteData(
      format: ui.ImageByteFormat.rawRgba,
    );
    if (byteData == null) {
      throw Exception('Failed to get byte data from image.');
    }
    final Uint8List rgbaBytes = byteData.buffer.asUint8List();

    final Uint8List thumbHashBytes;
    try {
      thumbHashBytes = th.rgbaToThumbHash(
        resizedImage.width,
        resizedImage.height,
        rgbaBytes,
      );
    } catch (e) {
      throw Exception(e);
    }
    return base64Encode(thumbHashBytes);
  }

  @override
  String toString() => toMap().toString();
}