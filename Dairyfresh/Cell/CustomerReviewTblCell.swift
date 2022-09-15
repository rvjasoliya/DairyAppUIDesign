 

import UIKit
 

class CustomerReviewTblCell: UITableViewCell {

    @IBOutlet weak var mainBackV: UIView!
    @IBOutlet weak var starRating: CosmosView!
    @IBOutlet weak var userImgV: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
