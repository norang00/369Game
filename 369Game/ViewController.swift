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
    var selectedNumber: Int = 0
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
        
        numbersLabel.text = "입력한 숫자에 따른 박수를 알려드릴게요"
        numbersLabel.font = .systemFont(ofSize: 22, weight: .light)
        numbersLabel.textColor = .gray
        numbersLabel.textAlignment = .center
        numbersLabel.numberOfLines = 0
        numbersLabel.adjustsFontSizeToFitWidth = true
        numbersLabel.frame.size = numbersLabel.intrinsicContentSize
        
        clapResultLabel.text = "숫자 \(selectedNumber)까지 총 박수는\n\(clapCount)번 입니다."
        clapResultLabel.font = .systemFont(ofSize: 32, weight: .bold)
        clapResultLabel.textColor = .black
        clapResultLabel.textAlignment = .center
        clapResultLabel.numberOfLines = 0
        clapResultLabel.adjustsFontSizeToFitWidth = true
        clapResultLabel.frame.size = numbersLabel.intrinsicContentSize
        clapResultLabel.isHidden = true
    }
    
    func makeNumberArray() {
        for index in 1...1000 {
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
        clapCount = 0
        inputTextfield.text = ""
        numbersLabel.text = "입력한 숫자에 따른 박수를 알려드릴게요"
        clapResultLabel.isHidden = true
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func setPickerView() {
        pickerView.delegate = self
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        print(numberList.count) // ViewDidLoad 가 먼저인가?
        return numberList.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(numberList[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let item = numberList[row]
        clapCount = 0
        inputTextfield.text = String(item)
        selectedNumber = item
        drawNumbers(item)
    }
    
}

extension ViewController {
    
    func drawNumbers(_ selectedNumber: Int) {
        var numbersText: String = ""
        for index in 1...selectedNumber {
            if index != selectedNumber {
                numbersText += check369(index) + ", "
            } else {
                numbersText += check369(index)
            }
        }
        clapResultLabel.isHidden = false
        numbersLabel.text = numbersText
        clapResultLabel.text = "숫자 \(selectedNumber)까지 총 박수는\n\(clapCount)번 입니다."
    }
    
    func check369(_ number:Int) -> String {
        let check: [Character] = String(number).map { $0 }
        var result = ""
        for index in 0..<check.count {
            if ["3","6","9"].contains(check[index]) {
                result += "👏"
                clapCount += 1
            } else {
                result += "\(check[index])"
            }
        }
        return result
    }
    
}
