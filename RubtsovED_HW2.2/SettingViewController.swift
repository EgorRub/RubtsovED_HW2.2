//
//  ViewController.swift
//  RubtsovED_HW2.2
//
//  Created by Егор on 10.07.2021.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var viewColor: UIView!
    
    @IBOutlet weak var labelRed: UILabel!
    @IBOutlet weak var labelGreen: UILabel!
    @IBOutlet weak var labelBlue: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redSliderTF: UITextField!
    @IBOutlet weak var greenSliderTF: UITextField!
    @IBOutlet weak var blueSliderTF: UITextField!
    
    
    var delegate: SettingViewControllerDelegate!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewColor.layer.cornerRadius = 10
        
        redSlider.value = 1
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
        redSlider.tintColor = .red
        
        greenSlider.value = 1
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        greenSlider.tintColor = .green
        
        blueSlider.value = 1
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 1
        blueSlider.tintColor = .blue
        
        labelRed.text = String(redSlider.value)
        labelGreen.text = String(greenSlider.value)
        labelBlue.text = String(blueSlider.value)
        
        redSliderTF.delegate = self
        greenSliderTF.delegate = self
        blueSliderTF.delegate = self
        
    }

    @IBAction func redSliderAction() {
        labelRed.text = String(format: "%.2f", redSlider.value)
        changeColor()
        redSliderTF.text = labelRed.text
    }
    
    @IBAction func greenSliderAction() {
        labelGreen.text = String(format: "%.2f", greenSlider.value)
        changeColor()
        greenSliderTF.text = labelGreen.text
    }
    
    @IBAction func blueSliderAction() {
        labelBlue.text = String(format: "%.2f", blueSlider.value)
        changeColor()
        blueSliderTF.text = labelBlue.text
    }
    
    @IBAction func doneButtonPressed() {
        view.endEditing(true)
        delegate.setNewColor(color: viewColor.backgroundColor ?? .white)
        dismiss(animated: true)
    }
    }

extension SettingViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = textField.text else { return }
        guard let numberValue = Float(newValue) else { return }
        if textField == redSliderTF {
            redSlider.value = numberValue
        } else if textField == greenSliderTF {
            greenSlider.value = numberValue
        } else if textField == blueSliderTF {
            blueSlider.value = numberValue
        }
}
    private func changeColor() {
        viewColor.backgroundColor = UIColor(
            red: CGFloat((redSlider.value)),
            green: CGFloat((greenSlider.value)),
            blue: CGFloat((blueSlider.value)),
            alpha: 1)
        }
}
