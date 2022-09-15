
import UIKit

class TrendingCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var mainBackV: UIView!
    @IBOutlet weak var starRating: CosmosView!
    @IBOutlet weak var imgV: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    @IBOutlet weak var btnFav: UIButton!
    
    @IBOutlet weak var mainVWidth: NSLayoutConstraint!
    
}

