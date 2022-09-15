
import UIKit
import PopupDialog



class CakeDetailVC: UIViewController, ExpandableLabelDelegate {
    
    @IBOutlet weak var topV: UIView!
    @IBOutlet weak var mainBackV: UIView!
    @IBOutlet weak var priceBackV: UIView!
    @IBOutlet weak var btnAddtocart: UIButton!
    @IBOutlet weak var btnOrderNow: UIButton!
    @IBOutlet weak var btnFavourite: UIButton!
    @IBOutlet weak var itemImageV: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemRating: CosmosView!
    @IBOutlet weak var lblRateCount: UILabel!
    @IBOutlet weak var lblNewPrice: UILabel!
    @IBOutlet weak var lblOldPrice: UILabel!
    @IBOutlet weak var lblFreeDelivary: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var lblDesc: ExpandableLabel!
    @IBOutlet weak var btnAddReview: UIButton!
    @IBOutlet weak var btnViewAllReview: UIButton!
    @IBOutlet weak var reviewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var oneKgView: UIView!
    @IBOutlet weak var twoKgView: UIView!
    @IBOutlet weak var customKgView: UIView!
    
    @IBOutlet weak var lblOneKg: UILabel!
    @IBOutlet weak var lblTwoKg: UILabel!
    @IBOutlet weak var lblCustomKg: UILabel!
    
    @IBOutlet weak var lblSelectPrice: UILabel!
    @IBOutlet weak var lblSelectKG: UILabel!
    
    @IBOutlet weak var reviewColloectionV: UICollectionView!
    @IBOutlet weak var sameLikeProductColloectionV: UICollectionView!
    
    
    var bestOfferimgArray = ["icpage1","icpage2","icpage3","icpage4","icpage5"]
    var customerReviewArray = ["icpage1","icpage2","icpage3","icpage4","icpage5"]
    
    var isFav = false
    
    var selectedSize: Double = 1
    var selectedSizePrice: Double = 1000
    var selectSizeView = 1
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sameLikeProductColloectionV?.register(UINib(nibName: "ProductGridCell", bundle: nil), forCellWithReuseIdentifier: "ProductGridCell")
        topV.backgroundColor = setGradientColor(button: topV, style: ltr, colors: [headercolor0,headercolor1])
        mainBackV.backgroundColor = setGradientColor(button: topV, style: ltr, colors: [headercolor2,headercolor3])
        //priceBackV.backgroundColor = setGradientColor(button: topV, style: ltr, colors: [headercolor2,headercolor3])
        lblDesc.delegate = self
        lblDesc.numberOfLines = 3
        lblDesc.collapsed = true
        lblDesc.collapsedAttributedLink = NSAttributedString(string: "Read More")
        lblDesc.expandedAttributedLink = NSAttributedString(string: "Read Less")
        lblDesc.shouldCollapse = true
        lblDesc.setMoreLinkWith(lessLink: "Read More", attributes: [NSAttributedString.Key.foregroundColor:UIColor.black], position: nil)
        lblDesc.setLessLinkWith(lessLink: "Read Less", attributes: [NSAttributedString.Key.foregroundColor:UIColor.red], position: nil)
        lblDesc.frame.size.width = UIScreen.main.bounds.width-40
        
