//
//  NewGameViewController.swift
//  TestForProductivityInside
//
//  Created by Георгий Попандопуло on 28.01.2022.
//

import UIKit
import SnapKit

protocol NewGameView: AnyObject {
    
}

final class NewGameViewController: UIViewController {
    
    // MARK: - Internal Properties
    
    var presenter: NewGamePresenter?
    
    // MARK: - Private Properties
    
    private let gameNameLabel = UILabel()
    private let startNewGameButton = UIButton()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupSubviews()
        setupConstraints()
        configureUI()
    }
}

// MARK: - Private Methods

private extension NewGameViewController {
    func setupSubviews() {
        view.addSubview(gameNameLabel)
        view.addSubview(startNewGameButton)
    }
    
    func setupConstraints() {
        gameNameLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        startNewGameButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-40)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(45)
        }
    }
    
    func configureUI() {
        gameNameLabel.text = "gameNew"
        gameNameLabel.textAlignment = .center
        
        startNewGameButton.setTitle("Start New Game", for: .normal)
        startNewGameButton.backgroundColor = .blue
        startNewGameButton.layer.cornerRadius = 16
        startNewGameButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        
    }
    
    @objc
    func startButtonTapped() {
        presenter?.startNewGame()
    }
}

extension NewGameViewController: NewGameView {
    
}

