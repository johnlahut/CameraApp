//
//  ViewController.swift
//  CameraApp
//
//  Created by John Lahut on 7/20/16.
//  Copyright © 2016 John Lahut. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var TakePhoto: UIButton!
    @IBOutlet weak var PhotoLibrary: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func TakePhotoAction(sender: UIButton) {
        
        let imgPicker = UIImagePickerController()
        
        imgPicker.delegate = self;
        imgPicker.sourceType = .Camera
        imgPicker.showsCameraControls = true
        imgPicker.editing = true
        
        let graphRect:CGRect = CGRectMake(0, 0, 300, 300)
        let overlayView:UIView = UIView(frame: graphRect)
        
        overlayView.backgroundColor = UIColor(colorLiteralRed: 50.0/255.0, green: 50.0/255.0, blue: 50.0/225.0, alpha: 1.0)
        
        overlayView.layer.opaque = true
        overlayView.opaque  = true
        
        let maskLayer : CAShapeLayer = CAShapeLayer()
        overlayView.layer.mask = maskLayer
        
        
        presentViewController(imgPicker, animated: true, completion: nil)
    }

    @IBAction func PhotoLibraryAction(sender: UIButton) {
        
        let imgPicker = UIImagePickerController()
        
        imgPicker.delegate = self
        imgPicker.sourceType = .PhotoLibrary
        
        presentViewController(imgPicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        ImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        
        dismissViewControllerAnimated(true, completion: nil)
    }
}

