

import UIKit


class ProfileVC: UIViewController {
    
    @IBOutlet weak var topV: UIView!
    @IBOutlet weak var mainBackV: UIView!
    @IBOutlet weak var btnLogin: UIButton!
    
    @IBOutlet weak var withoutLoginV: UIView!
    @IBOutlet weak var withLoginV: UIView!
    
    @IBOutlet weak var profileV: UIView!
    @IBOutlet weak var paymentV: UIView!
    @IBOutlet weak var AddressV: UIView!
    @IBOutlet weak var ReferaFriendV: UIView!
    @IBOutlet weak var OrderHistoryV: UIView!
    @IBOutlet weak var RateAppV: UIView!
    @IBOutlet weak var PrivacuPolicyV: UIView!
    @IBOutlet weak var AboutV: UIView!
    @IBOutlet weak var logoutV: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topV.backgroundColor = setGradientColor(button: topV, style: ltr, colors: [headercolor0,headercolor1])
        mainBackV.backgroundColor = setGradientColor(button: topV, style: ltr, colors: [headercolor2,headercolor3])
        
        if !(isLoginUser) {
            withoutLoginV.isHidden = true
            withLoginV.isHidden = false
            
            profileV.backgroundColor = headercolor2
            paymentV.backgroundColor = headercolor2
            AddressV.backgroundColor = headercolor2
            ReferaFriendV.backgroundColor = headercolor2
            OrderHistoryV.backgroundColor = headercolor2
            RateAppV.backgroundColor = headercolor2
            PrivacuPolicyV.backgroundColor = headercolor2
            AboutV.backgroundColor = headercolor2
            logoutV.backgroundColor = headercolor2
        } else{
            withoutLoginV.isHidden = false
            withLoginV.isHidden = true
            btnLogin.backgroundColor = setGradientColor(button: btnLogin, style: ltr, colors: [headercolor1,headercolor0])
        }
    }
    
    @IBAction func actionLogin(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navController = storyboard.instantiateViewController(withIdentifier: "NavLogin") as? UINavigationController
        myApp.window?.rootViewController = navController
    }
    
    
}
