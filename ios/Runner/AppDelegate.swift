/*
  import UIKit
  import Flutter

  @UIApplicationMain
  @objc class AppDelegate: FlutterAppDelegate {
    override func application(
      _ application: UIApplication,
      didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
      GeneratedPluginRegistrant.register(with: self)
      return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
  }*/


  import UIKit
  import Flutter

  /*
  @UIApplicationMain
  @objc class AppDelegate: FlutterAppDelegate {
    override func application(
      _ application: UIApplication,
      didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
      GeneratedPluginRegistrant.register(with: self)
      return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    // Function to open MyViewController as a modal view controller
    func openMyViewController() {
      let flutterViewController = window?.rootViewController as! FlutterViewController
      let myViewController = MyViewController() // Initialize MyViewController
      flutterViewController.present(myViewController, animated: true, completion: nil)
    }
  }
  */

   @UIApplicationMain

   @objc class AppDelegate: FlutterAppDelegate {
         override func application(
           _ application: UIApplication,
           didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?

         ) -> Bool {
           let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
          // GeneratedPluginRegistrant.register(with: self)

           let navigatorChannel = FlutterMethodChannel(name: "com.fluttertonative/navigateToCameraSDK", binaryMessenger:  controller.binaryMessenger)
          navigatorChannel.setMethodCallHandler ({
             [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
             // Note: this method is invoked on the UI thread.

              /*
               guard call.method == "getSwiftNavigator" else {
                 result(FlutterMethodNotImplemented)
                 return
               }
               */
              if call.method == "getSwiftNavigator" {
                             if let arguments = call.arguments as? Dictionary<String, Any>,
                                let imageBytes = arguments["imageBytes"] as? FlutterStandardTypedData,
                                let imageWidth = arguments["imageWidth"] as? Int,
                                let imageHeight = arguments["imageHeight"] as? Int,
                                let imageType = arguments["imageType"] as? String {
                                 let imageData = imageBytes.data
                                 self?.callNavigator(imagedata: imageData)
                                 // Use imageBytes, imageWidth, imageHeight, and imageType as needed
                             }
                  
                 
                  
              }
              else{
                  print("MYYY")
                  print(call.method)
              }
             /*
              if call.method == "getSwiftNavigator" {
                              let  textToSend = "Hello from Swift!"
                              result(textToSend)
                          } else {
                              result(FlutterMethodNotImplemented)
                          }
              */
              
           //self?.openSecondScreen("hello")

          })
          // GeneratedPluginRegistrant.register(with: self)
           return super.application(application, didFinishLaunchingWithOptions: launchOptions)
         }
           private func receiveGreeting(result: FlutterResult){
               result("Hello from Swift Code...")
           }
       private func callNavigator(imagedata: Data){
               /*
                let storyboard = UIStoryboard(name: "MainSecond", bundle: nil)
                let secondController = storyboard.instantiateViewController(withIdentifier: "cellgres") as! SecondCntroller
                window?.rootViewController?.present(secondController, animated: true, completion: nil)
                */
           let storyboard = UIStoryboard(name: "MainSecond", bundle: nil)
           let secondController = storyboard.instantiateViewController(withIdentifier: "cellll") as! SDKPartController
           secondController.imageData = imagedata
           window?.rootViewController?.present(secondController, animated: true, completion: nil)
               print("Hello\n")
           print(imagedata)
             /*
              window = UIWindow(frame: UIScreen.main.bounds)
              window?.rootViewController = SecondCntroller() // Set ViewControllerA as the root view controller
              window?.makeKeyAndVisible()
              */
               

           }
         
         
            func openSecondScreen(_ text: String?) {
                   let storyboard = UIStoryboard(name: "Main", bundle: nil)
                   let secondController = storyboard.instantiateViewController(withIdentifier: "cellgres") as! SecondCntroller

                  

                   window?.rootViewController?.present(secondController, animated: true, completion: nil)
               }
      
            
       }



  //testing
  /*
   import Flutter

   @objc
   class MySwiftPlugin: NSObject, FlutterPlugin {
     static func register(with registrar: FlutterPluginRegistrar) {
       let channel = FlutterMethodChannel(name: "my_plugin_channel", binaryMessenger: registrar.messenger())
       let instance = MySwiftPlugin()
       registrar.addMethodCallDelegate(instance, channel: channel)
     }

     func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
       if call.method == "sendBitmapToSwift" {
         if let arguments = call.arguments as? [String: Any],
            let byteList = arguments["bitmapData"] as? FlutterStandardTypedData {
           // Process the received data
           // Perform Swift-specific tasks here
           // You can access 'byteList.data' to get the bytes of your bitmapData
           result("Data received by Swift")
         } else {
           result(FlutterError(code: "INVALID_ARGUMENTS", message: "Invalid arguments", details: nil))
         }
       } else {
         result(FlutterMethodNotImplemented)
       }
     }
   }

   */
