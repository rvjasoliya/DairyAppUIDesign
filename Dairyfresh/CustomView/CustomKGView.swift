

import UIKit


class CustomKGView: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var txtCakeSize: UITextField!
    @IBOutlet weak var lblSelectPrice: UILabel!
    
    var pickerView = UIPickerView()
    
    var selectedSize: Double?
    var sizeList: [Double] = [1,1.5,2,2.5,3,3.5,4,4.5,5]
    
    typealias CompletionBlock = (_ size: Double) -> Void
    var onCompletion: CompletionBlock?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtCakeSize.becomeFirstResponder()
        pickerView = UIPickerView(frame: CGRect(x: 0, y: self.view.bounds.height, width: self.view.bounds.width, height: 216))
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.backgroundColor = UIColor(red: 234, green: 240, blue: 240)
        txtCakeSize.inputView = self.pickerView
    }
    
    
    @IBAction func actionDone(_ sender: Any) {
        if selectedSize == nil {
            myApp.window?.rootViewController?.view.makeToast("Select Cake Size", duration: 3.0, position: .bottom, style: style)
            return
        }
        
        if let size = selectedSize {
            if let comp = self.onCompletion {
                comp(size)
            }
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func setPrice() {
        if let size = selectedSize {
            let selectedSizePrice = (size*1000)
            self.lblSelectPrice.text = "Rs. \(selectedSizePrice)"
        }
    }
    
    //MARK:- textFieldDelegete
    func textFieldDidEndEditing(_ textField: UITextField) {
        if selectedSize == nil {
            if sizeList.count > 0 {
                txtCakeSize.text = "\(sizeList[0])"
                selectedSize = sizeList[0]
                self.setPrice()
            }
        }
    }
    
    //MARK:- PickerView Delegate & DataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sizeList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(sizeList[row]) kg"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if sizeList.count > row {
            txtCakeSize.text = "\(sizeList[row]) kg"
            selectedSize = sizeList[row]
            self.setPrice()
        }
        pickerView.endEditing(true)
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = "\(sizeList[row]) kg"
        let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        return myTitle
    }
    
}
