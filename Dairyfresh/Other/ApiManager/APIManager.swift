

import UIKit
import Foundation
import SystemConfiguration
import Alamofire
import NotificationBar
import SwiftyJSON
import SVProgressHUD
import PopupDialog


/*class APIManager: NSObject {
    static let sharedInstance = APIManager()
    
    func getResponseAPI(url:String,isPring: Bool = false,completionHandler:@escaping (AnyObject?, NSError?)->()) ->() {
        AF.request(url, method: HTTPMethod.get, parameters: nil, encoding: URLEncoding.httpBody, headers: [headerKey:headerValue])
            .validate(/*contentType: ["application/json"]*/)
            .responseJSON { response in
                switch response.result {
                case .success( _):
                    if (isPring) {
                        print(response.value ?? " ")
                    }
                    SVProgressHUD.dismiss()
                    do {
                        SVProgressHUD.dismiss()
                        let someDictionaryFromJSON = try JSONSerialization.jsonObject(with: response.data!, options: .allowFragments) as! [String: Any]
                        completionHandler(someDictionaryFromJSON as AnyObject?,nil)
                    } catch{
                        SVProgressHUD.dismiss()
                        completionHandler(nil,response.error as NSError?)
                        print("Error : ",error)
                    }
                case .failure(let error):
                    SVProgressHUD.dismiss()
                    completionHandler(nil,response.error as NSError?)
                    print("Request failed with error: \(error)")
                }
        }
    }
    
    
    func getResponseWithDetailAPI(url:String,isPring: Bool = false,Detail: [String: AnyObject],completionHandler:@escaping (AnyObject?, NSError?)->()) ->() {
        if let jsonString = dictionaryToString(Detail: Detail) {
            if let url = URL(string: url) {
                let jsonDatas = jsonString.data(using: .utf8, allowLossyConversion: false)!
                
                var request = URLRequest(url: url)
                request.httpMethod = HTTPMethod.post.rawValue
                request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
                request.setValue(headerValue, forHTTPHeaderField: headerKey)
                request.httpBody = jsonDatas
                
                AF.request(request).responseJSON {
                    (response) in
                    //print(response)
                    switch response.result {
                    case .success(let data):
                        let json = JSON(data)
                        if (isPring) {
                            print(response.value ?? " ")
                        }
                        if let _ = json.dictionary {
                            do {
                                SVProgressHUD.dismiss()
                                let someDictionaryFromJSON = try JSONSerialization.jsonObject(with: response.data!, options: .allowFragments) as! [String: Any]
                                completionHandler(someDictionaryFromJSON as AnyObject?,nil)
                            } catch {
                                completionHandler(nil,response.error as NSError?)
                                print("error: \(error)")
                            }
                        } else{
                            completionHandler(nil,response.error as NSError?)
                        }
                    case .failure(let error):
                        SVProgressHUD.dismiss()
                        completionHandler(nil,response.error as NSError?)
                        print("Request failed with error: \(error)")
                    }
                }
            }
        }
    }
    
    func postResponseAPI(_ url:String,isPring: Bool = false,param:AnyObject!,completionHandler:@escaping (AnyObject?, NSError?)->()) ->()
    {
        if isConnectedToNetwork() {
            AF.request(url, method: .post, parameters: param as? [String : AnyObject], encoding: URLEncoding.default, headers: [headerKey:headerValue]).responseJSON { response in
                    switch response.result {
                    case .success( _):
                        if (isPring) {
                            print(response.value ?? " ")
                        }
                        SVProgressHUD.dismiss()
                        do {
                            SVProgressHUD.dismiss()
                            let someDictionaryFromJSON = try JSONSerialization.jsonObject(with: response.data!, options: .allowFragments) as! [String: Any]
                            completionHandler(someDictionaryFromJSON as AnyObject?,nil)
                        } catch{
                            SVProgressHUD.dismiss()
                            completionHandler(nil,response.error as NSError?)
                            print("Error : ",error)
                        }
                    case .failure(let error):
                        SVProgressHUD.dismiss()
                        completionHandler(nil,response.error as NSError?)
                        print("Request failed with error: \(error)")
                    }
            }
        }else{
            DispatchQueue.main.async(execute: {
                SVProgressHUD.dismiss()
                let customV = InternetConnectionView(nibName: "InternetConnectionView", bundle: nil)
                let popup = PopupDialog(viewController: customV, buttonAlignment: .horizontal, transitionStyle: .bounceDown, tapGestureDismissal: false)
                myApp.window?.rootViewController?.present(popup, animated: true, completion: nil)
            })
        }
    }
    
    
}*/


class Utility{
    
    class func showSuccess(_ message:String = ""){
        let vc = UIViewController()
        NotificationBar(over: myApp.window?.rootViewController ?? vc, text: message, style: .success).show()
    }
    
