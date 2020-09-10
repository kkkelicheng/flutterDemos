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

/*
上传图片的组织formData的三种方式 dio.demo

response = await dio.post(
    //"/upload",
    "http://localhost:3000/upload",
    data: await FormData3(),
    onSendProgress: (received, total) {
      if (total != -1) {
        print((received / total * 100).toStringAsFixed(0) + "%");
      }
    },
  );
  print(response);


Future<FormData> FormData1() async {
  return FormData.fromMap({
    "name": "wendux",
    "age": 25,
    "file":
        await MultipartFile.fromFile("./example/xx.png", filename: "xx.png"),
    "files": [
      await MultipartFile.fromFile("./example/upload.txt",
          filename: "upload.txt"),
      MultipartFile.fromFileSync("./example/upload.txt",
          filename: "upload.txt"),
    ]
  });
}

Future<FormData> FormData2() async {
  var formData = FormData();
  formData.fields..add(MapEntry("name", "wendux"))..add(MapEntry("age", "25"));

  formData.files.add(MapEntry(
    "file",
    await MultipartFile.fromFile("./example/xx.png", filename: "xx.png"),
  ));

  formData.files.addAll([
    MapEntry(
      "files[]",
      await MultipartFile.fromFile("./example/upload.txt",
          filename: "upload.txt"),
    ),
    MapEntry(
      "files[]",
      MultipartFile.fromFileSync("./example/upload.txt",
          filename: "upload.txt"),
    ),
  ]);
  return formData;
}

Future<FormData> FormData3() async {
  return FormData.fromMap({
    "file": await MultipartFile.fromFile("./example/upload.txt",
        filename: "uploadfile"),
  });
}


*/