        lblDesc.text = "Dairy Fresh In addition to its own stores, Dairy Fresh is also present on third party food delivery platforms like Swiggy, Uber Eats and Zomato. Yet another touch-point in the online domain is the company’s website and app. These two platforms enjoy a loyal base of followers who regularly order their favorite dessert from these touch-points. The company has also launched an innovative ‘Order on Whatsapp’ channel to further reduce the friction in ordering and ensure that the company’s patrons never without their favorite delicacies from Dairy Fresh."
        setPrice()
    }
    
    func viewSetup() {
        if customerReviewArray.count == 0 {
            reviewHeight.constant = 0
            btnViewAllReview.isHidden = true
        } else if customerReviewArray.count == 1 {
            reviewHeight.constant = 140
            btnViewAllReview.isHidden = true
        }
         
        if isFav == true {
            btnFavourite.backgroundColor = UIColor(hexRGB: "#C52B02")
            btnFavourite.tintColor = UIColor.white
        } else{
            btnFavourite.backgroundColor = UIColor.white
            btnFavourite.tintColor = UIColor(hexRGB: "#C52B02")
        }
        
    }
    
    
    @IBAction func actionBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func action1Kg(_ sender: Any) {
        self.selectSizeView = 1
        self.selectedSize = 1
        self.setPrice()
    }
    
    @IBAction func action2Kg(_ sender: Any) {
        self.selectSizeView = 2
        self.selectedSize = 2
        self.setPrice()
    }
    
    @IBAction func actionCustomKg(_ sender: Any) {
        let customV = CustomKGView(nibName: "CustomKGView", bundle: nil)
        //customV.view.backgroundColor = .clear
        let popup = PopupDialog(viewController: customV, buttonAlignment: .horizontal, transitionStyle: .bounceDown, tapGestureDismissal: true)
        popup.view.backgroundColor = .clear
        customV.onCompletion = { (size) in
                print(size)
            self.selectSizeView = 3
            self.selectedSize = size
            self.setPrice()
        }
        self.present(popup, animated: true, completion: nil)
    }
    
    @IBAction func actionFavourite(_ sender: Any) {
        isFav = !isFav
        if isFav == true {
            btnFavourite.backgroundColor = UIColor(hexRGB: "#C52B02")
            btnFavourite.tintColor = UIColor.white
        } else{
            btnFavourite.backgroundColor = UIColor.white
            btnFavourite.tintColor = UIColor(hexRGB: "#C52B02")
        }
    }
    
    @IBAction func actionAddReview(_ sender: Any) {
        let customV = AddReviewView(nibName: "AddReviewView", bundle: nil)
        let popup = PopupDialog(viewController: customV, buttonAlignment: .horizontal, transitionStyle: .bounceDown, tapGestureDismissal: true)
        self.present(popup, animated: true, completion: nil)
    }
    
    @IBAction func actionViewAllReview(_ sender: Any) {
        let newvc = self.storyboard?.instantiateViewController(withIdentifier: "AllReviewVC") as! AllReviewVC
        self.navigationController?.pushViewController(newvc, animated: true)
    }
    
    func setPrice() {
        selectedSizePrice = (selectedSize*1000)
        self.lblSelectPrice.text = "Rs. \(selectedSizePrice)"
        self.lblSelectKG.text = "(\(selectedSize)kg)"
        oneKgView.backgroundColor = selectSizeView == 1 ?  choclateColor : UIColor(hexRGB: "#F9F9F9")!
        twoKgView.backgroundColor = selectSizeView == 2 ? choclateColor : UIColor(hexRGB: "#F9F9F9")!
        customKgView.backgroundColor = selectSizeView == 3 ? choclateColor : UIColor(hexRGB: "#F9F9F9")!
        lblOneKg.textColor = selectSizeView == 1 ?  creamColor : choclateColor
        lblTwoKg.textColor = selectSizeView == 2 ? creamColor : choclateColor
        lblCustomKg.textColor = selectSizeView == 3 ? creamColor : choclateColor
    }
    
    
    //MARK:- ExpandableLabel Delegete
    func willExpandLabel(_ label: ExpandableLabel) {
        lblDesc = label
    }
    
    func didExpandLabel(_ label: ExpandableLabel) {
        lblDesc = label
    }
    
    func willCollapseLabel(_ label: ExpandableLabel) {
        lblDesc = label
    }
    
    func didCollapseLabel(_ label: ExpandableLabel) {
        lblDesc = label
    }
    
    
    
}


extension CakeDetailVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1 {
            return bestOfferimgArray.count
        } else{
            return customerReviewArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductGridCell", for: indexPath) as! ProductGridCell
            cell.defaultDataSet(image: bestOfferimgArray[indexPath.row], index: indexPath.row,noOfCoulomb: nil)
            return cell
        } else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomerReviewCell", for: indexPath) as! CustomerReviewCell
            //            cell.lblUserName.text = ""
            //            cell.lblTitle.text = ""
            //            cell.lblDesc.text = ""
            //            cell.userImgV.image = UIImage(named: bestOfferimgArray[indexPath.row])
            //            cell.starRating.rating = 3.0
            return cell
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.tag == 1 {
            return CGSize(width: 170, height: 180)
        } else{
            return CGSize(width: 247, height: 140)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //let newvc = self.storyboard?.instantiateViewController(withIdentifier: "CakeDetailVC") as! CakeDetailVC
        //self.navigationController?.pushViewController(newvc, animated: true)
    }
    
    
    
}
