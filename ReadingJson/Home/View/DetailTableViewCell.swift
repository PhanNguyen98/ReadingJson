//
//  DetailTableViewCell.swift
//  ReadingJson
//
//  Created by Phan Nguyen on 28/12/2020.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var studentIDLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadAvataImage(url: String, index: Int) {
        let url = URL(string: url)
        do {
            if let urlData = url {
                let data = try Data(contentsOf: urlData)
                DispatchQueue.main.async {
                    if self.tag == index {
                        self.avatarImageView.image = UIImage(data: data)
                    }
                }
            }
        } catch {
            print(error)
        }
    }
    
    func setContent(item: Student) {
        nameLabel.text = item.info.name
        birthdayLabel.text = item.info.birthday
        studentIDLabel.text = item.studentID
    }
    
}
