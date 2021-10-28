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
    
    
    var delegate: ColorViewControllerDelegate!
    var color: UIColor!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewColor.layer.cornerRadius = 10
        redSlider.tintColor = .red
        greenSlider.tintColor = .green
        
        setMinMaxValue(for: redSlider, greenSlider, blueSlider)
        setSliders()
        
        setValue(for: labelRed, labelGreen, labelBlue)
        setTextFieldValue(for: redSliderTF, greenSliderTF, blueSliderTF)
        
    }

    @IBAction func redSliderAction() {
        labelRed.text = String(format: "%.2f", redSlider.value)
        changeColor()
        setValue(for: labelRed)
        setTextFieldValue(for: redSliderTF)
    }
    
    @IBAction func greenSliderAction() {
        labelGreen.text = String(format: "%.2f", greenSlider.value)
        changeColor()
        setValue(for: labelGreen)
        setTextFieldValue(for: greenSliderTF)
    }
    
    @IBAction func blueSliderAction() {
        labelBlue.text = String(format: "%.2f", blueSlider.value)
        changeColor()
        setValue(for: labelBlue)
        setTextFieldValue(for: blueSliderTF)
    }
    
    @IBAction func doneButtonPressed() {
        view.endEditing(true)
        delegate.setNewColor(color: viewColor.backgroundColor ?? .white)
        dismiss(animated: true)
    }
    
}
extension SettingViewController {
    
    private func changeColor() {
        viewColor.backgroundColor = UIColor(
            red: CGFloat((redSlider.value)),
            green: CGFloat((greenSlider.value)),
            blue: CGFloat((blueSlider.value)),
            alpha: 1)
        }
    private func setSliders() {
            let ciColor = CIColor(color: color)
            redSlider.value = Float(ciColor.red)
            greenSlider.value = Float(ciColor.green)
            blueSlider.value = Float(ciColor.blue)
        }
    
    
    private func setMinMaxValue(for sliders: UISlider...) {
        
        sliders.forEach { slider in
            slider.value = 1
            slider.minimumValue = 0
            slider.maximumValue = 1
        }
    }
    
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    @objc private func didTapButton() {
        view.endEditing(true)
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case labelRed:
                label.text = string(from: redSlider)
            case labelGreen:
                label.text = string(from: greenSlider)
            default:
                label.text = string(from: blueSlider)
            }
        }
    }
    
    private func setTextFieldValue(for textFields: UITextField...) {
        textFields.forEach { textField in
            switch textField {
            case redSliderTF:
                textField.text = string(from: redSlider)
            case greenSliderTF:
                textField.text = string(from: greenSlider)
            default:
                textField.text = string(from: blueSlider)
            }
        }
    }
}

extension SettingViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        
        if let currentValue = Float(text) {
            switch textField {
            case redSliderTF:
                redSlider.setValue(currentValue, animated: true)
                setValue(for: labelRed)
            case greenSliderTF:
                greenSlider.setValue(currentValue, animated: true)
                setValue(for: labelGreen)
            default:
                blueSlider.setValue(currentValue, animated: true)
                setValue(for: labelBlue)
            }
            
            changeColor()
            return
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let keyboardToolBar = UIToolbar()
        textField.inputAccessoryView = keyboardToolBar
        keyboardToolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(
            title: "Done",
            style: .done,
            target: self,
            action: #selector(didTapButton)
        )
        
        let flexBarButton = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        
        keyboardToolBar.items = [flexBarButton, doneButton]
    }
}
