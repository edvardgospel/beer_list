import 'dart:io';
import 'package:flutter/material.dart';

class ImageView extends StatefulWidget {
  final String imageUrl;

  const ImageView(this.imageUrl, {Key? key}) : super(key: key);

  @override
  ImageViewState createState() => ImageViewState();
}

class ImageViewState extends State<ImageView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            widget.imageUrl,
            gaplessPlayback: true,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
