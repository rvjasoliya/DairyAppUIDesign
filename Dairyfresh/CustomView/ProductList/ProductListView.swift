

import UIKit

class ProductListView: UIView {
    
    @IBOutlet weak var collactionV: UICollectionView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnView: UIButton!
    
    
    var itemArray = [String]()
    var vc : UIViewController?
    var isShowAllShow = true
    var type: String?
    var noOfCoulomb: Int?
    var topHeader : String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    //initWithCode to init view from xib or storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupView() {
        self.collactionV?.register(UINib(nibName: "ProductGridCell", bundle: nil), forCellWithReuseIdentifier: "ProductGridCell")
        self.collactionV?.register(UINib(nibName: "ProductListCell", bundle: nil), forCellWithReuseIdentifier: "ProductListCell")
        btnView.isHidden = !isShowAllShow
        lblTitle.text = topHeader
        collactionV.delegate = self
        collactionV.dataSource = self
        collactionV.reloadData()
    }
    
    @IBAction func actionViewAll(_ sender: Any) {
        let newvc = vc?.storyboard?.instantiateViewController(withIdentifier: "AllItemListVC") as! AllItemListVC
        newvc.itemType = type
        newvc.itemArray = itemArray
        vc?.navigationController?.pushViewController(newvc, animated: true)
    }
    
}

extension ProductListView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if noOfCoulomb == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductGridCell", for: indexPath) as! ProductGridCell
            cell.defaultDataSet(image: itemArray[indexPath.row], index: indexPath.row,noOfCoulomb: 2)
            return cell
        } else if noOfCoulomb == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductListCell", for: indexPath) as! ProductListCell
            cell.defaultDataSet(image: itemArray[indexPath.row], index: indexPath.row)
            cell.buttonCartAction = {
                
            }
            return cell
        } else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductGridCell", for: indexPath) as! ProductGridCell
            cell.defaultDataSet(image: itemArray[indexPath.row], index: indexPath.row,noOfCoulomb: nil)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if noOfCoulomb == 2 {
            let width = ((collectionView.bounds.width-10)/2)-5
            return CGSize(width: width, height: 180)
        } else if noOfCoulomb == 1 {
            let width = collectionView.bounds.width-5
            return CGSize(width: width, height: 133)
        } else{
            return CGSize(width: 170, height: 180)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        /*let newvc = vc?.storyboard?.instantiateViewController(withIdentifier: "CakeDetailVC") as! CakeDetailVC
         vc?.navigationController?.pushViewController(newvc, animated: true)*/
    }
}
