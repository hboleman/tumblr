//
//  PhotosViewControler.swift
//  tumblr
//
//  Created by Hunter Boleman on 2/24/19.
//  Copyright © 2019 Hunter Boleman. All rights reserved.
//

import AlamofireImage
import UIKit

class PhotosViewControler: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // Empty Array
    var posts: [[String: Any]] = [];
    
    // Table View Outlet
    @IBOutlet weak var out_table_view: UITableView!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        out_table_view.delegate = self
        out_table_view.dataSource = self
        
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
                self.out_table_view.reloadData()
            }
        }
        task.resume()
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell()
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        //cell.textLabel?.text = "This is row \(indexPath.row)"
        
        // Pull single post
        let post = posts[indexPath.row]
        
        // 1.            // 2.          // 3.
        if let photos = post["photos"] as? [[String: Any]] {
            // photos is NOT nil, we can use it!
            // TODO: Get the photo url
            // 1.
            let photo = photos[0]
            // 2.
            let originalSize = photo["original_size"] as! [String: Any]
            // 3.
            let urlString = originalSize["url"] as! String
            // 4.
            let url = URL(string: urlString)
            
            cell.out_imageView.af_setImage(withURL: url!)
        }
        return cell
    }
    
    private func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) -> Int {
        return indexPath.row;
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        //Get a reference to the PhotoDetailsViewController
        let vc = segue.destination as! PhotoDetailsViewController
        
        //Get the cell that triggered the segue
        let cell = sender as! UITableViewCell
        //Get the indexPath of the selected photo
        let indexPath = out_table_view.indexPath(for: cell)!
        
        // Transfer image to other class
        vc.imageView.image = self.imageView.image;
        
        out_table_view.deselectRow(at: indexPath, animated: true)
    }
    
 
}