    class func showFail(_ message:String = ""){
        let vc = UIViewController()
        NotificationBar(over: myApp.window?.rootViewController ?? vc, text: message, style: .error).show()
    }
    
    class func alert(message: String, title: String? = appFullName) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(action)
            alert.show()
        }
    }
    
    class func showToast(string: String?,vc: UIViewController?) {
        var vcn = UIViewController()
        if vc == nil {
            vcn = myApp.window?.rootViewController ?? UIViewController()
        } else{
            vcn = vc ?? UIViewController()
        }
        vcn.view.makeToast(string, duration: 3.0, position: .bottom, style: style)
    }
    
    class func Loading(string: String?, maskType: SVProgressHUDMaskType = SVProgressHUDMaskType.black) {
        //.setDefaultMaskType(SVProgressHUDMaskType.black)
        SVProgressHUD.show(withStatus: string  ?? "")
        //SVProgressHUD.show(withStatus: string!, maskType: maskType)
    }
    
    class func showInfoProgressHUD(string: String? = nil) {
        SVProgressHUD.showInfo(withStatus: string)
    }
    
    class func dismissProgressHUD() {
        SVProgressHUD.dismiss()
    }
    
    class func alert(message: String, title: String, button1: String, button2: String? = nil, button3: String? = nil, action:@escaping (Int)->())
    {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            let action1 = UIAlertAction(title: button1, style: .default) { _ in
                action(0)
            }
            alert.addAction(action1)
            if button2 != nil {
                let action2 = UIAlertAction(title: button2, style: .default) { _ in
                    action(1)
                }
                alert.addAction(action2)
            }
            if button3 != nil {
                let action3 = UIAlertAction(title: button3, style: .default) { _ in
                    action(2)
                }
                alert.addAction(action3)
            }
            alert.show()
        }
    }
    
    class func isConnectedToNetwork() -> Bool {
        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
        if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
            return false
        }
        // Working for Cellular and WIFI
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        let ret = (isReachable && !needsConnection)
        
        return ret
    }
    
    class func getAPI(url:String,isPrint: Bool = false,completionHandler:@escaping (AnyObject?, NSError?)->()) ->() {
        autoreleasepool {
            if Utility.isConnectedToNetwork() {
                AF.request(url, method: HTTPMethod.get, encoding: URLEncoding(), headers: [ApiHeader.key:ApiHeader.value])
                    .validate()
                    .responseJSON { response in
                        switch response.result {
                        case .success(let value):
                            if (isPrint) {
                                print(value)
                            }
                            Utility.dismissProgressHUD()
                            do {
                                let someDictionaryFromJSON = try JSONSerialization.jsonObject(with: response.data!, options: .allowFragments)
                                completionHandler(someDictionaryFromJSON as AnyObject,nil)
                            } catch{
                                completionHandler(nil,response.error as NSError?)
                                print("Error : ",error)
                            }
                        case .failure(let error):
                            Utility.dismissProgressHUD()
                            completionHandler(nil,error as NSError?)
                            print("Request failed with error: \(error)")
                        }
                }
            } else {
                Utility.dismissProgressHUD()
                Utility.showToast(string: "Please Check your network connection.", vc: nil)
                print("Check your network connection.")
            }
        }
    }
    
    class func getParamAPI(url:String,isPrint: Bool = false,param:AnyObject!,completionHandler:@escaping (AnyObject?, NSError?)->()) ->() {
        autoreleasepool {
            if Utility.isConnectedToNetwork() {
                AF.request(url, method: HTTPMethod.get, parameters: param as? [String : AnyObject], encoding: URLEncoding(), headers: [ApiHeader.key:ApiHeader.value])
                    .validate()
                    .responseJSON { response in
                        switch response.result {
                        case .success(let value):
                            if (isPrint) {
                                print(value)
                            }
                            Utility.dismissProgressHUD()
                            do {
                                let someDictionaryFromJSON = try JSONSerialization.jsonObject(with: response.data!, options: .allowFragments)
                                completionHandler(someDictionaryFromJSON as AnyObject,nil)
                            } catch{
                                completionHandler(nil,response.error as NSError?)
                                print("Error : ",error)
                            }
                        case .failure(let error):
                            Utility.dismissProgressHUD()
                            completionHandler(nil,error as NSError?)
                            print("Request failed with error: \(error)")
                        }
                }
            } else {
                Utility.dismissProgressHUD()
                Utility.showToast(string: "Please Check your network connection.", vc: nil)
                print("Check your network connection.")
            }
        }
    }
    
    class func postAPI(_ url:String,isPrint: Bool = false,param:AnyObject!,completionHandler:@escaping (AnyObject?, NSError?)->()) ->()
    {
        autoreleasepool {
            if Utility.isConnectedToNetwork() {
                AF.request(url, method: .post, parameters: param as? [String : AnyObject], encoding: URLEncoding.default, headers: [ApiHeader.key:ApiHeader.value])
                    .responseJSON { response in
                        switch response.result {
                        case .success(let value):
                            if (isPrint) {
                                print(value)
                            }
                            Utility.dismissProgressHUD()
                            do {
                                let someDictionaryFromJSON = try JSONSerialization.jsonObject(with: response.data!, options: .allowFragments) as! [String: Any]
                                completionHandler(someDictionaryFromJSON as AnyObject?,nil)
                            } catch{
                                completionHandler(nil,response.error as NSError?)
                                print("Error : ",error)
                            }
                        case .failure(let error):
                            Utility.dismissProgressHUD()
                            completionHandler(nil,error as NSError?)
                            print("Request failed with error: \(error)")
                        }
                }
            }else{
                DispatchQueue.main.async(execute: {
                    Utility.dismissProgressHUD()
                    Utility.showToast(string: "Please Check your network connection.", vc: nil)
                    print("Check your network connection.")
                })
            }
        }
    }
    
    class func postAPIWithoutHeader(_ url:String,isPrint: Bool = false,param:AnyObject!,completionHandler:@escaping (AnyObject?, NSError?)->()) ->()
    {
        autoreleasepool {
            if Utility.isConnectedToNetwork() {
                AF.request(url, method: .post, parameters: param as? [String : AnyObject], encoding: URLEncoding.default, headers: nil)
                    .responseJSON { response in
                        switch response.result {
                        case .success(let value):
                            if (isPrint) {
                                print(value)
                            }
                            Utility.dismissProgressHUD()
                            do {
                                let someDictionaryFromJSON = try JSONSerialization.jsonObject(with: response.data!, options: .allowFragments) as! [String: Any]
                                completionHandler(someDictionaryFromJSON as AnyObject?,nil)
                            } catch{
                                completionHandler(nil,response.error as NSError?)
                                print("Error : ",error)
                            }
                        case .failure(let error):
                            Utility.dismissProgressHUD()
                            completionHandler(nil,error as NSError?)
                            print("Request failed with error: \(error)")
                        }
                }
            }else{
                DispatchQueue.main.async(execute: {
                    Utility.dismissProgressHUD()
                    Utility.showToast(string: "Please Check your network connection.", vc: nil)
                    print("Check your network connection.")
                })
            }
        }
    }
    
    
    
    class func requestWithImage(_ url:String,parameters: [String : Any], imageData: Data?, imageName: String,completionHandler: @escaping (AnyObject?, NSError?)->()) ->() {
        autoreleasepool {
            if Utility.isConnectedToNetwork() {
                let headers: HTTPHeaders = [ApiHeader.key:ApiHeader.value]
                AF.upload(multipartFormData: { (multipartFormData) in
                    for (key, value) in parameters {
                        multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
                    }
                    
                    if let data = imageData {
                        // multipartFormData.append(data, withName: imageName, fileName: "image.png", mimeType: "image/png")
                        multipartFormData.append(data, withName: imageName,fileName: "file.jpg", mimeType: "image/jpg")
                    }
                }, to: url, method: .post, headers: headers)
                    .responseJSON { (response) in
                        switch response.result {
                        case .success( _):
                            Utility.dismissProgressHUD()
                            do {
                                let someDictionaryFromJSON = try JSONSerialization.jsonObject(with: response.data!, options: .allowFragments) as! [String: Any]
                                completionHandler(someDictionaryFromJSON as AnyObject?,nil)
                            } catch{
                                completionHandler(nil,response.error as NSError?)
                                print("Error : ",error)
                            }
                        case .failure(let error):
                            Utility.dismissProgressHUD()
                            completionHandler(nil,error as NSError?)
                            print("Request failed with error: \(error)")
                        }
                }
            }else{
                DispatchQueue.main.async(execute: {
                    Utility.dismissProgressHUD()
                    Utility.showToast(string: "Please Check your network connection.", vc: nil)
                    print("Check your network connection.")
                })
            }
        }
    }
    
}

private var kAlertControllerWindow = "kAlertControllerWindow"
extension UIAlertController {
    
    var alertWindow: UIWindow? {
        get {
            return objc_getAssociatedObject(self, &kAlertControllerWindow) as? UIWindow
        }
        set {
            objc_setAssociatedObject(self, &kAlertControllerWindow, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    func show() {
        show(animated: true)
    }
    
    func show(animated: Bool) {
        alertWindow = UIWindow(frame: UIScreen.main.bounds)
        alertWindow?.rootViewController = UIViewController()
        alertWindow?.windowLevel = UIWindow.Level.alert + 1
        alertWindow?.makeKeyAndVisible()
        alertWindow?.rootViewController?.present(self, animated: animated, completion: nil)
    }
    
    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        alertWindow?.isHidden = true
        alertWindow = nil
    }
}
