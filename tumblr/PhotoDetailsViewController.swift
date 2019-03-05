//
//  PhotoDetailsViewController.swift
//  tumblr
//
//  Created by Hunter Boleman on 3/5/19.
//  Copyright © 2019 Hunter Boleman. All rights reserved.
//

import UIKit

class PhotoDetailsViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var imageView: UIImageView!
    
    public var url: URL?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.af_setImage(withURL: url!);
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
