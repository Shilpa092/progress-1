//
//  ViewpPogressUpdateViewController.swift
//  progress journal
//
//  Created by Admin on 03/05/22.
//

import UIKit

class ViewpPogressUpdateViewController: UIViewController {
    
    
    var progressUpdate : ProgressUpdate?

    @IBOutlet weak var photoImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = progressUpdate?.title
        if let imageData = progressUpdate?.image {
            photoImageView.image = UIImage(data: imageData)
            
        }

        // Do any additional setup after loading the view.
    }
    

    

}
