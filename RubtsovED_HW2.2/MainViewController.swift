//
//  MainViewController.swift
//  RubtsovED_HW2.2
//
//  Created by Егор on 23.07.2021.
//

import UIKit

protocol SettingViewControllerDelegate {
    func setNewColor (color: UIColor)
}

class MainViewController: UIViewController {

    private var color = UIColor.white
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingVC = segue.destination as? SettingViewController else { return }
        settingVC.viewColor = view.backgroundColor
        settingVC.delegate = self
    }
}
extension MainViewController: SettingViewControllerDelegate {
    func setNewColor(color: UIColor) {
        view.backgroundColor = color
        self.color = color
    }
    
   
    
    }

