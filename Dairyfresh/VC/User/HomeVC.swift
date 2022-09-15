

import UIKit
import SDWebImage


class HomeVC: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var topV: UIView!
    @IBOutlet weak var mainBackV: UIView!
    @IBOutlet weak var stackV: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var bestOfferimgArray = ["icpage1","icpage2","icpage3","icpage4","icpage5"]
    
    var catArray = ["Valentine","Anniversary","Birthday","Cake","Pastrie","Coco","Cupcack","IC-Cone","Ice-Cream"]
    var catImageArray = ["Valentine","Anniversary","Birthday1","Cake","Pastrie","Coco","Cupcack","Ice-CreamCone","Ice-Cream"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()       
        topV.backgroundColor = setGradientColor(button: topV, style: ltr, colors: [headercolor0,headercolor1])
        mainBackV.backgroundColor = setGradientColor(button: topV, style: ltr, colors: [headercolor2,headercolor3])
        scrollView.delegate = self
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        setupSliderViewViewData(stackV: stackV, vc: self, itemArray: bestOfferimgArray)
        setupCategoryCollectionViewData(stackV: stackV, vc: self, header: "SHOP BY OCCASIONS")
        setupBannerViewViewData(stackV: stackV, vc: self, header: "BEST OFFERS")
        setupViewData(stackV: stackV, vc: self, isShowAllShow: true, itemArray: bestOfferimgArray, type: "TRENDING", header: "TRENDING",noOfCoulomb: 2)
        setupViewData(stackV: stackV, vc: self, isShowAllShow: true, itemArray: bestOfferimgArray, type: "POPULAR", header: "POPULAR",noOfCoulomb: 2)
        setupViewData(stackV: stackV, vc: self, isShowAllShow: true, itemArray: bestOfferimgArray, type: "RECENT VIEW", header: "Recent view",noOfCoulomb: 2)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        scrollView.flashScrollIndicators()
        //collectionViewHeight.constant = (((optionCollactionV.bounds.width/2)-30)*4)
        
        view.layoutIfNeeded()
    }
   
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if scrollView.panGestureRecognizer.translation(in: scrollView).y < 0{
            changeTabBar(hidden: true, animated: true, vc: self)
        }
        else{
            changeTabBar(hidden: false, animated: true, vc: self)
        }
    }
    
}





