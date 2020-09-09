import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerDemo extends StatefulWidget {
  @override
  _ImagePickerDemoState createState() => _ImagePickerDemoState();
}

/*
  image_picker: ^0.6.7+7
    */

class _ImagePickerDemoState extends State<ImagePickerDemo> {
  File _image;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("选择照片")),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              _image == null ? Text('No image selected.') : Image.file(_image),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  Future getImage() async {
    PickedFile pickedFile = await picker.getImage(source: ImageSource.gallery);
    print("get image : \n ${pickedFile.path}");
    setState(() {
      _image = File(pickedFile.path);
    });
  }
}
