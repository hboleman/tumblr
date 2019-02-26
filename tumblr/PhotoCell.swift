//
//  PhotoCell.swift
//  tumblr
//
//  Created by Hunter Boleman on 2/26/19.
//  Copyright © 2019 Hunter Boleman. All rights reserved.
//

import UIKit

class PhotoCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "YourCustomCell") as! YourCustomCell
        
        // Configure YourCustomCell using the outlets that you've defined.
        
        return cell
    }
    
}
