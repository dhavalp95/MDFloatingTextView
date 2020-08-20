//
//  MDFloatingTextView.swift
//  MDFloatingTextView
//
//  Created by dhaval on 16/08/20.
//

import Foundation
import UIKit

public class MDFloatingTextView: UITextView {
    
    //MARK:- Placeholder Inspectable Property
    @IBInspectable public var placeholderText   : String    = "Description" {
        didSet {    lblPlaceholder.text = placeholderText   }
    }
    @IBInspectable public var placeholderFont   : UIFont    = UIFont.systemFont(ofSize: 16) {
        didSet {    lblPlaceholder.font = placeholderFont   }
    }
    @IBInspectable public var placeholderColor  : UIColor   = .gray {
        didSet {    lblPlaceholder.textColor = placeholderColor }
    }
    
    //MARK:- Title Inspectable Property
    @IBInspectable public var titleText         : String?   = nil {
        didSet {    btnFlotingTitle.setTitle(titleText, for: .normal)}
    }
    @IBInspectable public var titleFont         : UIFont    = UIFont.systemFont(ofSize: 12) {
        didSet {    btnFlotingTitle.titleLabel?.font = titleFont  }
    }
    @IBInspectable public var titleColor        : UIColor   = .blue {
        didSet {    btnFlotingTitle.setTitleColor(titleColor, for: .normal)   }
    }
    @IBInspectable public var titleBgColor      : UIColor   = .white {
        didSet {    btnFlotingTitle.backgroundColor = titleBgColor  }
    }
    @IBInspectable public var titleLeadingSpace : CGFloat   = 12
    
    //MARK:- Private variables
    private var lblPlaceholder = UILabel()
    private var btnFlotingTitle = UIButton(type: .custom)
    private var _titleText: String {
        return self.titleText ?? placeholderText
    }
    
    //MARK:- Public variable
    ///Define floating type of textview title
    public var flotingType: FlotingType = .onBorder
    
    ///Inside EdgeInsets of title label
    public var titleInsideEdgeInsets: UIEdgeInsets = UIEdgeInsets(top: .zero, left: .zero, bottom: .zero, right: .zero) {
        didSet{ btnFlotingTitle.contentEdgeInsets = titleInsideEdgeInsets}
    }
    
    //MARK:- Class Enum
    public enum FlotingType:Int {
        case insideBorder, onBorder, outsideBorder
    }
    
     //MARK:- Life Cycle Method
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        //Setup textview
        textContainerInset = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        
        //Setup placehodler
        lblPlaceholder.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        lblPlaceholder.lineBreakMode = .byWordWrapping
        lblPlaceholder.numberOfLines = 0
        lblPlaceholder.translatesAutoresizingMaskIntoConstraints = false
        lblPlaceholder.textColor = placeholderColor
        lblPlaceholder.text = placeholderText
        lblPlaceholder.font = placeholderFont
        lblPlaceholder.backgroundColor = .clear
        lblPlaceholder.frame = placeholderExpectedFrame
        addSubview(lblPlaceholder)
        
        //Setup title label
        btnFlotingTitle.setTitle(_titleText, for: .normal)
        btnFlotingTitle.titleLabel?.font = titleFont
        btnFlotingTitle.setTitleColor(titleColor, for: .normal)
        btnFlotingTitle.backgroundColor = titleBgColor
        btnFlotingTitle.frame = titleLabelFrame
        superview!.addSubview(btnFlotingTitle)
        textDidChange()
        
        //add observer
        NotificationCenter.default.addObserver(self, selector: #selector(textDidChange), name: UITextView.textDidChangeNotification, object: nil)
    }
    
    deinit {
        lblPlaceholder.removeFromSuperview()
        btnFlotingTitle.removeFromSuperview()
        NotificationCenter.default.removeObserver(self)
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        updateFrames()
    }
    
    //MARK:- Override Property
    override public var text: String? {
        didSet {    self.textDidChange()    }
    }
    
    override public var alpha: CGFloat {
        didSet{ btnFlotingTitle.alpha = self.alpha  }
    }
    
    override public var isHidden: Bool {
        didSet{ btnFlotingTitle.isHidden = self.isHidden    }
    }
    
    //MARK:- Action Methods
    @objc private func textDidChange() {
        updateFrames()
        self.lblPlaceholder.alpha = self.text!.isEmpty ? 1 : 0
        self.btnFlotingTitle.alpha = self.text!.isEmpty ? 0 : 1
    }
    
    private func updateFrames() {
        lblPlaceholder.frame = placeholderExpectedFrame
        btnFlotingTitle.frame = titleLabelFrame
    }
    
    //------------------------------------------------------
    //MARK: Setup placeholder
    private var placeholderInsets: UIEdgeInsets {
        return UIEdgeInsets(top: self.textContainerInset.top, left: self.textContainerInset.left + self.textContainer.lineFragmentPadding, bottom: self.textContainerInset.bottom, right: self.textContainerInset.right + self.textContainer.lineFragmentPadding)
    }
    
    private var placeholderExpectedFrame: CGRect {
        let placeholderInsets = self.placeholderInsets
        let maxWidth = self.frame.width-placeholderInsets.left-placeholderInsets.right
        let expectedSize = lblPlaceholder.sizeThatFits(CGSize(width: maxWidth, height: self.frame.height-placeholderInsets.top-placeholderInsets.bottom))
        
        return CGRect(x: placeholderInsets.left, y: placeholderInsets.top, width: maxWidth, height: expectedSize.height)
    }
    
    //------------------------------------------------------
    //MARK: Setup title label
    
    private var titleLabelFrame: CGRect {
        let labelSize = btnFlotingTitle.titleLabel!.text!.sizeOfString(font: titleFont)
        let width = labelSize.width+titleInsideEdgeInsets.left+titleInsideEdgeInsets.right
        
        var y: CGFloat = .zero
        switch self.flotingType {
        case .insideBorder: y = frame.minY+1
        case .onBorder: y = frame.minY-(labelSize.height/2)-titleInsideEdgeInsets.top
        case .outsideBorder: y = frame.minY-labelSize.height-titleInsideEdgeInsets.top-titleInsideEdgeInsets.bottom
        }
        
        return CGRect(x: (self.userInterfaceLayoutDirection == .leftToRight) ? (frame.minX+titleLeadingSpace) : (frame.maxX-titleLeadingSpace-width),
                      y: y,
                      width: labelSize.width+titleInsideEdgeInsets.left+titleInsideEdgeInsets.right,
                      height: labelSize.height+titleInsideEdgeInsets.top+titleInsideEdgeInsets.bottom)
    }
}

//MARK:- Helper Extension
fileprivate extension String {
    func sizeOfString(font : UIFont) -> CGSize {
        return self.boundingRect(with: CGSize(width: Double.greatestFiniteMagnitude,
                                              height: Double.greatestFiniteMagnitude),
                                 options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                 attributes: [NSAttributedString.Key.font: font],
                                 context: nil).size
    }
}

fileprivate extension UIView {
    ///Returns text and UI direction based on current view settings
    var userInterfaceLayoutDirection: UIUserInterfaceLayoutDirection{
        if #available(iOS 9.0, *) {
            return UIView.userInterfaceLayoutDirection(for: self.semanticContentAttribute)
        } else {
            return UIApplication.shared.userInterfaceLayoutDirection
        }
    }
}
