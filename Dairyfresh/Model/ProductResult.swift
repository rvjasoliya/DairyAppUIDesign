
import Foundation

public class ProductResult {
	public var message : String?
	public var rstatus : Int?
	public var status : Int?
	public var data : Array<ProductData>?

    public class func modelsFromDictionaryArray(array:NSArray) -> [ProductResult]
    {
        var models:[ProductResult] = []
        for item in array
        {
            models.append(ProductResult(dictionary: item as! NSDictionary)!)
        }
        return models
    }

	required public init?(dictionary: NSDictionary) {
		message = dictionary["message"] as? String
		rstatus = dictionary["rstatus"] as? Int
		status = dictionary["status"] as? Int
        if (dictionary["data"] != nil) { data = ProductData.modelsFromDictionaryArray(array: dictionary["data"] as! NSArray) }
	}

	public func dictionaryRepresentation() -> NSDictionary {
		let dictionary = NSMutableDictionary()
		dictionary.setValue(self.message, forKey: "message")
		dictionary.setValue(self.rstatus, forKey: "rstatus")
		dictionary.setValue(self.status, forKey: "status")
		return dictionary
	}
}

public class ProductData {
    public var item_master_id : String?
    public var item_master_name : String?
    public var item_unit_id : String?
    public var item_unit_name : String?
    public var item_master_price : String?
    public var item_master_logo : String?
    var isFav = false

    public class func modelsFromDictionaryArray(array:NSArray) -> [ProductData]
    {
        var models:[ProductData] = []
        for item in array
        {
            models.append(ProductData(dictionary: item as! NSDictionary)!)
        }
        return models
    }

    required public init?(dictionary: NSDictionary) {
        item_master_id = dictionary["item_master_id"] as? String
        item_master_name = dictionary["item_master_name"] as? String
        item_unit_id = dictionary["item_unit_id"] as? String
        item_unit_name = dictionary["item_unit_name"] as? String
        item_master_price = dictionary["item_master_price"] as? String
        item_master_logo = dictionary["item_master_logo"] as? String
        if (checkFav(id: item_master_id ?? "")) {
            self.isFav = true
        } else{
            self.isFav = false
        }
    }

    public func dictionaryRepresentation() -> NSDictionary {
        let dictionary = NSMutableDictionary()
        dictionary.setValue(self.item_master_id, forKey: "item_master_id")
        dictionary.setValue(self.item_master_name, forKey: "item_master_name")
        dictionary.setValue(self.item_unit_id, forKey: "item_unit_id")
        dictionary.setValue(self.item_unit_name, forKey: "item_unit_name")
        dictionary.setValue(self.item_master_price, forKey: "item_master_price")
        dictionary.setValue(self.item_master_logo, forKey: "item_master_logo")
        return dictionary
    }
}
