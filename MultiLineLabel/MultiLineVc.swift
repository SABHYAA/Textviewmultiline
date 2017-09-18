//
//  MultiLineVc.swift
//  MultiLineLabel
//
//  Created by appinventiv on 18/09/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class MultiLineVc: UIViewController {
//-------------------------------Outlet----------------------------------------------//
    @IBOutlet weak var multilineTextView: UITextView!
    
    @IBOutlet weak var textheightConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        multilineTextView.isScrollEnabled = false
        self.multilineTextView.delegate = self
    }
}
//------------------------UITextViewDelegate-------------------------------------------//
extension MultiLineVc: UITextViewDelegate{
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//        print("chars \(textView.text.characters.count) \( text)")
//        print(range)
//        print(range.location)
//        print(range.length)
        
      //  if(textView.text.characters.count > 20 && range.length == 0) {
        if(textView.text.characters.count > 200) {
            print("Please summarize in 200 characters or less")
            return false
        }
        
        return true
    }
    func textViewDidChange(_ textView: UITextView) {
        let size = changetextviewheight(text: textView.text, font: UIFont(name: "Helvetica", size: 24.0)!, size: CGSize(width: UIScreen.main.bounds.size.width-60, height: 1000000))
        textheightConstraint.constant = size.height + 20
        
    }
    func changetextviewheight(text:String,font:UIFont,size:CGSize) -> CGSize {
        
        let attributes: [NSAttributedStringKey : AnyObject] = [NSAttributedStringKey(rawValue: NSAttributedStringKey.font.rawValue): font]
        
        let tempStr = NSString(string: text)
        
        let rect: CGRect = tempStr.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
       
        let height = ceilf(Float(rect.size.height))
        let width = ceilf(Float(rect.size.width))
        return CGSize(width: CGFloat(width), height: CGFloat(height))
    }
}
        
        
        
        
        
        


