

import UIKit


class MyOrderVC: UIViewController, UIScrollViewDelegate {
    
    
    @IBOutlet weak var topV: UIView!
    @IBOutlet weak var mainBackV: UIView!
    @IBOutlet weak var orderListView: UITableView!
    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var btnShowCake: UIButton!
    
    var bestOfferimgArray = ["icpage1","icpage2","icpage3","icpage4","icpage5","icpage3","icpage4","icpage5"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.orderListView?.register(UINib(nibName: "MyCartCell", bundle: nil), forCellReuseIdentifier: "MyCartCell")
        topV.backgroundColor = setGradientColor(button: topV, style: ltr, colors: [headercolor0,headercolor1])
        mainBackV.backgroundColor = setGradientColor(button: topV, style: ltr, colors: [headercolor2,headercolor3])
        
        if bestOfferimgArray.count == 0 {
            emptyView.isHidden = false
            orderListView.isHidden = true
        } else{
            emptyView.isHidden = true
            orderListView.isHidden = false
        }
        orderListView.contentInset = UIEdgeInsets(top: 4, left: 0, bottom: 10, right: 0)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        orderListView.flashScrollIndicators()
    }
    
    @IBAction func actionShowCake(_ sender: Any) {
        
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

extension MyOrderVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bestOfferimgArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCartCell", for: indexPath) as! MyCartCell
        cell.lblName.text = "Cack \(indexPath.row)" //catArray[indexPath.row]
        cell.lblPrice.text = "Rs. 1500/-" //catArray[indexPath.row]
        cell.imgV.image = UIImage(named: bestOfferimgArray[indexPath.row])
        cell.containerView.backgroundColor = headercolor2//setGradientColor(button: topV, style: ltr, colors: [#colorLiteral(red: 0.9019607843, green: 0.8705882353, blue: 0.9137254902, alpha: 1),#colorLiteral(red: 1, green: 0.9254901961, blue: 0.8235294118, alpha: 1)])
        cell.btnPlaceOrder.backgroundColor = setGradientColor(button: cell.btnPlaceOrder, style: ltr, colors: [headercolor1,headercolor0])
        if (DeviceType.IS_IPHONE_5) {
            cell.lblQtytext.text = "Qty :"
        }
        return cell
    }
    
}
