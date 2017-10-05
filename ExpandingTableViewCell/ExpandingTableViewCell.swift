//
//  ExpandingTableViewCell.swift
//  ExpandingTableViewCell
//
//  Created by Aurimas Bavarskis on 04/10/2017.
//  Copyright © 2017 Aurimas Bavarskis. All rights reserved.
//

import UIKit
protocol ExpandingTableViewCellDelegate: class {
    func didChangeText(text: String?, cell: ExpandingTableViewCell)
}

class ExpandingTableViewCell: UITableViewCell, UITextViewDelegate {
    @IBOutlet weak var textView: UITextView!
    weak var delegate: ExpandingTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        textView.delegate = self
        textView.isEditable = true
        textView.text = "Start typing: ..."
        textView.isScrollEnabled = false
    }
    
    func textViewDidChange(_ textView: UITextView) {
        delegate?.didChangeText(text: textView.text, cell: self)
    }
}
