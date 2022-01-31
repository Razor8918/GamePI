//
//  HumanGuessViewController.swift
//  TestForProductivityInside
//
//  Created by Георгий Попандопуло on 29.01.2022.
//

import UIKit
import Foundation
import SnapKit

protocol HumanGuessView: AnyObject {
    
}

final class HumanGuessViewController: UIViewController {
   
    // MARK: - Internal Properties
    
    var presenter: HumanGuessPresenter?
    
    // MARK: - Private Properties
    
    private let roundLabel = UILabel()
    private let youGuessesLabel = UILabel()
    private let enterNumberTextField = UITextField()
    private let resultLabel = UILabel()
    private let bottomButton = UIButton()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupSubviews()
        setupConstraints()
        configureUI()
        configureBottomButton()
        checkTextFieldState(isButtonEnabled: false)
    }
}

// MARK: - Private Methods

private extension HumanGuessViewController {
    func setupSubviews() {
        [roundLabel,
         youGuessesLabel,
         enterNumberTextField,
         resultLabel,
         bottomButton
        ].forEach { customView in
            view.addSubview(customView)
        }
        
    }
    
    func setupConstraints() {
        roundLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        youGuessesLabel.snp.makeConstraints { make in
            make.top.equalTo(roundLabel.snp.bottom).offset(20)
            make.left.right.equalTo(roundLabel)
        }
        
        enterNumberTextField.snp.makeConstraints { make in
            make.top.equalTo(youGuessesLabel.snp.bottom).offset(60)
            make.left.right.equalTo(youGuessesLabel)
        }
        
        resultLabel.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-80)
            make.centerX.equalToSuperview()
            make.height.equalTo(60)
        }
        
        bottomButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-40)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(45)
        }
    }
    
    func configureUI() {
        if let roundText = presenter?.getRoundText() {
            roundLabel.text = roundText
        }
        roundLabel.textAlignment = .center
        
        youGuessesLabel.text = "You Guesses"
        youGuessesLabel.textAlignment = .center
        
        enterNumberTextField.placeholder = "Enter the number"
        enterNumberTextField.textAlignment = .center
        enterNumberTextField.borderStyle = .roundedRect
        enterNumberTextField.keyboardType = .numberPad
        enterNumberTextField.delegate = self
        enterNumberTextField.setupDoneButton()
    }
    
    func configureBottomButton() {
        bottomButton.setTitle("Next Round", for: .normal)
        bottomButton.backgroundColor = .blue
        bottomButton.layer.cornerRadius = 16
        bottomButton.addTarget(self, action: #selector(bottomButtonTapped), for: .touchUpInside)
    }
    
    func checkTextFieldState(isButtonEnabled: Bool) {
        bottomButton.isUserInteractionEnabled = isButtonEnabled
        bottomButton.alpha = isButtonEnabled ? 1 : 0.5
    }
    
    @objc
    func bottomButtonTapped() {
        presenter?.touchBottomButton()
    }
}

extension HumanGuessViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let maxRange = text.count == 2 && !string.isEmpty
        
        let isTextFieldEmpty = (!text.isEmpty && text.count == 1 && string.isEmpty) || (text.isEmpty && string.isEmpty)
        
        if text.isEmpty && string == "0" {
            checkTextFieldState(isButtonEnabled: false)
            return false
        }
        
        checkTextFieldState(isButtonEnabled: !isTextFieldEmpty)
        
        return maxRange ? false : true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let value = enterNumberTextField.text else { return }
        let formattedValue = Int(value) ?? 0
        
        presenter?.setValue(guessValue: formattedValue)
    }
}


extension HumanGuessViewController: HumanGuessView {
    
}


