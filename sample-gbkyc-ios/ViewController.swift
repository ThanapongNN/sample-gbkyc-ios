//
//  ViewController.swift
//  sample-gbkyc-ios
//
//  Created by Thanapong Nongnuch on 25/6/2565 BE.
//

import UIKit
import Flutter

class ViewController: UIViewController {
    var methodChannel : FlutterMethodChannel?
    var flutterEngine: FlutterEngine!
    var flutterViewController: FlutterViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let button = UIButton(type:UIButton.ButtonType.custom)

        button.addTarget(self, action: #selector(showFlutter), for: .touchUpInside)
        button.setTitle("Show Flutter!", for: UIControl.State.normal)
        button.frame = CGRect(x: 80.0, y: 210.0, width: 160.0, height: 40.0)
        button.backgroundColor = UIColor.blue
        self.view.addSubview(button)

        flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
        flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
                
        methodChannel = FlutterMethodChannel(name: "GBWSDK", binaryMessenger: flutterViewController.binaryMessenger)
        methodChannel!.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) in
          if call.method == "CloseFlutterViewController" {
              self.closeFlutter()

              print(call.arguments!)

              result("CloseFlutterViewController")
          } else {
            result(FlutterMethodNotImplemented)
          }
        }
    }

    @objc func showFlutter() {
        flutterViewController.modalPresentationStyle = .fullScreen
        present(flutterViewController, animated: true, completion: nil)
    }

    @objc func closeFlutter() {
        dismiss(animated: true, completion: nil)
    }

}

