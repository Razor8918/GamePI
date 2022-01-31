//
//  ComputerGuessViewController.swift
//  TestForProductivityInside
//
//  Created by Георгий Попандопуло on 28.01.2022.
//

import Foundation
import UIKit
import SnapKit

protocol ComputerGuessView: AnyObject {
    
}

final class ComputerGuessViewController: UIViewController {
    
     // MARK: - Internal Properties
     
    var presenter: ComputerGuessPresenter?
    
    // MARK: - Private Properties
    
    private let roundLabel = UILabel()
    private let computerGuessesLabel = UILabel()
    private let guessValueLabel = UILabel()
    private let buttonsStackView = UIStackView()
    private let lessButton = UIButton()
    private let equalButton = UIButton()
    private let greaterButton = UIButton()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupSubviews()
        setupConstraints()
        configureUI()
        configureButtons()
        configureStackView()
    }
}

// MARK: - Private Methods

private extension ComputerGuessViewController {
    func setupSubviews() {
        view.addSubview(roundLabel)
        view.addSubview(computerGuessesLabel)
        view.addSubview(guessValueLabel)
        view.addSubview(buttonsStackView)
        
    }
    
    func setupConstraints() {
        roundLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        computerGuessesLabel.snp.makeConstraints { make in
            make.top.equalTo(roundLabel.snp.bottom).offset(20)
            make.left.right.equalTo(roundLabel)
        }
        
        guessValueLabel.snp.makeConstraints { make in
            make.top.equalTo(computerGuessesLabel.snp.bottom).offset(60)
            make.left.right.equalTo(computerGuessesLabel)
        }
        
        buttonsStackView.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-80)
            make.centerX.equalToSuperview()
            make.height.equalTo(60)
        }
    }
    
    func configureUI() {
        if let roundText = presenter?.getRoundText() {
            roundLabel.text = roundText
        }
        roundLabel.textAlignment = .center
        
        computerGuessesLabel.text = "computer guesses"
        computerGuessesLabel.textAlignment = .center
        
        guessValueLabel.textAlignment = .center
        guard let value = presenter?.getGuessedValue() else { return }
        
        guessValueLabel.text = "number is - " + String(value)
    }
    
    func configureStackView() {
        [lessButton,
         equalButton,
         greaterButton
        ].forEach { button in
            button.layer.cornerRadius = 12
            button.layer.borderColor = UIColor.black.cgColor
            button.layer.borderWidth = 1
            button.setTitleColor(.black, for: .normal)
            
            button.snp.makeConstraints { make in
                make.width.equalTo(60)
            }
            
            buttonsStackView.addArrangedSubview(button)
        }
        
        buttonsStackView.spacing = 8
    }
    
    func configureButtons() {
        lessButton.setTitle(">", for: .normal)
        equalButton.setTitle("=", for: .normal)
        greaterButton.setTitle("<", for: .normal)
    
        lessButton.addTarget(self, action: #selector(lessButtonTapped), for: .touchUpInside)
        equalButton.addTarget(self, action: #selector(equalButtonTapped), for: .touchUpInside)
        greaterButton.addTarget(self, action: #selector(greaterButtonTapped), for: .touchUpInside)
    }
    
    @objc
    func lessButtonTapped() {
        presenter?.tappedActionButton(actionType: .less)
    }
    
    @objc
    func equalButtonTapped() {
        presenter?.tappedActionButton(actionType: .equal)
    }
    
    @objc
    func greaterButtonTapped() {
        presenter?.tappedActionButton(actionType: .greater)
    }
}

extension ComputerGuessViewController: ComputerGuessView {
    
}


