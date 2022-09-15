

import UIKit
import SDWebImage


class FavouriteVC: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var topV: UIView!
    @IBOutlet weak var mainBackV: UIView!
    @IBOutlet weak var favouriteCollactionV: UICollectionView!
    
    var productList:[ProductData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.favouriteCollactionV?.register(UINib(nibName: "ProductGridCell", bundle: nil), forCellWithReuseIdentifier: "ProductGridCell")
        topV.backgroundColor = setGradientColor(button: topV, style: ltr, colors: [headercolor0,headercolor1])
        mainBackV.backgroundColor = setGradientColor(button: topV, style: ltr, colors: [headercolor2,headercolor3])
        favouriteCollactionV.contentInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        favouriteCollactionV.flashScrollIndicators()
        productList = getFavList()
        favouriteCollactionV.reloadData()
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

extension FavouriteVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if productList.count == 0 {
            self.favouriteCollactionV.setEmptyMessage("Your favourite list is empty!")
        } else {
            self.favouriteCollactionV.restore()
        }
         return productList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductGridCell", for: indexPath) as! ProductGridCell
        cell.configeCell(product: productList[indexPath.row],noOfCoulomb: 2)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = ((self.view.bounds.width-10)/2)-5
        return CGSize(width: width, height: 180)
    }
    
}


func checkFav(id: String) -> Bool {
    let favList = UserDefaults.standard.string(forKey: "FavList")
    let list  = convertArrayToDictionary(text: favList ?? "") ?? []
    var result = false
    var rs = list.contains { (array) -> Bool in
        if ((array["item_master_id"] as? String) == id) {
            result = true
            return true
        }
        return false
    }
    print(rs)
    return result
}

func getFavList() -> [ProductData] {
    let favList = UserDefaults.standard.string(forKey: "FavList")
    var list = [ProductData]()
    for item in convertArrayToDictionary(text: favList ?? "") ?? [] {
        if let product = ProductData(dictionary: item as NSDictionary) {
            list.append(product)
        }
    }
    return list
}

func saveDataFav(product: ProductData) {
    var list = [NSDictionary]()
    list = [product.dictionaryRepresentation()]
    let favList = UserDefaults.standard.string(forKey: "FavList")
    for item in convertArrayToDictionary(text: favList ?? "") ?? [] {
        if let data = item as? NSDictionary {
            list.append(data)
        }
    }
    //print(jsonDictionary(jsonData: list))
    UserDefaults.standard.set(jsonDictionary(jsonData: list), forKey: "FavList")
}

func removeDataFav(product: ProductData) {
    var list = getFavList()
    for (indx,item) in list.enumerated() {
        if item.item_master_id == product.item_master_id {
            list.remove(at: indx)
            break
        }
    }
    //print(jsonDictionary(jsonData: list))
    var ar = [NSDictionary]()
    for item in list{
        ar.append(item.dictionaryRepresentation())
    }
    UserDefaults.standard.set(jsonDictionary(jsonData: ar), forKey: "FavList")
}

func jsonDictionary(jsonData:[NSDictionary]) -> String? {
    do {
        let jsonData = try JSONSerialization.data(withJSONObject: jsonData)
        if let json = String(data: jsonData, encoding: .utf8) {
            print(json)
            return json
        }
    } catch {
        print("something went wrong with parsing json")
        return ""
    }
    return nil
}

func convertArrayToDictionary(text: String) -> [[String: Any]]? {
    if let data = text.data(using: .utf8) {
        do {
            return try JSONSerialization.jsonObject(with: data, options : .allowFragments) as? [Dictionary<String,Any>]
        } catch {
            print(error.localizedDescription)
        }
    }
    return nil
}

