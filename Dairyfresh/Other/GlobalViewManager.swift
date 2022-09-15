

import UIKit



func setupViewData(stackV: UIStackView,vc: UIViewController, isShowAllShow: Bool,itemArray : [String],type: String,header:String?,noOfCoulomb: Int?) {
    let cview1 = UINib(nibName: "ProductListView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! ProductListView
    cview1.isShowAllShow = isShowAllShow
    cview1.itemArray = itemArray
    cview1.vc = vc
    cview1.topHeader = header
    cview1.type = type
    cview1.noOfCoulomb = noOfCoulomb
    cview1.setupView()
    stackV.addArrangedSubview(cview1)
}

func setupCategoryCollectionViewData(stackV: UIStackView,vc: UIViewController,header:String?) {
    let cview1 = UINib(nibName: "CategoryCollection", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! CategoryCollection
    cview1.vc = vc
    cview1.topHeader = header
    cview1.setupView()
    stackV.addArrangedSubview(cview1)
}

func setupSliderViewViewData(stackV: UIStackView,vc: UIViewController,itemArray : [String]) {
    let cview1 = UINib(nibName: "SliderView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! SliderView
    cview1.vc = vc
    cview1.imgArray = itemArray
    cview1.setupView()
    stackV.addArrangedSubview(cview1)
}

func setupBannerViewViewData(stackV: UIStackView,vc: UIViewController,header:String?) {
    let cview1 = UINib(nibName: "BannerView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! BannerView
    cview1.vc = vc
    cview1.topHeader = header
    cview1.setupView()
    stackV.addArrangedSubview(cview1)
}
