

import UIKit

class SliderView: UIView {
    
    @IBOutlet weak var imagePagerView: FSPagerView! {
        didSet {
            self.imagePagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        }
    }
    
    var imgArray = ["icpage1","icpage2","icpage3","icpage4","icpage5"]
    var vc : UIViewController?
    
    func setupView() {
        imagePagerView.delegate = self
        imagePagerView.dataSource = self
        imagePagerView.automaticSlidingInterval = 3
    }
}

//MARK:FSPagerView
extension SliderView: FSPagerViewDelegate, FSPagerViewDataSource{
    
    public func numberOfItems(in pagerView: FSPagerView) -> Int {
        return imgArray.count
    }
    
    public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = imagePagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        //cell.imageView?.contentMode = .scaleToFill
        cell.imageView?.image = UIImage(named: self.imgArray[index])
        return cell
    }
    
    func pagerView(_ pagerView: FSPagerView, willDisplay cell: FSPagerViewCell, forItemAt index: Int) {
        //print("Show Index : ",index)
    }
    
}
