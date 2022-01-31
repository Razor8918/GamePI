//
//  RoundViewController.swift
//  TestForProductivityInside
//
//  Created by Георгий Попандопуло on 28.01.

import UIKit
import SnapKit

protocol RoundView: AnyObject {
    
}

final class RoundViewController: UIViewController {
    
     // MARK: - Internal Properties
     
    var presenter: RoundPresenter?
    
    // MARK: - Private Properties
    
    private let roundLabel = UILabel()
    private let enterNumberButton = UIButton()
    private let enterTextField = UITextField()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupSubviews()
        setupConstraints()
        configureUI()
        checkTextFieldState(isButtonEnabled: false)
    }
}

// MARK: - Private Methods

private extension RoundViewController {
    func setupSubviews() {
        view.addSubview(roundLabel)
        view.addSubview(enterNumberButton)
        view.addSubview(enterTextField)
    }
    
    func setupConstraints() {
        roundLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        enterNumberButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-40)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(45)
        }
        
        enterTextField.snp.makeConstraints { make in
            make.top.equalTo(roundLabel.snp.bottom).offset(20)
            make.left.right.equalTo(roundLabel)
        }
    }
    
    func configureUI() {
        roundLabel.text = "Round № 0"
        roundLabel.textAlignment = .center
        
        enterNumberButton.setTitle("Enter the Number", for: .normal)
        enterNumberButton.backgroundColor = .blue
        enterNumberButton.layer.cornerRadius = 16
        enterNumberButton.addTarget(self, action: #selector(enterNumberButtonTapped), for: .touchUpInside)
        
        enterTextField.placeholder = "Guess the number"
        enterTextField.textAlignment = .center
        enterTextField.borderStyle = .roundedRect
        enterTextField.keyboardType = .numberPad
        enterTextField.delegate = self
        enterTextField.setupDoneButton()
    }
    
    @objc
    func enterNumberButtonTapped() {
        guard let value = enterTextField.text else { return }
        let formattedValue = Int(value) ?? 0
        presenter?.showComputerGuessScreen(value: formattedValue)
    }
    
    func checkTextFieldState(isButtonEnabled: Bool) {
        enterNumberButton.isUserInteractionEnabled = isButtonEnabled
        enterNumberButton.alpha = isButtonEnabled ? 1 : 0.5
    }
}

extension RoundViewController: UITextFieldDelegate {
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
}

extension RoundViewController: RoundView {
        
}
