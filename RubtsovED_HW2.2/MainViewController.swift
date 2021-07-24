//
//  MainViewController.swift
//  RubtsovED_HW2.2
//
//  Created by Егор on 23.07.2021.
//

import UIKit

protocol MainViewControllerProtocol {
    var redSliderValue: Int { get }
    var greenSliderValue: Int { get }
    var blueSliderValue: Int { get }
}

class MainViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.green
        
        
    }
    


}
