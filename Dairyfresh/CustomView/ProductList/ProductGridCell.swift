


import UIKit
import SDWebImage


class ProductGridCell: UICollectionViewCell {
    
    @IBOutlet weak var mainBackV: UIView!
    @IBOutlet weak var starRating: CosmosView!
    @IBOutlet weak var imgV: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    @IBOutlet weak var btnFav: UIButton!
    
    @IBOutlet weak var mainVWidth: NSLayoutConstraint!
    
    var product: ProductData?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func actionFav(_ sender: Any) {
        if product == nil {
           return
        }
        if (product?.isFav == true) {
            removeDataFav(product: product!)
            product?.isFav = false
            btnFav.setImage(UIImage(named: "ic_unfav"), for: .normal)
        } else{
            saveDataFav(product: product!)
            product?.isFav = true
            btnFav.setImage(UIImage(named: "ic_fav"), for: .normal)
        }
    }
    
    func favSetup(product: ProductData) {
        if (product.isFav == true) {
            self.btnFav.setImage(UIImage(named: "ic_fav"), for: .normal)
        } else{
            self.btnFav.setImage(UIImage(named: "ic_unfav"), for: .normal)
        }
    }
    
    func configeCell(product: ProductData,noOfCoulomb: CGFloat?) {
        self.layoutIfNeeded()
        self.product = product
        lblName.text = product.item_master_name //"Cack \(indexPath.row)" //catArray[indexPath.row]
        lblPrice.text = product.item_master_price //"Rs. 1500/-" //catArray[indexPath.row]
        //imgV.image = UIImage(named: productList[indexPath.row].item_master_logo ?? "")
        imgV?.sd_setImage(with: URL(string:  product.item_master_logo ?? ""), placeholderImage: UIImage(named: "pleasewait"), options: SDWebImageOptions.allowInvalidSSLCertificates, completed: nil)
        mainBackV.backgroundColor = setGradientColor(button: self, style: ltr, colors: [#colorLiteral(red: 1, green: 0.9254901961, blue: 0.8235294118, alpha: 1),#colorLiteral(red: 0.9019607843, green: 0.8705882353, blue: 0.9137254902, alpha: 1)])
        if let noOfCoulomb = noOfCoulomb {
            let width = ((UIScreen.main.bounds.width-10)/noOfCoulomb)
            mainVWidth.constant = width-10
        }
        favSetup(product: product)
    }
    
    func defaultDataSet(image:String,index:Int,noOfCoulomb: CGFloat?) {
        lblName.text = "Cack \(index)" //catArray[indexPath.row]
        lblPrice.text = "Rs. 1500/-" //catArray[indexPath.row]
        imgV.image = UIImage(named: image)
        mainBackV.backgroundColor = setGradientColor(button: self, style: ltr, colors: [#colorLiteral(red: 1, green: 0.9254901961, blue: 0.8235294118, alpha: 1),#colorLiteral(red: 0.9019607843, green: 0.8705882353, blue: 0.9137254902, alpha: 1)])
        if let noOfCoulomb = noOfCoulomb {
            let width = ((UIScreen.main.bounds.width-10)/noOfCoulomb)
            mainVWidth.constant = width-10
        }
        //favSetup(product: product)
    }
    
}
