 
 import UIKit
 import SDWebImage
 
 
 class AllItemListVC: UIViewController {
    
    @IBOutlet weak var topV: UIView!
    @IBOutlet weak var mainBackV: UIView!
    @IBOutlet weak var collactionV: UICollectionView!
    @IBOutlet weak var lblItemType: UILabel!
    
    var itemArray = [String]()
    var productList:[ProductData] = []
    var itemType: String?
    var cat:String?
    var isProductList = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collactionV?.register(UINib(nibName: "ProductGridCell", bundle: nil), forCellWithReuseIdentifier: "ProductGridCell")
        topV.backgroundColor = setGradientColor(button: topV, style: ltr, colors: [headercolor0,headercolor1])
        mainBackV.backgroundColor = setGradientColor(button: topV, style: ltr, colors: [headercolor2,headercolor3])
        if let cat = cat {
            getProduct(cat: cat)
            lblItemType.text = itemType
            isProductList = true
        } else{
            lblItemType.text = "All \(itemType ?? "")"
        }
        collactionV.contentInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    @IBAction func actionBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func getProduct(cat:String) {
        Utility.Loading(string: "Please wait")
        NetworkManager.getProductApi(param: ["item_category_id" : cat]) { (status, data, error) in
            Utility.dismissProgressHUD()
            if !status{
                if error != nil {
                    Utility.alert(message: (error?.localizedDescription ?? ""), title: "", button1: "Ok", action: { (action) in
                    })
                }
            } else {
                self.productList = data ?? []
                self.collactionV.reloadData()
            }
        }
    }
    
    
 }
 
 
 extension AllItemListVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var count = itemArray.count
        if isProductList == true {
            count = self.productList.count
        }
        if count == 0 {
            self.collactionV.setEmptyMessage("Your favourite list is empty!")
        } else {
            self.collactionV.restore()
        }
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if isProductList == true {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductGridCell", for: indexPath) as! ProductGridCell
            cell.configeCell(product: productList[indexPath.row],noOfCoulomb: 2)
            return cell
        } else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductGridCell", for: indexPath) as! ProductGridCell
            cell.defaultDataSet(image: itemArray[indexPath.row], index: indexPath.row,noOfCoulomb: 2)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = ((self.view.bounds.width-10)/2)-5
        return CGSize(width: width, height: 180)
    }
    
 }
