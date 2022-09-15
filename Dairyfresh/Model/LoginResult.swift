
import Foundation

public class LoginResult {
	public var message : String?
	public var rstatus : Int?
	public var status : Int?
	public var data : LoginData?

    public class func modelsFromDictionaryArray(array:NSArray) -> [LoginResult]
    {
        var models:[LoginResult] = []
        for item in array
        {
            models.append(LoginResult(dictionary: item as! NSDictionary)!)
        }
        return models
    }

	required public init?(dictionary: NSDictionary) {
		message = dictionary["message"] as? String
		rstatus = dictionary["rstatus"] as? Int
		status = dictionary["status"] as? Int
		if (dictionary["data"] != nil) { data = LoginData(dictionary: dictionary["data"] as! NSDictionary) }
	}

	public func dictionaryRepresentation() -> NSDictionary {
		let dictionary = NSMutableDictionary()
		dictionary.setValue(self.message, forKey: "message")
		dictionary.setValue(self.rstatus, forKey: "rstatus")
		dictionary.setValue(self.status, forKey: "status")
		dictionary.setValue(self.data?.dictionaryRepresentation(), forKey: "data")
		return dictionary
	}
}

public class LoginData: NSObject, NSCoding {
    public var tbl_users_device_id : String?
    public var tbl_users_platform : String?
    public var tbl_users_device_token : String?
    public var userId : String?
    public var name : String?
    public var mobile : String?
    public var email : String?
    public var tbl_user_image : String?

    public class func modelsFromDictionaryArray(array:NSArray) -> [LoginData]
    {
        var models:[LoginData] = []
        for item in array
        {
            models.append(LoginData(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    init(tbl_users_device_id: String?, tbl_users_platform: String?, tbl_users_device_token: String?,userId: String?, name: String?, mobile: String?, email: String?,tbl_user_image: String?) {
        self.tbl_users_device_id = tbl_users_device_id
        self.tbl_users_platform = tbl_users_platform
        self.tbl_users_device_token = tbl_users_device_token
        self.userId = userId
        self.name = name
        self.mobile = mobile
        self.email = email
        self.tbl_user_image = tbl_user_image
    }
    
    required public init?(dictionary: NSDictionary) {
        tbl_users_device_id = dictionary["tbl_users_device_id"] as? String
        tbl_users_platform = dictionary["tbl_users_platform"] as? String
        tbl_users_device_token = dictionary["tbl_users_device_token"] as? String
        userId = dictionary["userId"] as? String
        name = dictionary["name"] as? String
        mobile = dictionary["mobile"] as? String
        email = dictionary["email"] as? String
        tbl_user_image = dictionary["tbl_user_image"] as? String
    }
    
    public func dictionaryRepresentation() -> NSDictionary {
        let dictionary = NSMutableDictionary()
        dictionary.setValue(self.tbl_users_device_id, forKey: "tbl_users_device_id")
        dictionary.setValue(self.tbl_users_platform, forKey: "tbl_users_platform")
        dictionary.setValue(self.tbl_users_device_token, forKey: "tbl_users_device_token")
        dictionary.setValue(self.userId, forKey: "userId")
        dictionary.setValue(self.name, forKey: "name")
        dictionary.setValue(self.mobile, forKey: "mobile")
        dictionary.setValue(self.email, forKey: "email")
        dictionary.setValue(self.tbl_user_image, forKey: "tbl_user_image")
        return dictionary
    }
    
    required convenience public init(coder aDecoder: NSCoder) {
        let tbl_users_device_id = aDecoder.decodeObject(forKey: "tbl_users_device_id") as? String
        let tbl_users_platform = aDecoder.decodeObject(forKey: "tbl_users_platform") as? String
        let tbl_users_device_token = aDecoder.decodeObject(forKey: "tbl_users_device_token") as? String
        let userId = aDecoder.decodeObject(forKey: "userId") as? String
        let name = aDecoder.decodeObject(forKey: "name") as? String
        let mobile = aDecoder.decodeObject(forKey: "mobile") as? String
        let email = aDecoder.decodeObject(forKey: "email") as? String
        let tbl_user_image = aDecoder.decodeObject(forKey: "tbl_user_image") as? String
        
        self.init(tbl_users_device_id: tbl_users_device_id, tbl_users_platform: tbl_users_platform, tbl_users_device_token: tbl_users_device_token,userId: userId, name: name, mobile: mobile, email: email,tbl_user_image: tbl_user_image)
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(tbl_users_device_id, forKey: "tbl_users_device_id")
        aCoder.encode(tbl_users_platform, forKey: "tbl_users_platform")
        aCoder.encode(tbl_users_device_token, forKey: "tbl_users_device_token")
        aCoder.encode(userId, forKey: "userId")
        aCoder.encode(name, forKey: "name")
        aCoder.encode(mobile, forKey: "mobile")
        aCoder.encode(email, forKey: "email")
        aCoder.encode(tbl_user_image, forKey: "tbl_user_image")
    }
    
}


