

import UIKit


class AddReviewView: UIViewController, UITextViewDelegate  {
    
    @IBOutlet weak var ratingV: CosmosView!
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtReviewDesc: UITextView!
    @IBOutlet weak var btnDone: UIButton!
    
    var placeholderLabel : UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtReviewDesc.delegate = self
        placeholderLabel = UILabel()
        placeholderLabel.text = "Write a review"
        placeholderLabel.font = txtReviewDesc.font
        placeholderLabel.sizeToFit()
        txtReviewDesc.addSubview(placeholderLabel)
        placeholderLabel.frame.origin = CGPoint(x: 5, y: (txtReviewDesc.font?.pointSize)! / 2)
        placeholderLabel.textColor = UIColor.lightGray
        placeholderLabel.isHidden = !txtReviewDesc.text.isEmpty
        btnDone.backgroundColor = setGradientColor(button: btnDone, style: ltr, colors: [headercolor1,headercolor0])
    }
    
    
    @IBAction func actionDone(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func textViewDidChange(_ textView: UITextView) {
        placeholderLabel.isHidden = !textView.text.isEmpty
    }
    
}

