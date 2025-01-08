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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()


    }

    
    // MARK: - View Settings
    
    func configureView() {
        gameTitleLabel.text = "369 게임"
        gameTitleLabel.font = .systemFont(ofSize: 34, weight: .bold)
        gameTitleLabel.textAlignment = .center
        
        inputTextfield.placeholder = "최대 숫자를 입력해주세요"
        inputTextfield.borderStyle = .line
        inputTextfield.font = .systemFont(ofSize: 24, weight: .medium)
        inputTextfield.textAlignment = .center
        
        numbersLabel.text = "1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18"
        numbersLabel.font = .systemFont(ofSize: 24, weight: .light)
        numbersLabel.textColor = .lightGray
        numbersLabel.textAlignment = .center
        numbersLabel.numberOfLines = 0
        numbersLabel.frame.size = numbersLabel.intrinsicContentSize
        
        clapResultLabel.text = "숫자 99까지 총 박수는 45번 입니다."
        clapResultLabel.font = .systemFont(ofSize: 32, weight: .bold)
        clapResultLabel.textAlignment = .center
        clapResultLabel.numberOfLines = 0
    }


    
    
    
}

