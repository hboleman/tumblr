//
//  PhotosViewControler.swift
//  tumblr
//
//  Created by Hunter Boleman on 2/24/19.
//  Copyright © 2019 Hunter Boleman. All rights reserved.
//

import UIKit

class PhotosViewControler: UIViewController {

    // Empty Array
    var posts: [[String: Any]] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Network request snippet
        let url = URL(string: "https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/posts/photo?api_key=Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV")!
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        session.configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data,
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                print(dataDictionary)
                
                // TODO: Get the posts and store in posts property
                // Get the dictionary from the response key
                let responseDictionary = dataDictionary["response"] as! [String: Any];
                // Store the returned array of dictionaries in our posts property
                self.posts = responseDictionary["posts"] as! [[String: Any]];
                
                // TODO: Reload the table view
            }
        }
        task.resume()
    }

}
