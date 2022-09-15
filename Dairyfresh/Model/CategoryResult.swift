
import Foundation
 

public class CategoryResult {
	public var message : String?
	public var rstatus : Int?
	public var status : Int?
	public var data : Array<CategoryData>?

    public class func modelsFromDictionaryArray(array:NSArray) -> [CategoryResult]
    {
        var models:[CategoryResult] = []
        for item in array
        {
            models.append(CategoryResult(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
	required public init?(dictionary: NSDictionary) {
		message = dictionary["message"] as? String
		rstatus = dictionary["rstatus"] as? Int
		status = dictionary["status"] as? Int
        if (dictionary["data"] != nil) { data = CategoryData.modelsFromDictionaryArray(array: dictionary["data"] as! NSArray) }
	}

	public func dictionaryRepresentation() -> NSDictionary {
		let dictionary = NSMutableDictionary()
		dictionary.setValue(self.message, forKey: "message")
		dictionary.setValue(self.rstatus, forKey: "rstatus")
		dictionary.setValue(self.status, forKey: "status")
		return dictionary
	}
}

public class CategoryData {
    public var item_category_id : String?
    public var item_category_name : String?
    public var item_category_logo : String?

    public class func modelsFromDictionaryArray(array:NSArray) -> [CategoryData]
    {
        var models:[CategoryData] = []
        for item in array
        {
            models.append(CategoryData(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    required public init?(dictionary: NSDictionary) {
        item_category_id = dictionary["item_category_id"] as? String
        item_category_name = dictionary["item_category_name"] as? String
        item_category_logo = dictionary["item_category_logo"] as? String
    }
    
    public func dictionaryRepresentation() -> NSDictionary {
        let dictionary = NSMutableDictionary()
        dictionary.setValue(self.item_category_id, forKey: "item_category_id")
        dictionary.setValue(self.item_category_name, forKey: "item_category_name")
        dictionary.setValue(self.item_category_logo, forKey: "item_category_logo")
        return dictionary
    }
}
