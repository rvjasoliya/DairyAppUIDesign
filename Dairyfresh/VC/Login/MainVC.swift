

import UIKit 



class MainVC: UIViewController {
    
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnRegister: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnLogin.backgroundColor = setGradientColor(button: btnLogin, style: ltr, colors: [headercolor4,headercolor2])
        btnRegister.backgroundColor = setGradientColor(button: btnRegister, style: ltr, colors: [headercolor4,headercolor2])
    }
    
    
    
    @IBAction func actionLogin(_ sender: Any) {
        let newvc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        self.navigationController?.pushViewController(newvc, animated: true)
    }
    
    @IBAction func actionRegister(_ sender: Any) {
        let newvc = self.storyboard?.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterVC
        self.navigationController?.pushViewController(newvc, animated: true)
    }
    
    @IBAction func actionSkip(_ sender: Any) {
        let navController = self.storyboard?.instantiateViewController(withIdentifier: "HomeNav") as? UINavigationController
        myApp.window?.rootViewController = navController
    }
    
}
