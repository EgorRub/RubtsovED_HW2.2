//
//  MainViewController.swift
//  RubtsovED_HW2.2
//
//  Created by Егор on 23.07.2021.
//

import UIKit

protocol ColorViewControllerDelegate {
    func setNewColor (color: UIColor)
}
    
    
class MainViewController: UIViewController {
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingVC = segue.destination as? SettingViewController else { return }
        settingVC.color = view.backgroundColor
        settingVC.delegate = self
    }
}
extension MainViewController: ColorViewControllerDelegate {
    func setNewColor(color: UIColor) {
        view.backgroundColor = color
    }
    }

