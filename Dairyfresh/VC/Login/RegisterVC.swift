 
 import UIKit
 
 
 
 class RegisterVC: UIViewController {
    
    @IBOutlet weak var topV: UIView!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtMobile: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var boxHeight: NSLayoutConstraint!
    @IBOutlet weak var boxTop: NSLayoutConstraint!
    
    @IBOutlet weak var mainBackV: UIView!
    @IBOutlet weak var fieldBackV: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var mobileView: UIView!
    @IBOutlet weak var passwordView: UIView!
    
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var btnFacebook: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentInset = UIEdgeInsets(top: 15, left: 0, bottom: 15, right: 0)
        
        mainBackV.backgroundColor = setGradientColor(button: mainBackV, style: ltr, colors: [headercolor0,headercolor1])
        topV.backgroundColor = setGradientColor(button: topV, style: ltr, colors: [headercolor4,headercolor2])
        fieldBackV.backgroundColor = setGradientColor(button: fieldBackV, style: ltr, colors: [headercolor2,headercolor3])
        btnRegister.backgroundColor = setGradientColor(button: btnRegister, style: ltr, colors: [headercolor1,headercolor0])
        
        emailView.backgroundColor = setGradientColor(button: emailView, style: ltr, colors: [headercolor1,headercolor0])
        nameView.backgroundColor = setGradientColor(button: nameView, style: ltr, colors: [headercolor1,headercolor0])
        mobileView.backgroundColor = setGradientColor(button: mobileView, style: ltr, colors: [headercolor1,headercolor0])
        passwordView.backgroundColor = setGradientColor(button: passwordView, style: ltr, colors: [headercolor1,headercolor0])
        btnFacebook.backgroundColor = setGradientColor(button: btnFacebook, style: ltr, colors: [fbcolor1,fbcolor2])
        
        topV.setRoundCornerRadious()
        txtEmail.placeHolderColor = UIColor.lightText
        txtName.placeHolderColor = UIColor.lightText
        txtMobile.placeHolderColor = UIColor.lightText
        txtPassword.placeHolderColor = UIColor.lightText
        
        if (DeviceType.IS_IPHONE_5) {
            boxHeight.constant = 46
            emailView.cornerRadius = 23
            passwordView.cornerRadius = 23
            nameView.cornerRadius = 23
            mobileView.cornerRadius = 23
            btnRegister.cornerRadius = 23
            btnFacebook.cornerRadius = 23
            boxTop.constant = 25
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        scrollView.flashScrollIndicators()
    }
    
    @IBAction func actionRegister(_ sender: Any) {
        if txtEmail.text == nil || (txtEmail.text?.trimmingCharacters(in: .whitespaces).count == 0) {
            Utility.showFail("Enter Valid Phone Number!")
            return
        }
        if txtPassword.text == nil || (txtPassword.text?.trimmingCharacters(in: .whitespaces).count == 0) {
            Utility.showFail("Enter Valid Password")
            return
        }
        if txtName.text == nil || (txtName.text?.trimmingCharacters(in: .whitespaces).count == 0) {
            Utility.showFail("Enter Your name")
            return
        }
        if txtMobile.text == nil || (txtMobile.text?.trimmingCharacters(in: .whitespaces).count == 0) {
            Utility.showFail("Enter Mobile number")
            return
        }
        else {
            registration()
        }
    }
    
    
    @IBAction func actionLogin(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionFacebook(_ sender: Any) {
        let navController = self.storyboard?.instantiateViewController(withIdentifier: "HomeNav") as? UINavigationController
        myApp.window?.rootViewController = navController
    }
    
    
    func registration() {
        var Detail = [String: AnyObject]()
        Detail["name"] = txtName.text as AnyObject
        Detail["mobile"] = txtMobile.text as AnyObject
        Detail["email"] = txtEmail.text as AnyObject
        Detail["password"] = txtPassword.text as AnyObject
        Detail["tbl_users_platform"] = "iOS" as AnyObject
        Detail["tbl_users_device_id"] = KeychainManager.sharedInstance.getDeviceIdentifierFromKeychain() as AnyObject
        Detail["tbl_users_device_token"] = token as AnyObject
        Utility.Loading(string: "Please Wait...")
        NetworkManager.registrationApi(param: Detail) { (status, data, error) in
            Utility.dismissProgressHUD()
            if !status{
                if error != nil {
                    Utility.alert(message: (error?.localizedDescription ?? ""), title: "", button1: "Ok", action: { (action) in
                    })
                }
            } else {
                currentUser = data
                isLoginUser = true
                if let userdata = currentUser {
                    let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: userdata)
                    UserDefaults.standard.set(encodedData, forKey: "UserData")
                    UserDefaults.standard.synchronize()
                }
                let navController = self.storyboard?.instantiateViewController(withIdentifier: "HomeNav") as? UINavigationController
                myApp.window?.rootViewController = navController
            }
        }
    }
    
 }
