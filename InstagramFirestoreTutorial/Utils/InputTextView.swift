//
//  InputTextView.swift
//  InstagramFirestoreTutorial
//
//  Created by 조성규 on 2022/09/19.
//

import UIKit

class InputTextView: UITextView {
    
    // MARK: - Properties
    
    var placeholderText: String? {
        didSet { placeholderLabel.text = placeholderText }
    }
    
    private let placeholderLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        return label
    }()
    
    var placeholderShouldCenter = true {
        didSet {
            if placeholderShouldCenter {
                placeholderLabel.anchor(leading: leadingAnchor, trailing: trailingAnchor, paddingLeading: 8)
                placeholderLabel.centerY(inView: self)
            } else {
                placeholderLabel.anchor(leading: leadingAnchor, trailing: trailingAnchor, paddingLeading: 8)
                
            }
        }
    }
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        configureTextView()
        
        addSubview(placeholderLabel)
        placeholderLabel.anchor(top: topAnchor, leading: leadingAnchor, paddingTop: 5, paddingLeading: 8)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleTextDidCnange), name: UITextView.textDidChangeNotification, object: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selectors
    
    @objc func handleTextDidCnange(){
        placeholderLabel.isHidden = !text.isEmpty
    }
    
    // MARK: - Helpers
    
    func configureTextView(){
        autocapitalizationType = .none
        autocorrectionType = .no
    }
}
