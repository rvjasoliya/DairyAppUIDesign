

import UIKit
import SwiftyJSON

struct BaseUrl
{
    static let url = "http://soordairyfresh.com/admin/webapi/User_api/"
}

struct ApiHeader {
    static let key = "X-Api-Key"
    static let value = "soor"
}

struct Apis {
    static let userLogin = BaseUrl.url + "UserLogin"
    static let userOrderList = BaseUrl.url + "UserOrderList"
    static let getItemCategoryList = BaseUrl.url + "GetItemCategoryList"
    static let masterItemList = BaseUrl.url + "MasterItemList"
    static let addToCart = BaseUrl.url + "AddToCart"
    static let userPlaceOrder = BaseUrl.url + "UserPlaceOrder"
    static let userRegistration = BaseUrl.url + "UserRegistration"
    static let userAddress = BaseUrl.url + "UserAddress"
    static let userAddressList = BaseUrl.url + "UserAddressList"
    static let updateUserPassword = BaseUrl.url + "UpdateUserPassword"
    static let forgotPassword = BaseUrl.url + ""
}
 

class NetworkManager {

    static func loginApi(param: [String: Any],callback: ((_ status: Bool ,_ scenarios: LoginData?,_ error: Error?)->Void)?) {
        Utility.postAPI(Apis.userLogin, isPrint: true,param: param as AnyObject) { (data, error) in
            Utility.dismissProgressHUD()
            if error == nil{
                if let result = data as? NSDictionary{
                    let rs = LoginResult(dictionary: result)
                    if rs?.status == 200 {
                        callback?(true,rs?.data,nil)
                    } else{
                        Utility.showFail((rs?.message ?? ""))
                        callback?(false,nil,nil)
                    }
                }
            } else {
                callback?(false,nil,error)
            }
        }
    }
    
    static func registrationApi(param: [String: Any],callback: ((_ status: Bool ,_ scenarios: LoginData?,_ error: Error?)->Void)?) {
        Utility.postAPI(Apis.userRegistration, isPrint: true,param: param as AnyObject) { (data, error) in
            Utility.dismissProgressHUD()
            if error == nil{
                if let result = data as? NSDictionary{
                    let rs = LoginResult(dictionary: result)
                    if rs?.status == 200 {
                        callback?(true,rs?.data,nil)
                    } else{
                        Utility.showFail((rs?.message ?? ""))
                        callback?(false,nil,nil)
                    }
                }
            } else {
                callback?(false,nil,error)
            }
        }
    }
    
    static func forgotApi(param: [String: Any],callback: ((_ status: Bool ,_ scenarios: LoginData?,_ error: Error?)->Void)?) {
        Utility.postAPI(Apis.forgotPassword, isPrint: true,param: param as AnyObject) { (data, error) in
            Utility.dismissProgressHUD()
            if error == nil{
                if let result = data as? NSDictionary{
                    if let statuss = result.value(forKey: "rstatus") as? Int, statuss == 200 {
                        Utility.showToast(string: ((result.value(forKey: "message") as? String) ?? ""), vc: nil)
                        //Utility.showSuccess((rs?.message ?? ""))
                        callback?(true,nil,nil)
                    } else{
                        Utility.showFail((result.value(forKey: "message") as? String) ?? "")
                        callback?(false,nil,nil)
                    }
                }
            } else {
                callback?(false,nil,error)
            }
        }
    }
    
    static func categoryListApi(callback: ((_ status: Bool ,_ scenarios: [CategoryData]?,_ error: Error?)->Void)?) {
        Utility.getParamAPI(url: Apis.getItemCategoryList, isPrint: false, param: nil) { (data, error) in
            Utility.dismissProgressHUD()
            if error == nil{
                if let result = data as? NSDictionary{
                    let rs = CategoryResult(dictionary: result)
                    if rs?.status == 200 {
                        callback?(true,rs?.data,nil)
                    } else{
                        Utility.showFail((rs?.message ?? ""))
                        callback?(false,nil,nil)
                    }
                }
            } else {
                callback?(false,nil,error)
            }
        }
    }
    
    static func getProductApi(param: [String: Any],callback: ((_ status: Bool ,_ scenarios: [ProductData]?,_ error: Error?)->Void)?) {
        Utility.postAPI(Apis.masterItemList, isPrint: true,param: param as AnyObject) { (data, error) in
            Utility.dismissProgressHUD()
            if error == nil{
                if let result = data as? NSDictionary{
                    let rs = ProductResult(dictionary: result)
                    if rs?.status == 200 {
                        callback?(true,rs?.data,nil)
                    } else{
                        Utility.showFail((rs?.message ?? ""))
                        callback?(false,nil,nil)
                    }
                }
            } else {
                callback?(false,nil,error)
            }
        }
    }
    
    
    
    
}
