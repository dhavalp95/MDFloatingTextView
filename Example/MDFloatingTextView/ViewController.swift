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
        tvOne.flotingType = .insideBorder
        tvTwo.flotingType = .onBorder
        tvThree.flotingType = .outsideBorder
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

