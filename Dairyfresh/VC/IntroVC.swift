
import UIKit


class IntroVC: UIViewController {
    
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var skipV: UIView!
    
    @IBOutlet weak var imagePagerView: FSPagerView! {
        didSet {
            self.imagePagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        }
    }
    
    var currentItem = 0
    
    var imgArray = ["homebh1","homebh1","homebh1"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePagerView.delegate = self
        imagePagerView.dataSource = self
        //imagePagerView.automaticSlidingInterval = 3
     
        pageControl.numberOfPages = imgArray.count
        
    }
    
    @IBAction func actionNext(_ sender: UIButton) {
        if pageControl.currentPage != imgArray.count-1 {
            pageControl.currentPage = pageControl.currentPage + 1
            currentItem = currentItem + 1
            imagePagerView.scrollToItem(at: currentItem, animated: true)
            imagePagerView.selectItem(at: currentItem, animated: true)
            
            if pageControl.currentPage == imgArray.count-1 {
                btnNext.setTitle("Get Started", for: .normal)
            }
        } else{
                let navController = self.storyboard?.instantiateViewController(withIdentifier: "HomeNav") as? UINavigationController
                myApp.window?.rootViewController = navController
            /*} else{
                let navController = self.storyboard?.instantiateViewController(withIdentifier: "NavLogin") as? UINavigationController
                myApp.window?.rootViewController = navController
            }*/
        }
    }
    
    @IBAction func actionSkip(_ sender: Any) {
        let navController = self.storyboard?.instantiateViewController(withIdentifier: "NavLogin") as? UINavigationController
        myApp.window?.rootViewController = navController
        /*if isLoginUser == true {
            let navController = self.storyboard?.instantiateViewController(withIdentifier: "HomeNav") as? UINavigationController
            myApp.window?.rootViewController = navController
        } else{
            let navController = self.storyboard?.instantiateViewController(withIdentifier: "NavLogin") as? UINavigationController
            myApp.window?.rootViewController = navController
        }*/
    }
    
    
}


//MARK:FSPagerView
extension IntroVC: FSPagerViewDelegate, FSPagerViewDataSource{
    
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
        print("Show Index : ",index)
        currentItem = index
        pageControl.currentPage = currentItem
        if index == imgArray.count-1 {
            btnNext.setTitle("Get Started", for: .normal)
        } else{
            btnNext.setTitle("Next", for: .normal)
        }
    }
    
}
