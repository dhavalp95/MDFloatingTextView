//
//  ViewController.swift
//  MDFloatingTextView
//
//  Created by dhaval on 08/16/2020.
//  Copyright (c) 2020 dhaval. All rights reserved.
//

import UIKit
import MDFloatingTextView

class ViewController: UIViewController {

    //MARK:- Outlet
    @IBOutlet weak var tvOne: MDFloatingTextView!
    @IBOutlet weak var tvTwo: MDFloatingTextView!
    @IBOutlet weak var tvThree: MDFloatingTextView!
    
    //------------------------------------------------------
    
    //MARK:- Class Variable
    
    //------------------------------------------------------
    
    
    //MARK:- Memory Management Method
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        
    }
    
    //------------------------------------------------------
    
    //MARK:- Custom Method
    
    func setUpView() {
        
        //Setup first textview
        tvOne.flotingType = .insideBorder
        tvOne.titleBgColor = .clear
        tvOne.layer.cornerRadius = 8
        tvOne.layer.borderColor = UIColor.red.cgColor
        tvOne.layer.borderWidth = 1.5
        tvOne.textContainerInset = UIEdgeInsets(top: 20, left: 12, bottom: 12, right: 12)
        tvOne.font = UIFont.systemFont(ofSize: 16)
        
        
        //Setup second textview
        tvTwo.flotingType = .onBorder
        tvTwo.titleInsideEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        tvTwo.layer.cornerRadius = 8
        tvTwo.layer.borderColor = UIColor.systemBlue.cgColor
        tvTwo.layer.borderWidth = 1.5
        tvTwo.textContainerInset = UIEdgeInsets(top: 15, left: 10, bottom: 10, right: 10)
        tvTwo.font = UIFont.systemFont(ofSize: 18)
        
        
        //Setup third textview
        tvThree.flotingType = .outsideBorder
        tvThree.titleInsideEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 5, right: 0)
        tvThree.layer.cornerRadius = 8
        tvThree.layer.borderColor = UIColor.purple.cgColor
        tvThree.layer.borderWidth = 1.5
        tvThree.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tvThree.font = UIFont.systemFont(ofSize: 18)
        
    }
    
    //------------------------------------------------------
    
    //MARK:- Action Method
    
    
    //------------------------------------------------------
    
    //MARK:- Life Cycle Method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
}

