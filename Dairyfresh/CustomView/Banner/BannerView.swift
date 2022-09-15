

import UIKit


class BannerView: UIView {
    
    @IBOutlet weak var imgCollactionV: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollBackView: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    
    var vc : UIViewController?
    var bestOfferimgArray = ["icpage1","icpage2","icpage3","icpage4","icpage5"]
    var timer: Timer!
    var topHeader : String?
    
    func setupView() {
        self.pageControl.numberOfPages = self.bestOfferimgArray.count
        self.pageControl.currentPage = 0
        //self.view.bringSubviewToFront(self.pageControl)
        self.imgCollactionV?.register(UINib(nibName: "ImgCollectionVCell", bundle: nil), forCellWithReuseIdentifier: "ImgCollectionVCell")
        imgCollactionV.delegate = self
        imgCollactionV.dataSource = self
        lblTitle.text = topHeader
        let scrollViewWidth: Float = Float(scrollBackView.frame.size.width)
        let scrollViewHeight: Float = Float(scrollBackView.frame.size.height)
        scrollBackView.frame = CGRect(x:0 ,y: scrollBackView.frame.origin.y ,width: CGFloat(scrollViewWidth) ,height: CGFloat(scrollViewHeight))
        timer?.invalidate()
        self.timer = Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(self.scrollAutomatically), userInfo: nil, repeats: true)
        self.imgCollactionV.reloadData()
    }
    
    @objc func scrollAutomatically(_ timer1: Timer) {
        if let coll  = imgCollactionV {
            for cell in coll.visibleCells {
                let indexPath: IndexPath? = coll.indexPath(for: cell)
                if ((indexPath?.row)!  < bestOfferimgArray.count - 1){
                    let indexPath1: IndexPath?
                    indexPath1 = IndexPath.init(row: (indexPath?.row)! + 1, section: (indexPath?.section)!)
                    coll.scrollToItem(at: indexPath1!, at: .right, animated: true)
                    self.pageControl.currentPage = (indexPath?.row)! + 1
                }
                else{
                    let indexPath1: IndexPath?
                    indexPath1 = IndexPath.init(row: 0, section: (indexPath?.section)!)
                    coll.scrollToItem(at: indexPath1!, at: .left, animated: true)
                    self.pageControl.currentPage = (indexPath?.row)!
                }
            }
        }
    }
    
}

extension BannerView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bestOfferimgArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImgCollectionVCell", for: indexPath) as! ImgCollectionVCell
        cell.imgV.image = UIImage(named: bestOfferimgArray[indexPath.row])
        //cell.imgV?.sd_setImage(with: URL(string:  bestOfferimgArray[indexPath.row]), placeholderImage: UIImage(named: "pleasewait"), options: SDWebImageOptions.allowInvalidSSLCertificates, completed: nil)
        self.pageControl.currentPage = self.pageControl.currentPage > indexPath.row ? indexPath.row + 1 : indexPath.row - 1
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if collectionView.tag == 2 {
            self.pageControl.currentPage = indexPath.row
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = scrollBackView.bounds.width
        let itemHeight = scrollBackView.bounds.height
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        /*let newvc = self.storyboard?.instantiateViewController(withIdentifier: "CakeDetailVC") as! CakeDetailVC
         self.navigationController?.pushViewController(newvc, animated: true)*/
    }
    
}
