
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'dart:typed_data';
import 'package:flutter/material.dart';


import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;

const platform = MethodChannel('com.example.image_channel');
class PickImageAndSend extends StatefulWidget {
  const PickImageAndSend({super.key});

  @override
  State<PickImageAndSend> createState() => _PickImageAndSendState();
}

class _PickImageAndSendState extends State<PickImageAndSend> {
  final GlobalKey containerKey = GlobalKey();
  static const navigateToCameraSDK = const MethodChannel('com.fluttertonative/navigateToCameraSDK');
  Future<void> sendImageToSwift(
      Uint8List imageBytes, int imageWidth, int imageHeight, String imageType) async {
    try {
      await navigateToCameraSDK.invokeMethod('getSwiftNavigator', {
        'imageBytes': imageBytes,
        'imageWidth': imageWidth,
        'imageHeight': imageHeight,
        'imageType': imageType,
      });
    } on PlatformException catch (e) {
      print('Error sending image data to Swift: $e');
    }
  }
  Uint8List? imageBytes;

  Future<Uint8List?> captureContainerToUint8List(GlobalKey containerKey) async {
    try {
      final boundary = containerKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      final image = await boundary.toImage(pixelRatio: 3.0); // Adjust pixelRatio as needed

      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData != null) {
        final buffer = byteData.buffer.asUint8List();
        return buffer;
      }
    } catch (e) {
      print('Error capturing container: $e');
    }
    return null;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Container Capture Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RepaintBoundary(
              key: containerKey,
              child: Container(
                width: 200,
                height: 200,
                color: Colors.blue,
                child: Center(
                  child: Text(
                    'Hello, Flutter!',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                Uint8List? capturedBytes = await captureContainerToUint8List(containerKey);
                setState(() {
                  imageBytes = capturedBytes;
                  print(imageBytes);
                });
              },
              child: Text('Capture Container'),
            ),
            SizedBox(height: 20),
            if (imageBytes != null)
              Image.memory(
                imageBytes!,
                width: 200,
                height: 200,
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                //imageBytes = capturedBytes;
                sendImageToSwift(imageBytes!,10,10,"esc");
print("object$imageBytes");
              },
              child: Text('Send data to swift'),
            )
          ],
        ),
      ),
    );
  }
}