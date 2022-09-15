
import UIKit

class ForgotVC: UIViewController {
    
    @IBOutlet weak var topV: UIView!
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var boxHeight: NSLayoutConstraint!
    @IBOutlet weak var boxTop: NSLayoutConstraint!
    
    @IBOutlet weak var mainBackV: UIView!
    @IBOutlet weak var fieldBackV: UIView!
    
    @IBOutlet weak var emailView: UIView!
    
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentInset = UIEdgeInsets(top: 15, left: 0, bottom: 15, right: 0)
        
        mainBackV.backgroundColor = setGradientColor(button: mainBackV, style: ltr, colors: [headercolor0,headercolor1])
        topV.backgroundColor = setGradientColor(button: topV, style: ltr, colors: [headercolor4,headercolor2])
        fieldBackV.backgroundColor = setGradientColor(button: fieldBackV, style: ltr, colors: [headercolor2,headercolor3])
        btnSubmit.backgroundColor = setGradientColor(button: btnSubmit, style: ltr, colors: [headercolor1,headercolor0])
        
        emailView.backgroundColor = setGradientColor(button: emailView, style: ltr, colors: [headercolor1,headercolor0])
        topV.setRoundCornerRadious()
        txtEmail.placeHolderColor = UIColor.lightText
        if (DeviceType.IS_IPHONE_5) {
            boxHeight.constant = 46
            emailView.cornerRadius = 23
            boxTop.constant = 25
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        scrollView.flashScrollIndicators()
    }
    
    
    @IBAction func actionSubmit(_ sender: Any) {
        if txtEmail.text == nil || (txtEmail.text?.trimmingCharacters(in: .whitespaces).count == 0) {
            Utility.showFail("Enter Valid Phone Number!")
            return
        }
        forgot()
    }
    
    @IBAction func actionBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionSkip(_ sender: Any) {
        let navController = self.storyboard?.instantiateViewController(withIdentifier: "HomeNav") as? UINavigationController
        myApp.window?.rootViewController = navController
    }
    
    func forgot() {
        var Detail = [String: AnyObject]()
        Detail["email"] = txtEmail.text as AnyObject
        Detail["tbl_users_platform"] = "iOS" as AnyObject
        Detail["tbl_users_device_id"] = KeychainManager.sharedInstance.getDeviceIdentifierFromKeychain() as AnyObject
        Detail["tbl_users_device_token"] = token as AnyObject
        Utility.Loading(string: "Please Wait...")
        NetworkManager.forgotApi(param: Detail) { (status, data, error) in
            Utility.dismissProgressHUD()
            if !status{
                if error != nil {
                    Utility.alert(message: (error?.localizedDescription ?? ""), title: "", button1: "Ok", action: { (action) in
                    })
                }
            } else {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
}
