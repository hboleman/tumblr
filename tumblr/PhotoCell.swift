//
//  PhotoCell.swift
//  tumblr
//
//  Created by Hunter Boleman on 2/26/19.
//  Copyright © 2019 Hunter Boleman. All rights reserved.
//

import AlamofireImage
import UIKit

class PhotoCell: UITableViewCell {

    // Image View Outlet
    @IBOutlet weak var out_imageView: UIImageView!
    
    
    // Empty Array
    //var posts: [[String: Any]] = [];
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath as IndexPath) as! PhotoCell
        /*
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
        
        // Configure YourCustomCell using the outlets that you've defined.
        */
 
        return cell
    }
    
    
}
