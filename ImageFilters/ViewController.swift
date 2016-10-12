//
//  ViewController.swift
//  ImageFilters
//
//  Created by Rickey Hrabowskie on 10/11/16.
//  Copyright © 2016 Rickey Hrabowskie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func filterAction(_ sender: Any) {
        
        guard let image = self.imageView.image?.cgImage else { return }
        
        let openGLContext = EAGLContext(api: .openGLES3) // Applied to the GPU
        let context = CIContext(eaglContext: openGLContext!)
        
        let ciImage = CIImage(cgImage: image)
        
        let filter = CIFilter(name: "CIFalseColor") // CISepiaTone
        filter?.setValue(ciImage, forKey: kCIInputImageKey)
        //filter?.setValue(1, forKey: kCIInputIntensityKey)
        
        if let output = filter?.value(forKey: kCIOutputImageKey) as? CIImage {
            self.imageView?.image = UIImage(cgImage: context.createCGImage(output, from: output.extent)!)
        }
    }

}

