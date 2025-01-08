//
//  ViewController.swift
//  369Game
//
//  Created by Kyuhee hong on 1/8/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var gameTitleLabel: UILabel!
    @IBOutlet var inputTextfield: UITextField!
    @IBOutlet var numbersLabel: UILabel!
    @IBOutlet var clapResultLabel: UILabel!

    var pickerView = UIPickerView()
    var numberList: [Int] = []
    var selectedNumber: Int = 0 {
        didSet {
            clapResultLabel.text = "숫자 \(selectedNumber)까지 총 박수는 \(clapCount)번 입니다."
        }
    }
    
    var clapCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        makeNumberArray()
        
        setTextField()
        setPickerView()
    }
        
    func configureView() {
        gameTitleLabel.text = "369 게임"
        gameTitleLabel.font = .systemFont(ofSize: 34, weight: .bold)
        gameTitleLabel.textAlignment = .center
        
        inputTextfield.placeholder = "최대 숫자를 입력해주세요"
        inputTextfield.borderStyle = .line
        inputTextfield.font = .systemFont(ofSize: 24, weight: .medium)
        inputTextfield.textAlignment = .center
        
        numbersLabel.text = "숫자들"
        numbersLabel.font = .systemFont(ofSize: 22, weight: .light)
        numbersLabel.textColor = .gray
        numbersLabel.textAlignment = .center
        numbersLabel.numberOfLines = 0
        numbersLabel.frame.size = numbersLabel.intrinsicContentSize
        
        clapResultLabel.text = "숫자 \(selectedNumber)까지 총 박수는 \(clapCount)번 입니다."
        clapResultLabel.font = .systemFont(ofSize: 32, weight: .bold)
        clapResultLabel.textAlignment = .center
        clapResultLabel.numberOfLines = 0
    }
    
    func makeNumberArray() {
        for index in 1...100 {
            numberList.append(index)
        }
        numberList.reverse()
    }
}

extension ViewController: UITextFieldDelegate {

    func setTextField() {
        inputTextfield.delegate = self
        inputTextfield.inputView = pickerView
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        false
    }

    @IBAction func tapGestureRecognizerTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
        inputTextfield.text = ""
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func setPickerView() {
        pickerView.delegate = self
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        100
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(numberList[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let item = numberList[row]
        inputTextfield.text = String(item)
        selectedNumber = item
        drawNumbers(item)
    }
    
}

extension ViewController {
    
    func drawNumbers(_ selectedNumber: Int) {
        var numbersText: String = ""
        for index in 1...selectedNumber {
            numbersText += "\(index), "
            
            if index == selectedNumber {
                numbersText += "\(index)"
            }
        }
        numbersLabel.text = numbersText
    }
    
}
