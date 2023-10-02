
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class DataSendFlutter extends StatefulWidget {
  const DataSendFlutter({super.key});

  @override
  State<DataSendFlutter> createState() => _DataSendFlutterState();
}

class _DataSendFlutterState extends State<DataSendFlutter> {
  static const platformChannel =
  MethodChannel('com.example.flutter_method_channnnnnel/cameraButton');


  static const navigateToCameraSDK = const MethodChannel('com.fluttertonative/navigateToCameraSDK');

  String _greeting = 'awaiting swift call..';


  Future _getnavigator() async{
    try {
      print("First");
      final result = navigateToCameraSDK.invokeMapMethod('getSwiftNavigator');
      print("instance");
      print(result);
    } on PlatformException catch (e){
      print('error:$e');
      _greeting = 'error occured:$e';
    }
    setState(() {
      _greeting ='call successful you have got the swift Navigator';
    });
  }
  Future _getnavigator22(Uint8List? bitmap) async{
    try {
      print("First");
      final result = navigateToCameraSDK.invokeMethod('getSwiftNavigator',{
        "bitmap",bitmap
      });
      print("instance");
      print(result);
    } on PlatformException catch (e){
      print('error:$e');
      _greeting = 'error occured:$e';
    }
    setState(() {
      _greeting ='call successful you have got the swift Navigator';
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Send Data"),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () async{
              try {
                await _getnavigator();
              } catch (e) {
                print('Error invoking method: $e');
              }
              print("get Add Data");
            },
            child: Text("Send Data and then show data(Swift)"),
          )
        ),
      ),
    );
  }

  Future<void> sendTextToSwift(String text) async {
    const platform = MethodChannel('your_channel_name'); // Replace with your channel name
    try {
      await platform.invokeMethod('sendTextToSwift', {'text': text});
    } catch (e) {
      print('Error sending text to Swift: $e');
    }
  }
}
