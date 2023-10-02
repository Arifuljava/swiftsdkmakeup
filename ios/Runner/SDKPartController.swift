//
//  SDKPartController.swift
//  Runner
//
//  Created by sang on 2/10/23.
//

import UIKit

class SDKPartController: UIViewController {
    var imageData: Data?
    @IBOutlet weak var bitmapimageshow: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let imageData = imageData {
                   // Process or display the image data here
                   print("Received image data: \(imageData)")
            
            if let image = UIImage(data: imageData) {
                bitmapimageshow.image = image
                } else {
                    // Handle the case where imageData is not a valid image data
                }
            
            
               }
        // Do any additional setup after loading the view.
    }
    

    @IBAction func go_to_print(_ sender: Any) {
        print("Go To");
        let storyboard = UIStoryboard(name: "MainSecond", bundle: nil)
        let secondController3 = storyboard.instantiateViewController(withIdentifier: "sdkmaincontroller") as! SDKMainScreenController
        //secondController3.imageData2222 = imageData
       

        present(secondController3, animated: true, completion: nil)
    }
    

}
