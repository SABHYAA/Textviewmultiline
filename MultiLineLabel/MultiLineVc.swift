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
    override func viewDidLoad() {
        super.viewDidLoad()

        self.multilineTextView.delegate = self
    }
}
//------------------------UITextViewDelegate-------------------------------------------//
extension MultiLineVc: UITextViewDelegate{
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        print("chars \(textView.text.characters.count) \( text)")
        
//        if(textView.text.characters.count > 20 && range.length == 0) {
        if(textView.text.characters.count > 200) {
            print("Please summarize in 200 characters or less")
            return false
        }
        
        return true
    }
}
