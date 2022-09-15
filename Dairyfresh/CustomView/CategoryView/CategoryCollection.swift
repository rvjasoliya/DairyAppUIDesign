

import UIKit
import SDWebImage

class CategoryCollection: UIView {
    
    @IBOutlet weak var categoryCollactionV: UICollectionView!
    @IBOutlet weak var lblTitle: UILabel!
    
    var vc : UIViewController?
    var topHeader : String?
    var categoryList: [CategoryData] = []
    
    func setupView() {
        getCategory()
        lblTitle.text = topHeader
        self.categoryCollactionV?.register(UINib(nibName: "HomeCategoryCell", bundle: nil), forCellWithReuseIdentifier: "HomeCategoryCell")
        categoryCollactionV.delegate = self
        categoryCollactionV.dataSource = self
    }
    
    func getCategory() {
        Utility.Loading(string: "Please wait")
        NetworkManager.categoryListApi(callback: { (status, data, error) in
            Utility.dismissProgressHUD()
            if !status{
                if error != nil {
                    Utility.alert(message: (error?.localizedDescription ?? ""), title: "", button1: "Ok", action: { (action) in
                    })
                }
            } else {
                self.categoryList = data ?? []
                self.categoryCollactionV.reloadData()
            }
        })
    }
}

extension CategoryCollection: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCategoryCell", for: indexPath) as! HomeCategoryCell
        cell.lblname.text = categoryList[indexPath.row].item_category_name
        cell.imgV?.sd_setImage(with: URL(string:  categoryList[indexPath.row].item_category_logo ?? ""), placeholderImage: UIImage(named: "pleasewait"), options: SDWebImageOptions.allowInvalidSSLCertificates, completed: nil)
        cell.mainBackV.backgroundColor = setGradientColor(button: cell.mainBackV, style: ltr, colors: [headercolor2,headercolor3])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let newvc = vc?.storyboard?.instantiateViewController(withIdentifier: "AllItemListVC") as! AllItemListVC
        newvc.cat = categoryList[indexPath.row].item_category_id
        newvc.itemType =  categoryList[indexPath.row].item_category_name
         vc?.navigationController?.pushViewController(newvc, animated: true)
    }
    
}
