//
//  Extension.swift
//  Climata
//
//  Created by Julius on 03/11/2020.
//  Copyright © 2020 Julius. All rights reserved.
//

import Foundation
import UIKit


extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor{
        return UIColor.init(red: red/255, green: green/255, blue: blue/255, alpha: 1.0)
    }
    
    static let mainGreen = UIColor.rgb(red: 38, green: 166, blue: 91)//green
    static let mainAmber = UIColor.rgb(red: 255, green: 191, blue: 0)//amber
    static let provaWhite = UIColor.rgb(red: 255, green: 255, blue: 255)
    static let porcelain = UIColor.rgb(red: 225, green: 221, blue: 217)//225    221    217 //#ffcccc
    static let primaryColor = UIColor.rgb(red: 255, green: 204, blue: 204)//255, 204, 204
    static let backgroundColor = UIColor.rgb(red: 25, green: 25, blue: 25)
    static let primaryBlue = UIColor.rgb(red: 73, green: 159, blue: 245)
    
    
}

extension UIView {
    
    func inputContainerView(image: UIImage, textField: UITextField) -> UIView {
        let view = UIView()
        let imageView = UIImageView()
        imageView.image = image
        //imageView.backgroundColor = .mainAmber
        imageView.tintColor = UIColor.black
        imageView.alpha = 0.87
        view.addSubview(imageView)
        imageView.centerY(inView: view)
        imageView.anchor(left: view.leftAnchor, paddingLeft: 8, width: 24, height: 24)
        
        view.addSubview(textField)
        textField.centerY(inView: view)
        textField.anchor(left: imageView.rightAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 8, paddingBottom: 8)
        //separator
        let separatorView = UIView()
        separatorView.backgroundColor = .lightGray
        view.addSubview(separatorView)
        separatorView.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 8, height: 0.75)
        
        
        return view
    }
    
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0,
                paddingLeft: CGFloat = 0,
                paddingBottom: CGFloat = 0,
                paddingRight: CGFloat = 0,
                width: CGFloat? = nil,
                height: CGFloat? = nil) {
        //You need to call this property so the image is added to your view
        translatesAutoresizingMaskIntoConstraints = false
        
        //use it
        // top exists?
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        // left exists?
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        // bottom exists?
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        // right exists?
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        //width/height
        // width exists?
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        // height exists?
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    //center x
    func centerX(inView view: UIView) {
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    //center y
    func centerY(inView view: UIView) {
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
}

extension UITextField {
    func textField(withPlaceholder placeholder: String, isSecureTextEntry: Bool ) -> UITextField {
        let tf = UITextField()
        tf.borderStyle = .none
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.textColor = .black
        tf.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor  : UIColor.lightGray])
        tf.isSecureTextEntry = isSecureTextEntry

        return tf
        
    }
    
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
        //return paddingView
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}

