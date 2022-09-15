
import UIKit
import IQKeyboardManagerSwift
import SVProgressHUD
import AVKit
import AVFoundation
import UserNotifications
import iVersion
import Toast_Swift
import ChameleonFramework


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        UIApplication.shared.statusBarStyle = .lightContent
        IQKeyboardManager.shared.enable = true
        
        style.messageColor = .white
        
        //iVersion
        iVersion.sharedInstance().applicationBundleID = BundleID
        iVersion.sharedInstance().appStoreID = UInt(appStoreID)
        iVersion.sharedInstance().remindPeriod = 0
        iVersion.sharedInstance().downloadButtonLabel = "Update"
        iVersion.sharedInstance().updatePriority = iVersionUpdatePriority.high
        iVersion.sharedInstance().useUIAlertControllerIfAvailable = true
        
        UITabBar.appearance().unselectedItemTintColor = UIColor(hexString: "#9b9b9b")!
        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -3)

       /* if let count = UITabBar.items.count {
            for i in 0...(count-1) {
                let imageNameForSelectedState   = arrayOfImageNameForSelectedState[i]
                let imageNameForUnselectedState = arrayOfImageNameForUnselectedState[i]

                self.tabBar.items?[i].selectedImage = UIImage(named: imageNameForSelectedState)?.withRenderingMode(.alwaysOriginal)
                self.tabBar.items?[i].image = UIImage(named: imageNameForUnselectedState)?.withRenderingMode(.alwaysOriginal)
            }
        }*/
       
        if window != nil {
            presentScreen()
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }

    func presentScreen() {
        if UserDefaults.standard.object(forKey: "UserData") != nil {
            if let decoded  = UserDefaults.standard.object(forKey: "UserData") as? Data {
                if let decodedUserdata = NSKeyedUnarchiver.unarchiveObject(with: decoded) as? LoginData {
                    isLoginUser = true
                    currentUser = decodedUserdata
                }
            }
        }
        if let _ = UserDefaults.standard.object(forKey: "introView") as? Bool {
            let navController = storyboard.instantiateViewController(withIdentifier: "HomeNav") as? UINavigationController
            self.window?.rootViewController = navController
            /*if isLoginUser == true {
                let navController = storyboard.instantiateViewController(withIdentifier: "HomeNav") as? UINavigationController
                self.window?.rootViewController = navController
            } else{
                let navController = storyboard.instantiateViewController(withIdentifier: "NavLogin") as? UINavigationController
                self.window?.rootViewController = navController
            }*/
        } else{
            UserDefaults.standard.set(true, forKey: "introView")
            let navController = storyboard.instantiateViewController(withIdentifier: "introNav") as? UINavigationController
            self.window?.rootViewController = navController
        }
    }
    

}

