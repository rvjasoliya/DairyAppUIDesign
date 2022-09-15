 
 
 import UIKit
 import PopupDialog
 
 
 
 class AllReviewVC: UIViewController {
    
    @IBOutlet weak var topV: UIView!
    @IBOutlet weak var mainBackV: UIView!
    @IBOutlet weak var tblView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topV.backgroundColor = setGradientColor(button: topV, style: ltr, colors: [headercolor0,headercolor1])
        mainBackV.backgroundColor = setGradientColor(button: topV, style: ltr, colors: [headercolor2,headercolor3])
        tblView.contentInset = UIEdgeInsets(top: 3, left: 0, bottom: 3, right: 0)
    }
    
    @IBAction func actionBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func actionAddReview(_ sender: Any) {
        let customV = AddReviewView(nibName: "AddReviewView", bundle: nil)
        let popup = PopupDialog(viewController: customV, buttonAlignment: .horizontal, transitionStyle: .bounceDown, tapGestureDismissal: true)
        self.present(popup, animated: true, completion: nil)
    }
    
 }
 
 extension AllReviewVC : UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomerReviewTblCell", for: indexPath) as! CustomerReviewTblCell
        //            cell.lblUserName.text = ""
        //            cell.lblTitle.text = ""
        //            cell.lblDesc.text = ""
        //            cell.lblDate.text = ""
        //            cell.userImgV.image = UIImage(named: bestOfferimgArray[indexPath.row])
        //            cell.starRating.rating = 3.0
        return cell
    }
    
 }
